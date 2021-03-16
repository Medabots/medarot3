#!/bin/python

import os, sys
from shutil import copyfile
sys.path.append(os.path.join(os.path.dirname(__file__), 'common'))
from common import utils, tilemaps, tilesets

output_file = sys.argv[1]
input_file = sys.argv[2]
prebuilt_root = sys.argv[3]

fname = os.path.splitext(os.path.basename(input_file))[0]
char_table = {}

# 0xFE is a special character indicating a new line for tilemaps, it doesn't really belong in the tileset table but for this specifically it makes sense
char_table['\n'] = 0xFE

prebuilt = os.path.join(prebuilt_root, f"{fname}.map")
if os.path.isfile(prebuilt):
    print("\tUsing prebuilt {}".format(prebuilt))
    copyfile(prebuilt, output_file)
    os.utime(output_file, None)
    quit()

with open(input_file, 'r', encoding='utf-8-sig') as f:
    mode = int(f.readline().strip().strip('[]'), 16)
    tmap = [mode]
    if mode & 3:
        text = []
        # Assumes every 32 bytes is a new line unless fe is explicitly provided before that
        for line in f:
            b = utils.txt2bin(line, char_table)[0:0x1F]
            text += b
        tmap += tilemaps.compress_tmap(text)
    else:
        text = f.read().replace('\r\n','\n')
        tmap += utils.txt2bin(text, char_table)

    tmap.append(0xFF)
    with open(output_file, 'wb') as of:
        of.write(bytearray(tmap))