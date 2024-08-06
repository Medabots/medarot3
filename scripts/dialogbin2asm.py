from functools import reduce
import os
import sys
from struct import *

sys.path.append(os.path.join(os.path.dirname(__file__), 'common'))
from common import utils

output_file = sys.argv[1]
output_bin_dir = sys.argv[2]
version_suffix = sys.argv[3]
data_file = sys.argv[4]
version_data_file = sys.argv[5]
input_files = sys.argv[6:]

BANK_MAX = 0x7fff
TYPE_PREFIX = "Text"

total_free_space = 0

sections = {} # Available sections in the ROM to store data

with open(data_file, 'r') as df, open(version_data_file, 'r') as vdf:
    src = df.read() + vdf.read()

for line in src.splitlines():
    if line.startswith('SECTION'):
        o = line.lstrip('SECTION ').replace(' ', '').replace('\n','').replace('\r\n','').replace('"','').split(',')
        name = o[0]
        if o[1].startswith("ROM0"):
            ptr_table_offset = int(o[1].replace('ROM0','').replace('[','').replace(']','').replace('$','0x'), 16)
            bank = 0
        else:
            ptr_table_offset = int(o[1].replace('ROMX','').replace('[','').replace(']','').replace('$','0x'), 16)
            bank = int(o[2].replace('BANK','').replace('[','').replace(']','').replace('$','0x'), 16)
        sections[name] = (bank, ptr_table_offset)
        if name.startswith(TYPE_PREFIX):
            open(os.path.join(output_bin_dir, f"{name}_{version_suffix}.bin"), 'wb').close()
            # 'TextPointers' specifically only contains the pointers and is fixed, so we don't care about that length
            if not name.startswith(f"{TYPE_PREFIX}Pointers"):
                total_free_space += BANK_MAX - ptr_table_offset + 1

current_free_space = total_free_space

# 'Text#' for text, 'Pointers' is where pointers should go
# We actually need 1.5ish banks to cover all 3-byte pointers, but it's a fixed size (refer to text_tables.asm)
current_index = 0 # Text0
current_bank = sections[f"{TYPE_PREFIX}{current_index}"][0]
current_offset = sections[f"{TYPE_PREFIX}{current_index}"][1]
current_file = os.path.join(output_bin_dir, f"{TYPE_PREFIX}{current_index}_{version_suffix}.bin")
current_fp = None

with open(output_file, 'w') as output:
    try:
        current_fp = open(current_file, 'wb')
        output.write(f'DEF c{TYPE_PREFIX}{current_index}        EQUS "\\"{current_file}\\""\n')
        for input_file in input_files:
            base_name = os.path.basename(input_file)
            output_path = os.path.join(output_bin_dir, base_name)
            key = os.path.splitext(base_name)[0].rpartition(f"_{version_suffix}")[0]

            with open(input_file, 'rb') as in_f, open(output_path, 'wb') as out_f:
                count = utils.read_short(in_f)
                offsets = [(utils.read_short(in_f), utils.read_short(in_f)) for i in range(0, count)]
                text_start = in_f.tell() # Use this to adjust the offset later
                duplicate_offset_map = {} # Keep track of the offsets of everything in case we hit a duplicate

                # At this point, we're at the actual text in the file
                for ptrs in offsets:
                    offset = ptrs[0]
                    length = ptrs[1]

                    if offset in duplicate_offset_map:
                        out_f.write(pack("<BH", duplicate_offset_map[offset][0], duplicate_offset_map[offset][1]))
                        continue

                    if length + current_offset > BANK_MAX:
                        current_fp.close()
                        current_index += 1
                        current_bank = sections[f"{TYPE_PREFIX}{current_index}"][0]
                        current_offset = sections[f"{TYPE_PREFIX}{current_index}"][1]
                        current_file = os.path.join(output_bin_dir, f"{TYPE_PREFIX}{current_index}_{version_suffix}.bin")
                        current_fp = open(current_file, 'wb')
                        assert length + current_offset < BANK_MAX, "Text is too long"
                        output.write(f'DEF c{TYPE_PREFIX}{current_index}        EQUS "\\"{current_file}\\""\n')

                    out_f.write(pack("<BH", current_bank, current_offset))
                    duplicate_offset_map[offset] = (current_bank, current_offset)

                    # Follow the offset so we avoid UNUSED text
                    in_f.seek(offset + text_start) 

                    current_fp.write(in_f.read(length))
                    current_offset += length
                    current_free_space -= length
            
            output.write(f'DEF c{key}        EQUS "\\"{output_path}\\""\n')
    finally:
        if current_fp:
            current_fp.close()
    
    current_index += 1
    while f"{TYPE_PREFIX}{current_index}" in sections:
        current_file = os.path.join(output_bin_dir, f"{TYPE_PREFIX}{current_index}_{version_suffix}.bin")
        output.write(f'DEF c{TYPE_PREFIX}{current_index}        EQUS "\\"{current_file}\\""\n')
        current_index += 1

    # Note how much free space is remaining, and send a warning to GitHub Actions if we're running low
    percent_remaining = (current_free_space/total_free_space) * 100
    if current_free_space <= 0x4000:
        print(f"::warning file=scripts/dialogbin2asm.py,line=1,col=1,endColumn=1::Less than one bank of free space remaining.")
    print(f"Free space remaining: {current_free_space} bytes ({percent_remaining:.0f}%) out of {total_free_space} bytes")
