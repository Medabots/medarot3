#!/bin/python

# Script to initially dump "malias" format tilesets

import os, sys
from collections import OrderedDict
from functools import partial
from pathlib import Path

sys.path.append(os.path.join(os.path.dirname(__file__), 'common'))
from common import utils, tilesets, png, gfx

raw_path = sys.argv[1]
prebuilt_path = sys.argv[2]
output_path = sys.argv[3]
scripts_res_path = sys.argv[4]
version_src_path = sys.argv[5]

meta_tileset_names_file = os.path.join(scripts_res_path, "meta_tileset_names.tbl")
meta_tileset_load_offsets_file = os.path.join(scripts_res_path, "meta_tileset_load_offsets.tbl")
meta_tileset_index_file = os.path.join(scripts_res_path, "meta_tileset_index.tbl")

roms = ([
            ("baserom_kabuto.gbc", "kabuto"), 
            ("baserom_kuwagata.gbc", "kuwagata")
        ])

# Kabuto and Kuwagata both have the pointer tables in the same place
tiletable = 0x3995
infotable = (0x39, 0x706a)
terminator = 0x3d95 # The final address of the table, and also what's used to specify an empty entry

default_version = roms[0][1]
nametable = OrderedDict()
namefile = None
realptr_key_map = {}

# Map real address to a defined name

if os.path.exists(meta_tileset_names_file):
    nametable = utils.read_table(meta_tileset_names_file)
else:
    namefile = open(meta_tileset_names_file, "w")

