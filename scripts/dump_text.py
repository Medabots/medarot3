#!/bin/python
import csv
import copy
import os
import sys
from collections import OrderedDict

sys.path.append(os.path.join(os.path.dirname(__file__), 'common'))
from common import utils, tilesets

rom_info = ([
            ("baserom_kabuto.gbc", "kabuto", 0x20a0, 0x20c6, 0x20c6-0x20a0), 
            ("baserom_kuwagata.gbc", "kuwagata", 0x20a0, 0x20c6, 0x20c6-0x20a0)
           ]) # [ROM File, Version Suffix, Text Table Bank Ptr, Address Ptr, Count]
ptrs = open("./scripts/res/ptrs.tbl", "a+")
table = utils.merge_dicts([
            tilesets.get_tileset("MainDialog1", override_offset=0x0),
            tilesets.get_tileset("MainDialog2", override_offset=0x80),
            tilesets.get_tileset("Special", override_offset=0xE0)
        ])

default_suffix = rom_info[0][1]
ptrs.seek(0)
name_table = {}
for line in ptrs:
    n, p = line.strip().split("=")
    name_table[int(p, 16)] = n

text_table_ptrs = {}
texts = {}
text_version_specific = {}
text_shifted_pointers = {}

for info in rom_info:
    filename = info[0]
    suffix = info[1]
    txt_bank_ptr = info[2]
    txt_tbl_ptr = info[3]
    entry_count = info[4]

    with open(filename, 'rb') as rom:
        rom.seek(txt_bank_ptr)
        banks = [utils.read_byte(rom) for i in range(0,entry_count)]

        rom.seek(txt_tbl_ptr)
        text_ptrs = list(zip(banks, [utils.read_short(rom) for i in range(0, entry_count)]))

        text_table_ptrs[suffix] = (txt_bank_ptr, txt_tbl_ptr, text_ptrs)

        class SpecialCharacter():
            def __init__(self, symbol, default=0, bts=1, end=False, names=None, always_print=False, parser = None):
                self.symbol = symbol
                self.default = default
                self.bts = bts
                self.end = end
                self.names = names
                self.always_print = always_print
                if not parser:
                    parser = { 0: lambda x: None, 1: utils.read_byte, 2: utils.read_short }[self.bts]
                self.parser = parser

        table[0xcc] = SpecialCharacter('*', end=True) # End of text
        table[0xcd] = SpecialCharacter("CD", bts=0, always_print=True) # Moves to second line of text box
        table[0xce] = SpecialCharacter('#') # Text Speed
        table[0xcf] = SpecialCharacter("CF", bts=0, always_print=True) # Create new text box
        table[0xd0] = SpecialCharacter("&", bts=2, names=name_table) # Pull text from RAM
        table[0xd1] = SpecialCharacter("D1", bts=0, always_print=True) # New page (keeps portrait)
        # Portrait, [Orientation:{00, 01, 10, 11, FF}][Character:1][Expression:1]
        table[0xd2] = SpecialCharacter('@', bts=3, parser=lambda x: "{},{:02X},{:02X}".format({0x00: 'LL', 0x01: 'LR', 0x10: 'RL', 0x11: 'RR', 0xFF: 'CC' }[utils.read_byte(x)], utils.read_byte(x), utils.read_byte(x)) )
        table[0xd3] = SpecialCharacter('K') # Kanji
        
        terminator_pointers = [utils.rom2realaddr(t) for t in text_ptrs if t[0] != 0] # They use pointers as placeholders, so we record them

        for i, entry in enumerate([t for t in text_ptrs if t[0] != 0]):
            csv_filename = f"./text/dialog/TextSection{i:02}.csv"
            text_version_specific[csv_filename] = {}
            text_shifted_pointers[csv_filename] = {}
            realaddr = utils.rom2realaddr(entry)
            rom.seek(realaddr)
            end = utils.rom2realaddr((entry[0], utils.read_short(rom)))
            pointers = OrderedDict()
            pointer_lengths = OrderedDict()
            pointer_lengths_key = realaddr
            pointer_lengths[pointer_lengths_key] = end
            pointers[realaddr] = end # Treat pointers[0] as the end of the list of addresses
            reverse_map = {}
            realaddr = rom.tell()
            last_ptr = 0
            if realaddr >= end: # An empty bank, so clear pointers to avoid any parsing but still create the csv file
                pointer_lengths.clear()
                pointers.clear()
            while(realaddr < end):
                val = utils.rom2realaddr((entry[0], utils.read_short(rom)))
                if val in reverse_map:
                    val = f"=0x{reverse_map[val]:x}"
                else:
                    reverse_map[val] = realaddr
                    # Record the guessed 'max length'
                    pointer_lengths[pointer_lengths_key] = min(val - pointer_lengths[pointer_lengths_key], 0xff)
                    pointer_lengths[realaddr] = val 
                    pointer_lengths_key = realaddr
                    if val > last_ptr:
                        last_ptr = val

                pointers[realaddr] = val
                realaddr = rom.tell()

            if pointer_lengths:
                pointer_lengths[next(reversed(pointer_lengths))] = min(pointer_lengths[next(reversed(pointer_lengths))], 0xff)

            text = OrderedDict()
            counter = 0
            # Instead of reading through the pointer table, parse through all the text in case it's out of order
            while rom.tell() in pointers.values():
                p = list(pointers.keys())[list(pointers.values()).index(rom.tell())]
                if rom.tell() in terminator_pointers:
                    pointer_lengths[p] = -1
                while True:
                    t = ""
                    queued_ptrs_write = "" # Queue, but don't write immediately until we know it's ignored or not
                    text_bytes = []
                    while len(text_bytes) < pointer_lengths[p]:
                        b = utils.read_byte(rom)
                        text_bytes.append(b)
                        if b in table:
                            token = table[b]
                            if type(token) == str: # Normal character
                                t += token
                            elif isinstance(token, SpecialCharacter): # Special character
                                param = token.parser(rom)
                                if token.always_print or (param != None and param != token.default):
                                    t += "<" + token.symbol
                                if param != None:
                                    if (param != None and not token.end and param != token.default) or (token.end and param != token.default):
                                        if param != token.default:
                                            if token.names and param in token.names:
                                                t += token.names[param]
                                            else:
                                                if token.names is not None:
                                                    n = f"BUF{len(token.names):02X}"
                                                    token.names[param] = n
                                                    queued_ptrs_write += f"{n}={hex(param)}\n"
                                                    t += n
                                                    # Write the names to the table later, just in case something is ignored
                                                else:
                                                    if isinstance(param, str):
                                                        t += param
                                                    else:
                                                        token_format = f"{{:{token.bts * 2:02}X}}"
                                                        t += token_format.format(param)
                                if token.always_print or (param != None and param != token.default):
                                    t += ">"
                                if token.end:
                                    if not t:
                                        t = f"<{token.symbol}{param:02X}>"

                                    # This is a hack, but step back one because they'll reuse this byte
                                    if param not in range(0, 4+1):
                                        rom.seek(-1, 1)
                                    break
                        else: # Not found, print literal bytes instead
                            t += f"<${b:02X}>"
                    else: # If we never break out of the while loop before the condition fails, this is probably garbage and we should treat it as ignored
                        if pointer_lengths[p] == -1:
                            t = f"<IGNORED:${utils.read_short(rom):04X}>"
                        else:
                            t = "<IGNORED>"

                    if queued_ptrs_write and not t.startswith("<IGNORED>") or (isinstance(p, str) and p.startswith("UNUSED")):
                        ptrs.write(queued_ptrs_write)
                    
                    text[p] = t

                    if rom.tell() in pointers.values() or rom.tell() > last_ptr:
                        break

                    p = f"UNUSED{counter:02X}"
                    counter += 1
                    pointer_lengths[p] = 0xff

                    pointers[p] = rom.tell()

            # Account for duplicates, but add them at the end
            duplicates = OrderedDict()
            for p in pointers:
                if isinstance(pointers[p], str):
                    duplicates[p] = pointers[p]

            # Finally, they may have had some pointers literally just point to the middle of other segments, so we need to account for this
            missing = set(pointers) - set(text) - set(duplicates) - set(terminator_pointers)
            for p in missing:
                ptr = pointers[p]
                rom.seek(ptr - 1)
                while rom.tell() not in pointers.values():
                    rom.seek(-1, 1)
                idx = list(pointers.keys())[list(pointers.values()).index(rom.tell())]
                if isinstance(idx, str):
                    text[p] = f"<OFFSET:{idx}:{ptr - rom.tell():X}>"
                else:
                    text[p] = f"<OFFSET:{idx:X}:{ptr - rom.tell():X}>"
                j = 0
                curr = 0
                start = ptr - rom.tell()
                while j < start:
                    try:
                        if text[idx][curr] == '<':
                            while text[idx][curr] != '>':
                                curr += 1
                    finally:
                        j += 1
                        curr += 1
                text[p] += text[idx][curr:]

            text = utils.merge_dicts([text, duplicates])

            if csv_filename in texts:
                idx = 0
                while idx < len(text):
                    texts_items = list(texts[csv_filename].items())
                    curr_items = list(text.items())
                    p_default = texts_items[idx][0]
                    p_current = curr_items[idx][0]
                    # If the text doesn't match or it's already been marked as different, then make sure to record the version string
                    if curr_items[idx][1] != texts_items[idx][1] or idx in text_version_specific[csv_filename]:
                        if idx not in text_version_specific[csv_filename]:
                            text_version_specific[csv_filename][idx] = {}
                            text_version_specific[csv_filename][idx][default_suffix] = (p_default, texts[csv_filename][p_default])
                        text_version_specific[csv_filename][idx][suffix] = (p_current, text[p_current])
                    #If the text matches but the pointer doesn't, we should keep track of it in a single line
                    elif p_current != p_default or idx in text_shifted_pointers[csv_filename]:
                        if idx not in text_shifted_pointers[csv_filename]:
                            text_shifted_pointers[csv_filename][idx] = {}
                            text_shifted_pointers[csv_filename][idx][default_suffix] = p_default
                        text_shifted_pointers[csv_filename][idx][suffix] = p_current
                    idx += 1
            else:
                texts[csv_filename] = copy.deepcopy(text)

