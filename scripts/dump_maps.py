#!/bin/python

# Script to initially dump tilemaps and attribmaps

import os, sys
from collections import OrderedDict
from functools import partial
from pathlib import Path

sys.path.append(os.path.join(os.path.dirname(__file__), 'common'))
from common import utils, tilemaps

def dump(output_root, prebuilt_root, name, data, character_map = {}):
    character_map[0xfe] = '\n'
    output_path = os.path.join(output_root, f"{name}.txt")
    prebuilt_path = os.path.join(prebuilt_root, f"{name}.map")
    with open(output_path, "w", encoding = "utf-8") as output:
        compression = data[0]
        map_bytes = data[1:]
        output.write(f"[{compression:X}]\n")
        # Compressed
        if compression & 0x03:
            with open(prebuilt_path, "wb") as binary:
                binary.write(data) # Write and include the compression byte
                binary.write(bytearray([0xFF]))
            # Add 0xFF to the end when decompressing
            map_bytes.append(0xFF)
            # The 0xFF at the end is implied though
            map_bytes = tilemaps.decompress_tilemap(map_bytes)[:-1]
        output.write("".join(utils.bin2txt(map_bytes, character_map)))

map_label = sys.argv[1]
raw_path = sys.argv[2]
prebuilt_path = sys.argv[3]
output_path = sys.argv[4]
scripts_res_path = sys.argv[5]
version_src_path = sys.argv[6]
# Tilemap tables exist in several banks, referenced by a sequential array of banks and associated array of addresses
# Those tables each point to the actual tilemap data
map_bank_table = int(sys.argv[7], 16)
map_addr_table = int(sys.argv[8], 16)
map_table_count = int(sys.argv[9], 16)

meta_tilemap_names_file = os.path.join(scripts_res_path, f"meta_{map_label}_files.tbl")

roms = ([
            ("baserom_kabuto.gbc", "kabuto"), 
            ("baserom_kuwagata.gbc", "kuwagata")
        ])

# Map real address to a defined name
nametable = {}
namefile = None
if os.path.exists(meta_tilemap_names_file):
    nametable = utils.read_table(meta_tilemap_names_file, keystring=True)
else:
    namefile = open(meta_tilemap_names_file, "w")

default_version = roms[0]
tilemap_tables = None

