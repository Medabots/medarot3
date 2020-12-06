#!/bin/python

import os, sys
from collections import OrderedDict
from functools import reduce
from struct import *
from ast import literal_eval
sys.path.append(os.path.join(os.path.dirname(__file__), 'common'))
from common import utils, tilesets

char_table = utils.reverse_dict(utils.merge_dicts([
            tilesets.get_tileset("VWF", override_offset=0x0),
        ]))
kanji = utils.reverse_dict(tilesets.get_tileset("Kanji", override_offset=0x0))
assert((set(kanji.keys()) - set(char_table.keys())) == set(kanji.keys()))

def chr2bin(c):
    retval = char_table['?']
    if c in kanji:
        retval = [0xD3, kanji[c]]
    elif c in char_table:
        retval = char_table[c]
    return retval

def convert_text(txt, term, fix_len):
    assert(term != None or fix_len != None)

    retval = []
    length = None
    padding = None
    term_found = False

    if fix_len != None:
        length, padding = fix_len

    idx = 0
    c = None

    while idx < len(txt):
        try:
            c = txt[idx]
            if c == '\\':
                assert(txt[idx+1] == 'x')
                c = txt[idx+2]
                c += txt[idx+3]
                idx += 3
                c = int(c, 16)
            else:
                c = chr2bin(c)

            if c == term:
                term_found = True
            
            if isinstance(c, list):
                retval += c
            else:    
                retval.append(c)
        finally:
            idx += 1

    if term != None and not term_found:
        retval.append(term)

    if length and len(retval) < length:
        retval += [padding] * (length - len(retval))
    elif length and len(retval) > length:
        print(retval)
        raise Exception(f"{txt} is too long ({len(retval)} > {length})")

    return bytearray(retval)


output_file = sys.argv[1]
input_file = sys.argv[2]
version_suffix = sys.argv[3]

base_name = os.path.splitext(os.path.basename(input_file))[0]

bintext = bytearray()
idx_offset_map = OrderedDict()
idx_length_map = OrderedDict()
count = 0
dummy_ptr = -1

with open(input_file, 'r', encoding='utf-8') as fp:
    # (Strings per pointer, Terminator(s), (fixed length, fixed padding), print hex)
    spp, term, fix_len, _, null_indicator, data_prefix = literal_eval(fp.readline().strip())
    assert(spp > 0)
    # Total count, includes empty entries in the table
    count = int(fp.readline().strip())
    dummy_ptr = int(fp.readline().strip())

    if data_prefix:
        bintext += bytearray(data_prefix)

    idx = 0
    for line in fp:
        # Duplicate pointer
        if line.startswith("##="): 
            i = int(line.split('=')[1])
            idx_offset_map[idx] = idx_offset_map[i]
            idx_length_map[idx] = 0
            idx += 1
            continue

        current_offset = len(bintext)
        idx_offset_map[idx] = current_offset
        
        # For each string in this pointer, note it
        s = 0
        while s < spp:
            line = line.split("#")
            if len(line) > 1:
                if line[0] != version_suffix:
                    # In a single string situation, break out of the loop and just let the iterator handle it
                    if spp == 1:
                        break
                    line = next(fp)
                    continue
                else:
                    line = line[1]
            else:
                line = line[0]
            line = line.strip('\r\n')
            bintext += convert_text(line, term[s], fix_len[s])
            if line == null_indicator:
                # Skip so we normally break out instead of skipping the index
                s = spp
                continue
            s += 1
            # Manually iterate for each string in this pointer
            if s != spp:
                line = next(fp)
        else:
            # The length is just the old length minus the new length            
            idx_length_map[idx] = len(bintext) - current_offset
            idx += 1


# Generate binary
with open(output_file, 'wb') as bin_file:
    bin_file.write(pack("<H", count))
    bin_file.write(pack("<H", dummy_ptr if dummy_ptr != -1 else 0xFFFF))
    offsets = [(idx_offset_map[key], idx_length_map[key]) for key in sorted(idx_offset_map.keys())]
    init_text_offsets = list(map(lambda x: pack("<HH", x[0], x[1]), offsets))

    bin_file.write(pack("<H", len(offsets)))
    if len(offsets):
        init_text_offsets[0] = bytearray(init_text_offsets[0])
        b = reduce( (lambda x, y: x + bytearray(y)), init_text_offsets)
        bin_file.write(b)
    bin_file.write(bintext)