for fn in texts:
    text = texts[fn]
    with open(fn, "w", encoding="utf-8") as fp:
        writer = csv.writer(fp, lineterminator='\n', delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)
        writer.writerow(["Index[#version]","Pointer","Original","Translated"])
        for idx, p in enumerate(text):
            if fn in text_version_specific and idx in text_version_specific[fn]:
                for suffix in text_version_specific[fn][idx]:
                    p = text_version_specific[fn][idx][suffix][0]
                    pointer = p if isinstance(p, str) else hex(p)
                    txt = text_version_specific[fn][idx][suffix][1]
                    writer.writerow([f'{idx:03}#{suffix}', pointer, txt, txt if txt.startswith("=") else None])
                continue
            #If the text matches but the pointer doesn't, we should keep track of it in a single line
            elif fn in text_shifted_pointers and idx in text_shifted_pointers[fn]: 
                pointer = "|".join([f"{hex(text_shifted_pointers[fn][idx][x])}#{x}" for x in text_shifted_pointers[fn][idx]])
            else:
                pointer = p if isinstance(p, str) else hex(p)
            writer.writerow([f'{idx:03}', pointer, text[p], text[p] if text[p].startswith("=") else None])

text_ptr_versions = [] 
values = list(text_table_ptrs.values())[0]
txt_bank_ptr = values[0]
text_ptrs = values[2]
i = 0
while i < len(text_ptrs):
    for suffix in text_table_ptrs:
        if text_table_ptrs[suffix][2][i] != text_ptrs[i]:
            text_ptr_versions.append(i)
    i += 1

