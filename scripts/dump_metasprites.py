#!/bin/python
# Script to initially dump metasprites

import os, sys
from collections import OrderedDict

sys.path.append(os.path.join(os.path.dirname(__file__), 'common'))
from common import utils

roms = ([
            ("baserom_kabuto.gbc", "kabuto"), 
            ("baserom_kuwagata.gbc", "kuwagata")
        ])

script_name = sys.argv[0]
version_src_path = sys.argv[1]

metasprite_filename_template = "metasprites{0:02X}.asm"

BANK_TABLE_ADDRESS = 0x637
PTR_TABLE_ADDRESS = 0x63f


assert len(roms) == 2, "Only supports 2 versions"

# Keep track of version differences in metasprites
versioned_metasprites = OrderedDict()

for rom_info in roms:
    version = rom_info[1]
    with open(rom_info[0], "rb") as rom:
        rom.seek(BANK_TABLE_ADDRESS)
        
        banks = []
        while(rom.tell() != PTR_TABLE_ADDRESS):
            banks.append(utils.read_byte(rom))
        table_pointers = [utils.read_short(rom) for i in range(0, len(banks))]
        table_pointers = zip(banks, table_pointers)

        # Several pointer tables
        for table_pointer in table_pointers:
            bank = table_pointer[0]
            rom.seek(utils.rom2realaddr(table_pointer))

            # The first metasprite address is the end of the pointer list
            terminator = utils.read_short(rom)
            pointers = [terminator] + [utils.read_short(rom) for i in range(0, (terminator - table_pointer[1])//2 - 1)]
            # (Assume pointer table has more than 2 entries)
            table_end = pointers[-1] if pointers[-1] == pointers[-2] else None

            if table_pointer in versioned_metasprites:
                assert len(pointers) == len(versioned_metasprites[table_pointer]), f"{len(pointers)} != {len(versioned_metasprites[table_pointer])}, versions have different number of metasprites"

            # Keep track of dupes
            pointer_idx_map = {}

            # Get the metasprites
            for idx, pointer in enumerate(pointers):                
                rom.seek(utils.rom2realaddr((bank, pointer)))

                # They have unused data, which we should capture just to be correct...
                count = (pointers[idx + 1] - pointers[idx]) // 5 if pointer != table_end else None
                actual_count = utils.read_byte(rom)
                # The next entry is a dupe
                if count == 0:
                    count = actual_count

                metasprite = None

                # Dupe
                if pointer in pointer_idx_map:
                    metasprite = pointer_idx_map[pointer]
                else:
                    # Y, X, Tile Idx, Attribute Mixing, Attribute
                    metasprite = [[actual_count]] + [[utils.read_byte(rom), utils.read_byte(rom), utils.read_byte(rom), utils.read_byte(rom), utils.read_byte(rom)] for i in range(0, count)] if pointer != table_end else None
                    if metasprite:
                        pointer_idx_map[pointer] = idx

                if table_pointer not in versioned_metasprites:
                    versioned_metasprites[table_pointer] = [metasprite]
                elif idx < len(versioned_metasprites[table_pointer]) and versioned_metasprites[table_pointer][idx] != metasprite:
                    if isinstance(versioned_metasprites[table_pointer][idx], dict):
                        # We assume 2 versions so we simplify it a little and don't handle the case where there's already a dictionary
                        raise
                    versioned_metasprites[table_pointer][idx] = { roms[0][1]: versioned_metasprites[table_pointer][idx], version: metasprite }
                elif idx == len(versioned_metasprites[table_pointer]):
                    # Only need to add it per version
                    versioned_metasprites[table_pointer].append(metasprite)

# Now we can actually generate the files
for rom_info in roms:
    version = rom_info[1]
    metasprite_filename = os.path.join(version_src_path, version, "metasprites.asm")
    with open(metasprite_filename, "w") as output:
        output.write(f"; Autogenerated by {script_name}\n\n")
        for table_idx, table_pointer in enumerate(versioned_metasprites):
            common_metasprite_filename = os.path.join(version_src_path, metasprite_filename_template.format(table_idx))
            output.write(f'INCLUDE "{common_metasprite_filename}"\n')

for table_idx, table_pointer in enumerate(versioned_metasprites):
    common_metasprite_filename = os.path.join(version_src_path, metasprite_filename_template.format(table_idx))
    
    with open(common_metasprite_filename, "w") as output:
        output.write(f"; Autogenerated by {script_name}\n\n")
        output.write(f'SECTION "Metasprite Table {table_idx:02X}", ROMX[${table_pointer[1]:04X}], BANK[${table_pointer[0]:02X}]\n')
        output.write(f'MetaspriteTable{table_idx:02X}::\n')
        # Write out table first
        for idx, metasprite in enumerate(versioned_metasprites[table_pointer]):
            if metasprite == None:
                output.write(f"  dw MetaspriteTable{table_idx:02X}End\n")
            elif isinstance(metasprite, int):
                output.write(f"  dw Metasprite{table_idx:02X}{metasprite:02X}\n")
            else:
                output.write(f"  dw Metasprite{table_idx:02X}{idx:02X}\n")

        # Following the table is the actual metasprites
        for idx, metasprite in enumerate(versioned_metasprites[table_pointer]):
            if isinstance(metasprite, int):
                continue
            if metasprite == None:
                output.write(f"MetaspriteTable{table_idx:02X}End::\n")
                break
            else:
                output.write(f"Metasprite{table_idx:02X}{idx:02X}::\n")
            if isinstance(metasprite, dict):
                for rom_info in roms:
                    version = rom_info[1]
                    output.write(f'IF !STRCMP("{{GAMEVERSION}}", "{version}")\n')
                    for sprite in metasprite[version]:
                        output.write(f'  db {",".join([f"${x:02X}" for x in sprite])}\n')
                    output.write(f'ENDC\n')
            else:
                for sprite in metasprite:
                    output.write(f'  db {",".join([f"${x:02X}" for x in sprite])}\n')
        