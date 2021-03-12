#!/bin/python

# Script to dump text lists with pointers
# We make an assumption that objects will be adjacent to each other

import os, sys
from collections import OrderedDict
from functools import partial
sys.path.append(os.path.join(os.path.dirname(__file__), 'common'))
from common import utils, tilesets


version_src_path = sys.argv[1]
text_src_path = sys.argv[2]
text_build_path = sys.argv[3]

roms = ({
    "kabuto" : "baserom_kabuto.gbc",
    "kuwagata" : "baserom_kuwagata.gbc",
})

default_version = "kabuto"

list_map = ({
    # 'Type' : (Start of Pointers, Strings per pointer, Terminator(s), (fixed length, fixed padding), print hex, 'null' indicator, data prefix)
    'Unknown00' : ((0x27, 0x44FC), 1, [None], [(20, 0x00)], [True], None, [0xC9]),
    'PartsHead' : ((0x23, 0x4671), 2, [0xCB, 0xCB], [(7, 0x00), (10, 0x00)], [False, False], None, None),
    'PartsRArm' : ((0x23, 0x529A), 2, [0xCB, 0xCB], [(7, 0x00), (10, 0x00)], [False, False], None, None),
    'PartsLArm' : ((0x23, 0x5EC3), 2, [0xCB, 0xCB], [(7, 0x00), (10, 0x00)], [False, False], None, None),
    'PartsLegs' : ((0x23, 0x6AEC), 2, [0xCB, 0xCB], [(7, 0x00), (10, 0x00)], [False, False], None, None),
    'Attributes' : ((0x22, 0x65C0), 1, [0xCB], [(None, None)], [False], None, None),
    'Skills' : ((0x22, 0x664C), 1, [0xCB], [(None, None)], [False], None, None),
    'Movement' : ((0x22, 0x669A), 1, [0xCB], [(None, None)], [False], None, None),
    'Unknown08' : ((0x22, 0x66DC), 1, [None], [(14, 0x00)], [True], None, None),
    'Personalities' : ((0x22, 0x68BC), 1, [0xCB], [(None, None)], [False], None, None),
    'Medaforce' : ((0x22, 0x6979), 2, [None, 0xCB], [(6, 0x00), (None, None)], [True, False], r'\x00\x00\x00\x00\x00\x00', None),
    'Medals' : ((0x23, 0x795B), 1, [0xCB], [(None, None)], [False], None, None),
    'Unknown0C' : ((0x22, 0x6901), 1, [None], [(2, 0x00)], [True], None, None),
    'Items' : ((0x23, 0x7715), 2, [0xCB, None], [(9, 0x00), (1, None)], [False, True], None, None),
    'Unknown0E' : ((0x20, 0x4000), 1, [None], [(4, 0x00)], [True], None, None),
    'Medarotters' : ((0x20, 0x4328), 2, [None, 0xCB], [(3, 0x00), (None, None)], [True, False], None, None),
    'Unknown10' : ((0x20, 0x4EA4), 1, [None], [(35, 0x00)], [True], None, None),
    'Terrain' : ((0x23, 0x7A23), 1, [0xCB], [(None, None)], [False], None, None),
    'Attacks' : ((0x23, 0x7A80), 1, [0xCB], [(None, None)], [False], None, None),
    'CharacterNames' : ((0x21, 0x4000), 1, [0xCB], [(None, None)], [False], None, None),
    'Unknown14' : ((0x21, 0x461B), 1, [None], [(11, 0x00)], [True], None, None),
    'Medarots' : ((0x23, 0x4000), 1, [0xCB], [(None, None)], [False], None, None),
})

tileset = utils.merge_dicts([
            tilesets.get_tileset("MainDialog1", override_offset=0x0),
            tilesets.get_tileset("MainDialog2", override_offset=0x80),
            tilesets.get_tileset("Special", override_offset=0xE0)
        ])

kanji = tilesets.get_tileset("Kanji", override_offset=0x0)