with open("./game/src/version/text_tables.asm", "w") as f:
    f.write(f'INCLUDE "build/dialog/text_table_constants_{{GAMEVERSION}}.asm"\n\n')
    for i, entry in enumerate([t for t in text_ptrs if t[0] != 0]):
        if i not in text_ptr_versions:
            f.write(f'SECTION "TextSection{i:02}", ROMX[${entry[1]:04x}], BANK[${entry[0]:02x}]\n')
            f.write(f'TextSection{i:02}:\n')
            f.write(f'  INCBIN cTextSection{i:02}\n\n')

    f.write(f'SECTION "Dialog Text Tables", ROM0[${txt_bank_ptr:04x}]\n')
    f.write(f'TextTableBanks:: ; 0x{txt_bank_ptr:04x}\n')
    
    i = 0
    for entry in text_ptrs:
        if entry[0] == 0:
            f.write('  db $00')
        else:
            f.write(f'  db BANK(TextSection{i:02})')
            i += 1
        f.write('\n')

    f.write('\nTextTableOffsets::\n')

    i = 0
    for entry in text_ptrs:
        if entry[0] == 0:
            f.write('  dw $4000')
        else:
            f.write(f'  dw TextSection{i:02}')
            i += 1
        f.write('\n')

for suffix in text_table_ptrs:
    with open(f"./game/src/version/{suffix}/text_tables.asm", "w") as f:
        f.write(f'INCLUDE "game/src/version/text_tables.asm"\n\n')
        for i in text_ptr_versions:
            f.write(f'SECTION "TextSection{i:02}", ROMX[${text_table_ptrs[suffix][2][i][1]:04x}], BANK[${text_table_ptrs[suffix][2][i][0]:02x}]\n')
            f.write(f'TextSection{i:02}:\n')
            f.write(f'  INCBIN cTextSection{i:02}\n\n')