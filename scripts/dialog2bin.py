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
            tilesets.get_tileset("VWF", override_offset=0x0),
        ]))
kanji = utils.reverse_dict(tilesets.get_tileset("Kanji", override_offset=0x0))
assert((set(kanji.keys()) - set(char_table.keys())) == set(kanji.keys()))
ptr_names = utils.read_table(os.path.join(os.path.dirname(__file__), 'res', 'ptrs.tbl'), keystring=True)

with open(input_file, 'r', encoding='utf-8-sig') as fp:
    reader = csv.reader(fp, delimiter=',', quotechar='"')
    header = next(reader, None)
    idx_index = header.index("Index[#version]")
    idx_pointer = header.index("Pointer[#version|]")
    idx_text = header.index(column_name)

    # Keep track of the offset from the start
    bintext = bytearray()
    pointer_offset_map = OrderedDict()
    pointer_length_map = OrderedDict()

    for line in reader:
        # Comment
        if line[0].startswith('#'):
            continue

        # Get version specific pointer and index
        index = line[idx_index].split('#')
        if len(index) > 1 and index[1] != version_suffix:
            continue
        else:
            index = index[0]

        pointer = line[idx_pointer].split('|')
        if len(pointer) > 1:
            pointer = next(p.split('#')[0] for p in pointer if p.split('#')[1] == version_suffix)
            if not pointer:
                continue
        else:
            pointer = pointer[0]

        txt = line[idx_text]

        # Pointer to existing text
        if txt.startswith('@'): 
            ptr = txt.lstrip('@')
            pointer_offset_map[pointer] = pointer_offset_map[ptr]
            pointer_length_map[pointer] = 0
            continue
        elif not txt: # For translations, it's useful to mark the pointer when not translated
            txt = f"{pointer.partition('0x')[-1].upper()}"
            try:
                idx_original = header.index("Original")
                txt_orig = line[idx_original]
                
                # Keep track of the speed if it's set initially
                txt = (txt_orig[0:5] if txt_orig.startswith("<S") else "") + txt
                
                # If the original has a special exit code, preserve it
                txt += txt_orig[txt_orig.index("<*"):]
            except ValueError:
                pass

        # Keep track of the current offset
        # Unused text must be inserted but the offsets won't be recorded in the final output file
        l = len(bintext)
        pointer_offset_map[pointer] = l

        # This is the first of the unused sections in the text table
        # Nothing to do but set the length to 0 and move on
        if txt == "<FINAL>":
            pointer_length_map[pointer] = 0
            continue

        no_terminator = False
        if txt.startswith("<NOTERM:"):
            no_terminator = True
            txt = txt[len("<NOTERM:"):-1]

        text_length = len(txt)
        i = 0
        endcode = 0x00
        while i < text_length:
            try:
                if txt[i] != '<':
                    try:
                        if txt[i] in kanji:
                            bintext.append(0xD3)
                            bintext.append(kanji[txt[i]])
                        else:
                            bintext.append(char_table[txt[i]])
                    except KeyError as e:
                        print(f"[{pointer}]: KeyError {e}")
                        print(f"\t{txt}")
                        raise e
                else:
                    i += 1
                    special_type = txt[i]
                    i += 1
                    special_data = []
                    while txt[i] != '>':
                        special_data.append(txt[i])
                        i += 1
                    # Handle special codes
                    if special_type == '*': # Endcode
                        endcode = int(''.join(special_data), 16)
                        break
                    elif special_type == 'S': # Text Speed Change
                        bintext.append(0xCE)
                        bintext.append(int(''.join(special_data), 16))
                    elif special_type == '&': # Pull text from pointer
                        bintext.append(0xD0)
                        s = ''.join(special_data)
                        if s in ptr_names:
                            s = ptr_names[s].lstrip('0x')
                        bintext.append(int(s[2:4], 16))
                        bintext.append(int(s[0:2], 16))
                    elif special_type == '$': # Literal byte
                        bintext.append(int(''.join(special_data), 16))
                    elif special_type == '@': # Portraits
                        s = (''.join(special_data)).split(',')
                        orientation = s[0]
                        portrait_id = int(s[1], 16)
                        expression = int(s[2], 16)
                        bintext.append(0xD2)
                        bintext.append(
                            {
                                'LL' : 0x00, 
                                'LR' : 0x01,
                                'RL' : 0x10,
                                'RR' : 0x11,
                                'CC' : 0xFF,
                            }[orientation]
                        )
                        bintext.append(portrait_id)
                        bintext.append(expression)
                    # In tr_EN, D3 is reused as a universal linebreak
                    #elif special_type == 'K': # Kanji
                    #    bintext.append(0xD3)
                    #    bintext.append(int(''.join(special_data), 16))
                    elif special_type == 'C' or special_type == 'D': # The remaining types are just single byte control codes
                        bintext.append(int( special_type + ''.join(special_data), 16))
                    elif special_type == 'f': # Font type
                        s = ''.join(special_data)
                        result.append(0xD4)
                        result.append(special_data, 16) # f[00, FF], 0 is normal
                    else:
                        raise Exception(f"Unknown special_type {special_type} in {txt}")
            finally:
                i += 1

        if not no_terminator and len(txt):
            bintext.append(0xCC)
            bintext.append(endcode)

        # The length is just the old length minus the new length
        pointer_length_map[pointer] = len(bintext) - l

# Record the offset list of all the text that is not marked 'UNUSED'
# Sort the pointer_offset_map as duplicate lines are at the bottom fo the file
offsets = [(pointer_offset_map[key], pointer_length_map[key]) for key in sorted(pointer_offset_map.keys()) if not key.startswith("UNUSED")]
init_text_offsets = list(map(lambda x: pack("<HH", x[0], x[1]), offsets))

# Generate binary
with open(output_file, 'wb') as bin_file:
    bin_file.write(pack("<H", len(offsets)))
    if len(offsets):
        init_text_offsets[0] = bytearray(init_text_offsets[0])
        b = reduce( (lambda x, y: x + bytearray(y)), init_text_offsets)
        bin_file.write(b)
    bin_file.write(bintext)