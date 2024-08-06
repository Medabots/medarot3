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
TYPE_PREFIX = "PtrList"

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

# '{TYPE_PREFIX}#' for text, 'Pointers' is where pointers should go
# We assume 0x4000 is enough to cover all 3-byte pointers

current_index = 0 # {TYPE_PREFIX}0
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
                is_general = utils.read_byte(in_f)
                total = utils.read_short(in_f)
                dummy = utils.read_short(in_f)
                count = utils.read_short(in_f)


                # We don't need to account for the dummy or total, just the actual count
                offsets = [(utils.read_short(in_f), utils.read_short(in_f)) for i in range(0, count)]

                if not is_general:
                    # If the text isn't meant to be part of the general list, just use 2-byte pointers and handle it 'normally'
                    initial_offset = sections[key][1] + len(offsets) * 2
                    pointers = [pack("<H", (ptrs[0] + initial_offset) if ptrs[0] < 0x7fff else ptrs[0]) for ptrs in offsets]
                    pointers[0] = bytearray(pointers[0])
                    b = reduce((lambda x, y: x + bytearray(y)), pointers)  
                    out_f.write(b)
                    out_f.write(in_f.read())
                else:
                    # At this point, we're at the actual text in the file
                    for ptrs in offsets:
                        length = ptrs[1] # We only care about the length, the offset is calculated
                        
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
                        current_fp.write(in_f.read(length))
                        current_offset += length           
            output.write(f'DEF c{key}        EQUS "\\"{output_path}\\""\n')
    finally:
        if current_fp:
            current_fp.close()
    
    current_index += 1
    while f"{TYPE_PREFIX}{current_index}" in sections:
        current_file = os.path.join(output_bin_dir, f"{TYPE_PREFIX}{current_index}_{version_suffix}.bin")
        output.write(f'DEF c{TYPE_PREFIX}{current_index}        EQUS "\\"{current_file}\\""\n')
        current_index += 1