# M3 keeps source addresses in a table in bank 0 and banks + destination info in a separate table
# This is pretty much a single table that's been split over 2 banks, and there may be duplicate tileset entries
count = ((terminator - tiletable) // 2)
terminator_key = utils.rom2realaddr((0, terminator))
nametable[terminator] = "TilesetSourceAddressTableEnd"

tileset_data = OrderedDict()
tileset_metadata = {}

common_tilesets = []
unique_pointer_and_tilesets = []
unique_tilesets = []
unique_pointers = []
missing_pointers = []
tileset_alias = {}
for version in roms:
    ver = version[1]
    realptr_key_map[ver] = OrderedDict()
    realptr_key_map[ver][terminator_key] = terminator
    tileset_metadata[ver] = OrderedDict()
    with open(version[0], "rb") as rom:
        rom.seek(tiletable)
        ptrs = [(rom.tell(), utils.read_short(rom)) for i in range(0, count)]
        rom.seek(utils.rom2realaddr(infotable))
        info = [(utils.read_byte(rom), utils.read_short(rom), utils.read_byte(rom)) for i in range(0, count)]

        i = 0
        while i < count:
            key = ptrs[i][0]
            ptr = ptrs[i][1]
            bank = info[i][0]
            vram = info[i][1]
            vbank = info[i][2]
            realptr = utils.rom2realaddr((bank, ptr))

            if realptr != terminator_key and realptr not in realptr_key_map[ver]:
                realptr_key_map[ver][realptr] = key
                if key not in tileset_data:
                    tileset_data[key] = OrderedDict()
                tileset_data[key][ver] = (realptr, tilesets.decompress_tileset(rom, realptr))

            tileset_metadata[ver][key] = (bank, ptr, vram, vbank)

            i += 1

for key in tileset_data:
    if len(tileset_data[key]) != len(roms):
        # Odds are, it's just shifted
        missing_pointers.append(key)
        continue
    for version in tileset_data[key]:
        unique_level = (
                            ((tileset_data[key][version][1][0] != tileset_data[key][default_version][1][0]) << 1) | # bit 1, tileset different
                            ((tileset_data[key][version][0] != tileset_data[key][default_version][0]) << 0) # bit 0, pointer different
                        )
        if unique_level == 3:
            unique_pointer_and_tilesets.append(key)
        elif unique_level == 2:
            unique_tilesets.append(key)
        elif unique_level == 1:
            unique_pointers.append(key)

        if unique_level:
            break
    else: # Nothing different, common to both
        common_tilesets.append(key)

# Compare tileset data to make sure it's not just a shifted, but identical, tileset
for version in roms:
    ver = version[1]
    i = 0
    while i < len(missing_pointers):
        key = missing_pointers[i]
        try:
            if ver not in tileset_data[key]:
                realptr = utils.rom2realaddr((tileset_metadata[ver][key][0], tileset_metadata[ver][key][1]))
                if ver not in tileset_alias:
                    tileset_alias[ver] = {}
                real_key = realptr_key_map[ver][realptr]
                if real_key not in tileset_alias[ver]:
                    tileset_alias[ver][real_key] = []
                tileset_alias[ver][real_key].append(key)

                if real_key in common_tilesets:
                    common_tilesets.remove(real_key)
                    unique_pointers.append(real_key)
                elif real_key in unique_tilesets:
                    unique_tilesets.remove(real_key)
                    unique_pointer_and_tilesets.append(real_key)
        finally:
            i += 1

# Populate the nametable if it doesn't already exist
if namefile:
    for key in sorted(common_tilesets + unique_tilesets + unique_pointers + unique_pointer_and_tilesets + missing_pointers):
        if key in missing_pointers:
            nametable[key] = f"Tileset{key:04X}_GAMEVERSION"
        else:
            nametable[key] = f"Tileset{key:04X}"
        if key != terminator:
            namefile.write(f"{key:04X}={nametable[key]}\n")

with open(os.path.join(version_src_path, "tileset_table.asm"), "w") as output:
    #Hardcoded path for common source
    output.write('INCLUDE "game/src/common/macros.asm"\n')

    output.write('''
MACRO TilesetTableEntry
  TableAddressEntry Tileset,\\1
  ENDM\n
''')

    output.write(f'SECTION "Tileset Source Address Table", ROM0[${tiletable:04X}]\n')
    output.write(f'TilesetSourceAddressTable::\n')
    output.write(f'  TableStart\n')
    for i, key in enumerate(tileset_metadata[default_version]):
        bank = tileset_metadata[default_version][key][0]
        ptr = tileset_metadata[default_version][key][1]
        realptr = utils.rom2realaddr((bank, ptr))
        name = nametable[key] if key in nametable else nametable[realptr_key_map[default_version][realptr]]
        output.write(f"  TilesetTableEntry {name} ; {i:02X} ({(tiletable + i * 2):04X})\n")
    output.write(f"{nametable[terminator]}::\n\n")

    output.write(f'SECTION "Tileset Info Table", ROMX[${infotable[1]:04X}], BANK[${infotable[0]:X}]\n')
    output.write('TilesetInfoTable::\n')
    for i, key in enumerate(tileset_metadata[default_version]):
        bank = tileset_metadata[default_version][key][0]
        ptr = tileset_metadata[default_version][key][1]
        vram = tileset_metadata[default_version][key][2]
        vbank = tileset_metadata[default_version][key][3]
        realptr = utils.rom2realaddr((bank, ptr))
        name = nametable[key] if key in nametable else nametable[realptr_key_map[default_version][realptr]]
        output.write(f'  dbwb BANK({name}), ${vram:04X}, ${vbank:X} ; {i:03X}\n')
    output.write('TilesetInfoTableEnd::\n\n')

    # Common tilesets to both versions
    output.write('; TilesetDataCommon\n')
    for key in common_tilesets:
        p = utils.real2romaddr(tileset_data[key][default_version][0])
        f = tileset_data[key][default_version][1]
        name = nametable[key]
        with open(os.path.join(prebuilt_path, f"{name}.malias"),"wb") as compressed, \
                open(os.path.join(raw_path, f"{name}.malias.png"),"wb") as uncompressed:
            width, height, palette, greyscale, bitdepth, px_map = gfx.convert_2bpp_to_png(f[0])
            w = png.Writer(
                width,
                height,
                palette=palette,
                compression=9,
                greyscale=greyscale,
                bitdepth=bitdepth
            )
            w.write(uncompressed, px_map)
            compressed.write(bytearray(f[1]))
        
        output.write(f'SECTION "Tileset Data {name}", ROMX[${p[1]:04X}], BANK[${p[0]:02X}]\n')
        output.write(f"{name}::\n")
        output.write(f'  INCBIN "{os.path.join(output_path, f"{name}.malias")}"\n\n')
    output.write('\n')


    # Unique tilesets but pointer is the same
    for key in unique_tilesets:
        p = utils.real2romaddr(tileset_data[key][default_version][0])
        f = tileset_data[key][default_version][1]
        name = nametable[key]
        output.write(f'SECTION "Tileset Data {name}", ROMX[${p[1]:04X}], BANK[${p[0]:02X}]\n')
        output.write(f"{name}::\n")
        output.write(f'  INCBIN "{os.path.join(output_path, f"{name}_{{GAMEVERSION}}.malias")}"\n\n')

        for version in roms:
            ver = version[1]
            p = utils.real2romaddr(tileset_data[key][ver][0])
            f = tileset_data[key][ver][1]

            with open(os.path.join(prebuilt_path, f"{name}_{ver}.malias"),"wb") as compressed, \
                    open(os.path.join(raw_path, f"{name}_{ver}.malias.png"),"wb") as uncompressed:
                width, height, palette, greyscale, bitdepth, px_map = gfx.convert_2bpp_to_png(f[0])
                w = png.Writer(
                    width,
                    height,
                    palette=palette,
                    compression=9,
                    greyscale=greyscale,
                    bitdepth=bitdepth
                )
                w.write(uncompressed, px_map)
                compressed.write(bytearray(f[1]))

data_map = {}
for version in roms:
    ver = version[1]
    with open(os.path.join(version_src_path, f"{ver}/tileset_table.asm"), "w") as outputv:
        outputv.write(f'INCLUDE "{os.path.join(version_src_path, "tileset_table.asm")}"\n\n')

        # Unique pointers but tileset is the same
        for key in unique_pointers:
            p = utils.real2romaddr(tileset_data[key][ver][0])
            f = tileset_data[key][ver][1]
            name = nametable[key]

            with open(os.path.join(prebuilt_path, f"{name}.malias"),"wb") as compressed, \
                    open(os.path.join(raw_path, f"{name}.malias.png"),"wb") as uncompressed:
                width, height, palette, greyscale, bitdepth, px_map = gfx.convert_2bpp_to_png(f[0])
                w = png.Writer(
                    width,
                    height,
                    palette=palette,
                    compression=9,
                    greyscale=greyscale,
                    bitdepth=bitdepth
                )
                w.write(uncompressed, px_map)
                compressed.write(bytearray(f[1]))

            outputv.write(f'SECTION "Tileset Data {name}", ROMX[${p[1]:04X}], BANK[${p[0]:02X}]\n')
            outputv.write(f"{name}::\n")
            if key in tileset_alias[ver]:
                for alias_key in tileset_alias[ver][key]:
                    outputv.write(f"{nametable[alias_key]}::\n")
            outputv.write(f'  INCBIN "{os.path.join(output_path, f"{name}.malias")}"\n\n')

        for key in unique_pointer_and_tilesets:
            p = utils.real2romaddr(tileset_data[key][ver][0])
            f = tileset_data[key][ver][1]
            name = nametable[key]

            with open(os.path.join(prebuilt_path, f"{name}_{ver}.malias"),"wb") as compressed, \
                    open(os.path.join(raw_path, f"{name}_{ver}.malias.png"),"wb") as uncompressed:
                width, height, palette, greyscale, bitdepth, px_map = gfx.convert_2bpp_to_png(f[0])
                w = png.Writer(
                    width,
                    height,
                    palette=palette,
                    compression=9,
                    greyscale=greyscale,
                    bitdepth=bitdepth
                )
                w.write(uncompressed, px_map)
                compressed.write(bytearray(f[1]))

            outputv.write(f'SECTION "Tileset Data {name}", ROMX[${p[1]:04X}], BANK[${p[0]:02X}]\n')
            outputv.write(f"{name}::\n")
            if key in tileset_alias[ver]:
                for alias_key in tileset_alias[ver][key]:
                    outputv.write(f"{nametable[alias_key]}::\n")
            outputv.write(f'  INCBIN "{os.path.join(output_path, f"{name}_{ver}.malias")}"\n\n')

        for key in missing_pointers:
            if ver not in tileset_data[key]:
                continue
            p = utils.real2romaddr(tileset_data[key][ver][0])
            f = tileset_data[key][ver][1]
            name = nametable[key]

            if tuple(f[0]) not in data_map:
                data_map[tuple(f[0])] = f"{name}_{ver}"
                
                with open(os.path.join(prebuilt_path, f"{data_map[tuple(f[0])]}.malias"), "wb") as compressed, \
                        open(os.path.join(raw_path, f"{data_map[tuple(f[0])]}.malias.png"), "wb") as uncompressed:
                    width, height, palette, greyscale, bitdepth, px_map = gfx.convert_2bpp_to_png(f[0])
                    w = png.Writer(
                        width,
                        height,
                        palette=palette,
                        compression=9,
                        greyscale=greyscale,
                        bitdepth=bitdepth
                    )
                    w.write(uncompressed, px_map)
                    compressed.write(bytearray(f[1]))

            basename = data_map[tuple(f[0])]
            outputv.write(f'SECTION "Tileset Data {name}", ROMX[${p[1]:04X}], BANK[${p[0]:02X}]\n')
            outputv.write(f"{name}::\n")
            if key in tileset_alias[ver]:
                for alias_key in tileset_alias[ver][key]:
                    outputv.write(f"{nametable[alias_key]}::\n")
            outputv.write(f'  INCBIN "{os.path.join(output_path, f"{basename}.malias")}"\n\n')


with open(meta_tileset_load_offsets_file,"w") as offsetfile, open(meta_tileset_index_file,"w") as indexfile:
    for i, key in enumerate(tileset_metadata[default_version]):
        name = nametable[key] if key in nametable else nametable[realptr_key_map[default_version][realptr]]
        vram = tileset_metadata[default_version][key][2]
        indexfile.write(f"{i:03X}={name}\n")
        offsetfile.write(f"{i:03X}={vram:04X}\n")