with open(os.path.join(version_src_path, "ptrlist_data.asm"), "w") as datafile:
    constants_file = os.path.join(text_build_path, f"ptrlist_data_constants_{{GAMEVERSION}}.asm")
    datafile.write(f'INCLUDE "{constants_file}"\n\n')
    for l in list_map:
        addr, spp, term, fix_len, print_hex, null_indicator, data_prefix = list_map[l]
        if isinstance(addr, tuple):
            bank = addr[0]
            addr = utils.rom2realaddr(addr)
        else:
            bank = utils.real2romaddr(addr)[0]
        
        datafile.write(f'SECTION "Pointer List - {l}", ROMX[${utils.real2romaddr(addr)[1]:04x}], BANK[${bank:02x}]\n')
        datafile.write(f'PtrList{l}::\n')
        datafile.write(f'  INCBIN c{l}\n\n')

        entries = OrderedDict()
        with open(os.path.join(text_src_path, f"{l}.txt"), "w", encoding="utf-8") as output:
            output.write(str(list_map[l][1:]) + "\n")
            count_written = False
            for version_suffix in roms:            
                with open(os.path.join(version_src_path, f"{version_suffix}/ptrlist_data.asm"), 'w') as datafile_version:
                    include_file = os.path.join(version_src_path, "ptrlist_data.asm")
                    datafile_version.write(f'INCLUDE "{include_file}"\n')
                with open(roms[version_suffix], "rb") as rom:
                    rom.seek(addr)
                    # Make the (probably) safe assumption that the end of the table is the pointer 
                    # before the first pointer
                    end = utils.rom2realaddr((bank, utils.read_short(rom) - 2))
                    # Seeing the same pointer twice is an 
                    # indicator that we've hit the last actual value in the table
                    rom.seek(end)
                    dummy_pointer = utils.read_short(rom)
                    rom.seek(-4, 1)
                    if utils.read_short(rom) != dummy_pointer:
                        dummy_pointer = -1

                    rom.seek(addr)

                    ptrs = []
                    
                    if not count_written:
                        output.write(f"{((end - addr) // 2) + 1}\n")
                        output.write(f"{dummy_pointer}\n")
                        count_written = True

                    while rom.tell() <= end:
                        val = utils.read_short(rom)
                        if val == dummy_pointer:
                            break
                        if val in ptrs:
                            # Duplicate
                            ptrs.append(f"##={ptrs.index(val)}")
                        else:
                            ptrs.append(val)

                    for idx, ptr in enumerate(ptrs):
                        
                        if idx not in entries:
                            entries[idx] = {}
                        if version_suffix not in entries[idx]:
                            entries[idx][version_suffix] = []

                        if isinstance(ptr, str):
                            entries[idx][version_suffix].append(ptr)
                        else:
                            real_addr = utils.rom2realaddr((bank, ptr))
                            rom.seek(real_addr)
                            for i in range(0, spp):
                                t = term[i]

                                fl = fix_len[i][0]
                                ph = print_hex[i]

                                b = []

                                if fl != None:
                                    b = [utils.read_byte(rom) for i in range(0, fl)]
                                else:
                                    b = list(iter(partial(utils.read_byte, rom), t))
                                    if len(b) == 0:
                                        b = [t]            
                                txt = ""
                                i = 0
                                while i < len(b):
                                    if b[i] == 0xD3 and not ph: # Kanji
                                        i += 1
                                        txt += kanji[b[i]]
                                    else:
                                        if ph or b[i] not in tileset:
                                            txt += f'\\x{b[i]:02x}'
                                        else:
                                            txt += tileset[b[i]]
                                    i += 1
                                entries[idx][version_suffix].append(txt)
                                if txt == null_indicator:
                                    break
            
            for idx in entries:
                unique_set = set("".join(v) for v in entries[idx].values())
                if len(entries[idx]) != 2 or len(unique_set) > 1:
                    for version in entries[idx]:
                        for entry in entries[idx][version]:
                            output.write(f"{version}#{entry}")
                            output.write('\n')
                else:
                    for entry in entries[idx][default_version]:
                        output.write(entry)
                        output.write('\n')
