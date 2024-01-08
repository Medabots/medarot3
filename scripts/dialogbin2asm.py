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

bin_files = {}
bank = 0
base_offset = 0

# How this gets processed will be completely different between tr_EN and master, so it should not be expected that this will be reused

for input_file in input_files:
    base_name = os.path.basename(input_file)
    output_path = os.path.join(output_bin_dir, base_name)
    key = os.path.splitext(base_name)[0].rpartition(f"_{version_suffix}")[0]
    bin_files[key] = output_path

    with open(data_file, 'r') as df, open(version_data_file, 'r') as vdf:
        src = df.read() + vdf.read()

    for line in src.splitlines():
        if line.startswith('SECTION') and f'"{key}"' in line:
            o = line.lstrip('SECTION ').replace(' ', '').replace('\n','').replace('\r\n','').replace('"','').split(',')
            #Name ROMX[$OFFSET] BANK[$BANK]
            bank = int(o[2].replace('BANK','').replace('[','').replace(']','').replace('$','0x'), 16)
            ptr_table_offset = int(o[1].replace('ROMX','').replace('[','').replace(']','').replace('$','0x'), 16)
            break
    else:
        raise Exception(f"Could not find {key} section in {data_file}")

    with open(input_file, 'rb') as in_f:
        count = utils.read_short(in_f)
        offsets = [(utils.read_short(in_f), utils.read_short(in_f)) for i in range(0, count)]
        init_text_offsets = list(map(lambda x: pack("<H", x[0] + (2 * (len(offsets))) + ptr_table_offset), offsets)) # Don't really need to bother with using the length information in master
        with open(output_path, 'wb') as out_f:
            if len(offsets):
                init_text_offsets[0] = bytearray(init_text_offsets[0])
                b = reduce( (lambda x, y: x + bytearray(y)), init_text_offsets)           
                out_f.write(b)
            out_f.write(in_f.read()) # The rest of the file is the actual text, so just read it entirely

with open(output_file, 'w') as output:
    for k in bin_files:
        output.write(f'DEF c{k}        EQUS "\\"{bin_files[k]}\\""\n')