try:
    with open(default_version[0], "rb") as rom:
        rom.seek(map_bank_table)
        tilemap_banks = [utils.read_byte(rom) for i in range(0, map_table_count)]
        rom.seek(map_addr_table)
        tilemap_addrs = [utils.read_short(rom) for i in range(0, map_table_count)]

        # The tilemap locations are in the same place in both versions
        tilemap_tables = list(zip(tilemap_banks, tilemap_addrs))

    tilemap_data = {} # [version] -> [identifier] -> (realaddr, data)
    duplicate_map = {} # [version] -> [identifier] -> identity
    version_specific_ids = set()
    basename_map = OrderedDict()

    version_suffixes = [i[1] for i in roms]
    for versionidx, version in enumerate(roms):
        rom_filename = version[0]
        ver = version[1]
        tilemap_data[versionidx] = OrderedDict()
        duplicate_map[versionidx] = {}
        with open(rom_filename, "rb") as rom:
            pointers = None

            for tableidx, tableptr in enumerate(tilemap_tables):
                current_bank = tableptr[0]
                rom.seek(utils.rom2realaddr(tableptr))

                pointers = [utils.read_short(rom)]
                # Assume the end of the table is the first data pointer
                table_end = utils.rom2realaddr((current_bank, pointers[0])) 

                while rom.tell() < table_end:
                    pointers.append(utils.read_short(rom))

                # Empty spaces in the table are the terminator, but we need to verify
                terminator = pointers[-1]
                # A hack to guess if something is a terminator or not
                is_terminator = pointers[-2] == terminator
                duplicate_pointers = []
                for pointeridx, pointer in enumerate(pointers):
                    realaddr = utils.rom2realaddr((current_bank, pointer))
                    identifier = (tableidx, pointeridx)
                    
                    rom.seek(realaddr)
                    nextptr = pointers[pointeridx+1] if pointeridx < len(pointers) - 1 else 0
                    data = bytearray(iter(partial(utils.read_byte, rom), 0xFF)) # Read ROM until 0xFF
                    # A hack to get 'garbage' data when tilemaps have data even after 0xFF
                    estimated_length = (nextptr - pointer) - 1
                    if estimated_length > len(data):
                        data.append(0xFF)
                        while len(data) < estimated_length:
                            data.append(utils.read_byte(rom))

                    if pointer == terminator:
                        # More hacks to identify the terminator
                        if pointer + len(data) >= 0x8000:
                            is_terminator = True
                        if is_terminator:
                            # No real data, just need the identifier to mark the table index
                            tilemap_data[versionidx][identifier] = (None, None)
                            continue

                    # A hack because specifically adjacent duplicate pointers don't copy data
                    prev_ident = (tableidx, pointeridx - 1)
                    if prev_ident in tilemap_data[versionidx] and tilemap_data[versionidx][prev_ident][0] == realaddr:
                        duplicate_map[versionidx][identifier] = prev_ident
                        tilemap_data[versionidx][identifier] = (None, None)
                    else:
                        for ident in tilemap_data[versionidx]:
                            if data == tilemap_data[versionidx][ident][1]:
                                # Real pointers are the same -> duplicate, no need to copy data                       
                                if realaddr == tilemap_data[versionidx][ident][0]:
                                    duplicate_map[versionidx][identifier] = ident
                                    tilemap_data[versionidx][identifier] = (None, None)
                                    break
                                else:
                                    # Duplicate data, but not at the same pointer
                                    ## Don't need to dump twice, but need to copy when building
                                    duplicate_map[versionidx][identifier] = ident
                                    tilemap_data[versionidx][identifier] = (realaddr, None)
                                    break
                        else:
                            tilemap_data[versionidx][identifier] = (realaddr, data)
        
        # Mark version specific details
        if versionidx != 0:
            for identifier in tilemap_data[versionidx]:
                # Version specific if data doesn't match but ID is the same
                if tilemap_data[versionidx][identifier][1] != tilemap_data[0][identifier][1]:
                    version_specific_ids.add(identifier)
                elif identifier not in version_specific_ids:
                    # Remove common entries from the non-default versions
                    ## We can't call 'del' since we're actually looping through the dictionary
                    tilemap_data[versionidx][identifier] = (None, None)

            # Track version-specific duplicate entries (shifted duplicates are a problem)
            for identifier in duplicate_map[versionidx]:
                if (
                        identifier not in duplicate_map[0] or
                        duplicate_map[0][identifier] != duplicate_map[versionidx][identifier] or
                        duplicate_map[versionidx][identifier] in version_specific_ids
                    ):
                    version_specific_ids.add(identifier)

            for identifier in duplicate_map[0]:
                if identifier not in duplicate_map[versionidx] or duplicate_map[0][identifier] in version_specific_ids:
                    version_specific_ids.add(identifier)

    # Dump data and populate name map
    common_file_path = os.path.join(version_src_path, f"{map_label}_table.asm")
    tableidx = -1
    filelist = []
    file_constants = dict( (version, {}) for version in version_suffixes )
    with open(common_file_path, "w") as common_file:
        common_file.write('INCLUDE "game/src/common/macros.asm"\n')
        for identifier in tilemap_data[0]:
            id_string = f"{identifier[0]:02X}_{identifier[1]:02X}"
            data = tilemap_data[0][identifier]

            if identifier[0] != tableidx:
                for fileinfo in filelist:
                    name = fileinfo[0]
                    fn = fileinfo[1]
                    common_file.write(f'{map_label.capitalize()}{name}::\n')
                    common_file.write(f'  INCBIN ')
                    if name.endswith("_GAMEVERSION"):
                        common_file.write(f'c{map_label.capitalize()}{name}\n')
                    else:
                        common_file.write(f'"{os.path.join(output_path, f"{fn}.map")}"\n')
                else:
                    if tableidx > -1:
                        common_file.write(f"{map_label.capitalize()}Table{tableidx:02X}Terminator::\n")
                    common_file.write('\n')
                filelist = []
                common_file.write(f'SECTION "{map_label.capitalize()} Table {identifier[0]:02X}", ROMX[${tilemap_tables[identifier[0]][1]:04X}], BANK[${tilemap_tables[identifier[0]][0]:02X}]\n')
                common_file.write(f"{map_label.capitalize()}Table{identifier[0]:02X}::\n")
            tableidx = identifier[0]

            name = id_string
            comment = f"{identifier[1]:02X}"
            if identifier in version_specific_ids:
                # Version Specific
                name += "_GAMEVERSION"
                filelist.append((name, None)) # Not necessarily a file, could be a duplicate in one version and file in another
                for idx, suffix in enumerate(version_suffixes):
                    identity = f"{id_string}_{suffix}"
                    if identifier in duplicate_map[idx]:
                        # Duplicate entries that are version specific
                        duplicate_id = duplicate_map[idx][identifier]
                        duplicate_id_string = f"{duplicate_id[0]:02X}_{duplicate_id[1]:02X}"
                        if duplicate_id in version_specific_ids:
                            duplicate_id_string += f"_{suffix}"
                        file_constants[suffix][name] = basename_map[duplicate_id_string]
                    elif tilemap_data[idx][identifier][1] != None:
                        # Version specific data
                        basename_map[identity] = nametable[identity] if identity in nametable else identity.replace('_','', 1)
                        dump(raw_path, prebuilt_path, basename_map[identity], tilemap_data[idx][identifier][1])
                        file_constants[suffix][name] = basename_map[identity]
            elif identifier in duplicate_map[0]:
                duplicate_id = duplicate_map[0][identifier]
                duplicate_id_string = f"{duplicate_id[0]:02X}_{duplicate_id[1]:02X}"
                if tilemap_data[0][identifier] == (None, None):
                    # Exact pointer copy
                    name = duplicate_id_string
                    comment += f" ({id_string})"
                else:
                    # Otherwise, different pointer, same data but it must be copied
                    filelist.append((name, basename_map[duplicate_id_string]))
            elif tilemap_data[0][identifier] == (None, None):
                # Terminator
                name = f"Table{tableidx:02X}Terminator"
            else:
                # Common
                basename_map[id_string] = nametable[id_string] if id_string in nametable else id_string.replace('_','', 1)
                dump(raw_path, prebuilt_path, basename_map[id_string], tilemap_data[0][identifier][1])
                filelist.append((name, basename_map[id_string]))
            common_file.write(f"  dw {map_label.capitalize()}{name} ; {comment}\n")
        else:
            # Make sure to dump the last few pointers before closing common_file
            for fileinfo in filelist:
                name = fileinfo[0]
                fn = fileinfo[1]
                common_file.write(f'{map_label.capitalize()}{name}::\n')
                common_file.write(f'  INCBIN ')
                if name.endswith("_GAMEVERSION"):
                    common_file.write(f'c{map_label.capitalize()}{name}\n')
                else:
                    common_file.write(f'"{os.path.join(output_path, f"{fn}.map")}"\n')
            else:
                if tableidx > -1:
                    common_file.write(f"{map_label.capitalize()}Table{tableidx:02X}Terminator::\n")
                common_file.write('\n') 

    for version in file_constants:
        version_file_path = os.path.join(version_src_path, f"{version}/{map_label}_table.asm")
        with open(version_file_path, "w") as version_file:
            for var in file_constants[version]:
                name = file_constants[version][var]
                version_file.write(f'c{map_label.capitalize()}{var}        EQUS "\\"{os.path.join(output_path, f"{name}.map")}\\""\n')
            version_file.write(f'\nINCLUDE "{os.path.join(version_src_path, f"{map_label}_table.asm")}"\n')

    if namefile:
        for identity in basename_map:
            namefile.write(f"{identity}={basename_map[identity]}\n")
finally:
    if namefile:
        namefile.close()