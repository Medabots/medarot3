#!/bin/python

# Script to dump text lists with pointers
# We make an assumption that objects will be adjacent to each other

import csv
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

default_tileset = utils.merge_dicts([
            tilesets.get_tileset("MainDialog1", override_offset=0x0),
            tilesets.get_tileset("MainDialog2", override_offset=0x80),
            tilesets.get_tileset("Special", override_offset=0xE0)
        ])

kanji = tilesets.get_tileset("Kanji", override_offset=0x0)


list_map = ({
    # 'Type' : (Start of Pointers, Strings per pointer, Label(s), Terminator(s), (fixed length, fixed padding), print hex, 'null' indicator, data prefix, in general pointer list, special tileset)
    'Unknown00' : ((0x27, 0x44FC), 1, [], [None], [(20, 0x00)], [True], None, [0xC9], True, None),
    'PartsHead' : ((0x23, 0x4671), 3, ["Model", "Name", "IsFemale"], [0xCB, 0xCB, None], [(7, 0x00), (9, 0x00), (1, 0x00)], [False, False, True], None, None, True, None),
    'PartsRArm' : ((0x23, 0x529A), 3, ["Model", "Name", "IsFemale"], [0xCB, 0xCB, None], [(7, 0x00), (9, 0x00), (1, 0x00)], [False, False, True], None, None, True, None),
    'PartsLArm' : ((0x23, 0x5EC3), 3, ["Model", "Name", "IsFemale"], [0xCB, 0xCB, None], [(7, 0x00), (9, 0x00), (1, 0x00)], [False, False, True], None, None, True, None),
    'PartsLegs' : ((0x23, 0x6AEC), 3, ["Model", "Name", "IsFemale"], [0xCB, 0xCB, None], [(7, 0x00), (9, 0x00), (1, 0x00)], [False, False, True], None, None, True, None),
    'Attributes' : ((0x22, 0x65C0), 1, ["AttributeName"], [0xCB], [(None, None)], [False], None, None, True, None),
    'Skills' : ((0x22, 0x664C), 1, ["SkillName"], [0xCB], [(None, None)], [False], None, None, True, None),
    'Movement' : ((0x22, 0x669A), 1, ["Movement"], [0xCB], [(None, None)], [False], None, None, True, None),
    'Unknown08' : ((0x22, 0x66DC), 1, [], [None], [(14, 0x00)], [True], None, None, True, None),
    'Personalities' : ((0x22, 0x68BC), 1, ["Personality"], [0xCB], [(None, None)], [False], None, None, True, None),
    'Medaforce' : ((0x22, 0x6979), 2, ["Unknown", "Medaforce"], [None, 0xCB], [(6, 0x00), (None, None)], [True, False], r'\x00\x00\x00\x00\x00\x00', None, True, None),
    'Medals' : ((0x23, 0x795B), 1, ["MedalName"], [0xCB], [(None, None)], [False], None, None, True, None),
    'Unknown0C' : ((0x22, 0x6901), 1, [], [None], [(2, 0x00)], [True], None, None, True, None),
    'Items' : ((0x23, 0x7715), 2, ["ItemName", "Flags"], [0xCB, None], [(9, 0x00), (1, None)], [False, True], None, None, True, None),
    'Unknown0E' : ((0x20, 0x4000), 1, [], [None], [(4, 0x00)], [True], None, None, True, None),
    'Medarotters' : ((0x20, 0x4328), 2, ["Unknown", "Name"], [None, 0xCB], [(3, 0x00), (None, None)], [True, False], None, None, True, None),
    'Unknown10' : ((0x20, 0x4EA4), 1, [], [None], [(35, 0x00)], [True], None, None, True, None),
    'Terrain' : ((0x23, 0x7A23), 1, ["Terrain"], [0xCB], [(None, None)], [False], None, None, True, None),
    'Attacks' : ((0x23, 0x7A80), 1, ["AttackName"], [0xCB], [(None, None)], [False], None, None, True, None),
    'CharacterNames' : ((0x21, 0x4000), 1, ["CharacterName"], [0xCB], [(None, None)], [False], None, None, True, None),
    'Unknown14' : ((0x21, 0x461B), 1, [], [None], [(11, 0x00)], [True], None, None, True, None),
    'Medarots' : ((0x23, 0x4000), 1, ["MedarotName"], [0xCB], [(None, None)], [False], None, None, True, None),
    'GlossaryTerms' : ((0x7, 0x60d5), 2, ["Unknown", "Term"], [None, 0xCB], [(1, None), (None, None)], [True, False], None, None, False, None),
    'Credits' : ((0x16, 0x5505), 2, ["Unknown", "Name"], [None, None], [(4, None), (0x10, 0xFF)], [True, False], None, None, False, "Credits"),
})

