#!/bin/python

# Script to initially dump tilesets

import os, sys
from collections import OrderedDict
from functools import partial
from pathlib import Path

sys.path.append(os.path.join(os.path.dirname(__file__), 'common'))
from common import utils, tilesets, png, gfx

nametable = OrderedDict()
namefile = None

# Map real address to a defined name
if os.path.exists("scripts/res/meta_tileset_names.tbl"):
    nametable = utils.read_table("scripts/res/meta_tileset_names.tbl")
else:
    namefile = open("scripts/res/meta_tileset_names.tbl","w")

offsetfile = open("scripts/res/meta_tileset_load_offsets.tbl","w")
indexfile = open("scripts/res/meta_tileset_index.tbl","w")

tiletable = 0x3995
infotable = (0x39, 0x706a)
terminator = 0x3d95 # The final address of the table, and also what's used to specify an empty entry

# M3 keeps source addresses in a table in bank 0 and banks + destination info in a separate table
# This is pretty much a single table that's been split over 2 banks, and there may be duplicate tileset entries
count = ((terminator - tiletable) // 2)

terminator_key = utils.rom2realaddr((0, terminator))
nametable[terminator_key] = "TilesetSourceAddressTableEnd"

with open("baserom_kabuto.gbc", "rb") as rom, open("game/src/gfx/tileset_table.asm", "w") as output:
    rom.seek(tiletable)
    ptrs = [utils.read_short(rom) for i in range(0, count)]
    rom.seek(utils.rom2realaddr(infotable))
    info = [(utils.read_byte(rom), utils.read_short(rom), utils.read_byte(rom)) for i in range(0, count)]
    data = []

    output.write('INCLUDE "game/src/common/macros.asm"\n\n')
    output.write(f'SECTION "Tileset Source Address Table", ROM0[${tiletable:04X}]\n')
    output.write(f'TilesetSourceAddressTable::\n')

    i = 0
    while i < count:
        ptr = ptrs[i]
        bank = info[i][0]
        vram = info[i][1]
        vbank = info[i][2]
        realptr = utils.rom2realaddr((bank, ptr))
        if namefile and realptr not in nametable:
            # Populate the name file if it doesn't exist
            nametable[realptr] = f"Tileset{realptr:06X}"
            namefile.write(f"{realptr:06X}={nametable[realptr]}\n")
        
        # data[i] = (Bank, Pointer, VRAM Offset, VRAM Bank, Name)
        data.append((bank, ptr, vram, vbank, nametable[realptr]))
        output.write(f"  dw {nametable[realptr]} ; {i:02X} ({(tiletable + i * 2):04X})\n")
        i += 1
    output.write(f"{nametable[terminator_key]}::\n\n")

    # Note the tileset info table
    output.write(f'SECTION "Tileset Info Table", ROMX[${infotable[1]:04X}], BANK[${infotable[0]:X}]\n')
    output.write('TilesetInfoTable::\n')
    i = 0
    while i < count:
        vram = data[i][2]
        vbank = data[i][3]
        name = data[i][4]
        output.write(f'  dbwb BANK({name}), ${vram:04X}, ${vbank:X} ; {i:03X}\n')
        offsetfile.write(f"{i:03X}={vram:04X}\n")
        indexfile.write(f"{i:03X}={name}\n")
        i += 1
    output.write('TilesetInfoTableEnd::\n\n')

    # Dump actual tilesets

    output.write('TilesetData::\n')
    for ptr in nametable:
        name = nametable[ptr]
        realptr = int(ptr, 16) if isinstance(ptr, str) else ptr
        if realptr == terminator_key:
            continue

        p = utils.real2romaddr(realptr)

        with open(f"game/tilesets/{name}.malias","wb") as compressed, \
                open(f"gfx/tilesets/{name}.png","wb") as uncompressed:
            f = tilesets.decompress_tileset(rom, realptr)
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
            output.write(f'  INCBIN "build/tilesets/{name}.malias"\n')
    output.write('TilesetDataEnd::\n')

if namefile:
    namefile.close()

offsetfile.close()
indexfile.close()