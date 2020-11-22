# Convert a single dialog csv file into a binary format for use with dialogbin2asm
# The file format is [Relative Offsets to text][[Text]
from collections import OrderedDict
from functools import reduce
from struct import *
import os
import csv
import re
import sys

sys.path.append(os.path.join(os.path.dirname(__file__), 'common'))
from common import utils, tilesets

output_file = sys.argv[1]
input_file = sys.argv[2]
column_name = sys.argv[3]
version_suffix = sys.argv[4]

base_name = os.path.splitext(os.path.basename(input_file))[0]
char_table = utils.reverse_dict(utils.merge_dicts([
            tilesets.get_tileset("MainDialog1", override_offset=0x0),
            tilesets.get_tileset("MainDialog2", override_offset=0x80),
            tilesets.get_tileset("Special", override_offset=0xE0)
        ]))
kanji = utils.reverse_dict(tilesets.get_tileset("Kanji", override_offset=0x0))
ptr_names = utils.read_table(os.path.join(os.path.dirname(__file__), 'res', 'ptrs.tbl'), keystring=True)

with open(input_file, 'r', encoding='utf-8') as fp:
    reader = csv.reader(fp, delimiter=',', quotechar='"')
    header = next(reader, None)
    idx_index = header.index("Index[#version]")
    idx_pointer = header.index("Pointer[#version|]")
    idx_text = header.index(column_name)

    # Keep track of the offset from the start
    bintext = bytearray()
    pointer_offset_map = {}
    pointer_length_map = {}

    for line in reader:
        # Comment
        if line[0].startswith('#'):
            continue

        # Get version specific pointer and index
        # TODO: We should probably guarantee the index order...
        index = line[idx_index].split('#')
        if len(index) > 1 and index[1] != version_suffix:
            continue
        else:
            index = index[0]
        pointer = line[idx_pointer].split('|')
        if len(pointer) > 1:
            pointer = next(p.split('#')[0] for p in pointer if p.split('#')[1] != version_suffix)
            if not pointer:
                continue

        txt = line[idx_text]

        # Pointer to existing text
        if txt.startswith('='): 
            ptr = int(txt.lstrip('='), 16)
            pointer_offset_map[int(line[idx_pointer], 16)] = pointer_offset_map[ptr]
            pointer_length_map[int(line[idx_pointer], 16)] = 0
            continue
        

        # Keep track of the current offset (unused text must be inserted but the offsets won't be recorded)
        l = len(bintext)
        pointer_offset_map[pointer] = l




open(output_file, 'wb').close()