with open(os.path.join(version_src_path, "ptrlist_data.asm"), "w") as datafile:
    constants_file = os.path.join(text_build_path, f"ptrlist_data_constants_{{GAMEVERSION}}.asm")
    datafile.write(f'INCLUDE "{constants_file}"\n\n')
    for l in list_map:
        addr, spp, labels, term, fix_len, print_hex, null_indicator, data_prefix, is_general, special_tileset = list_map[l]
        
        if special_tileset:
            tileset = tilesets.get_tileset(special_tileset, override_offset=0x0)
        else:
            tileset = default_tileset

        assert len(labels) == 0 or len(labels) == spp, f"Incorrect number of labels for {l}"
        if isinstance(addr, tuple):
            bank = addr[0]
            addr = utils.rom2realaddr(addr)
        else:
            bank = utils.real2romaddr(addr)[0]

        datafile.write(f'SECTION "Pointer List - {l}", ROMX[${utils.real2romaddr(addr)[1]:04x}], BANK[${bank:02x}]\n')
        datafile.write(f'PtrList{l}::\n')
        datafile.write(f'  INCBIN c{l}\n\n')

        entries = OrderedDict()
        with open(os.path.join(text_src_path, f"{l}.txt"), "w", encoding="utf-8-sig") as output:
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

                    # This is a bit of a hack, but we do assume that both versions have the same number of items
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
                        elif val > 0x7fff:
                            # A reference to RAM (e.g. the player name in credits)
                            # Annoyingly, if the entry is fixed length, we still need to write something
                            entry_length = 0
                            try:
                                entry_length = sum([x[0] for x in fix_len])
                            except:
                                entry_length = None
                            if entry_length:
                                ptrs.append(f"##&{val:04X}={ptrs[-1] + entry_length:04X}")
                        else:
                            ptrs.append(val)

                    for idx, ptr in enumerate(ptrs):

                        if idx not in entries:
                            entries[idx] = {}

                        entries[idx][version_suffix] = []

                        if isinstance(ptr, str):
                            if ptr.startswith('##='):
                                entries[idx][version_suffix].append(ptr)
                                continue
                            elif ptr.startswith('##&'):
                                info = ptr.split('=')
                                entries[idx][version_suffix] = info[0] + '='
                                ptr = int(info[1], 16)

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
                            if not isinstance(entries[idx][version_suffix], list):
                                entries[idx][version_suffix] = [entries[idx][version_suffix] + txt]
                            else:
                                entries[idx][version_suffix].append(txt)
                            if txt == null_indicator:
                                break

            # Output as a CSV
            writer = csv.writer(output, lineterminator='\n', delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)
            if(len(labels) == 0):
                for i in range(0, spp):
                    labels.append(f"Entry{i:02X}")
            writer.writerow(["Index[#version]"] + labels) # Always print the index, at the bare minimum
            for idx in entries:
                unique_set = set("".join(v) for v in entries[idx].values())
                if len(entries[idx]) != 2 or len(unique_set) > 1:
                    for version in entries[idx]:
                        index = f"{idx}#{version}"
                        writer.writerow([index] + entries[idx][version])
                else:
                    writer.writerow([idx] + entries[idx][default_version])
