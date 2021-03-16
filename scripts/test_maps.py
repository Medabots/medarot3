#!/bin/python

import os, sys, glob
from shutil import copyfile
sys.path.append(os.path.join(os.path.dirname(__file__), 'common'))
from common import utils, tilemaps

prebuilt_root = sys.argv[1]


print(f"Test that compression generates the same decompressed result")
compression_match_fail = []
for filename in glob.glob(os.path.join(prebuilt_root, '*.map')):
    with open(filename, 'rb') as f:
        print(f"\t Testing {filename}")
        original_data = list(f.read())
        mode = original_data[0]
        assert mode != 0
        decompressed_data = tilemaps.decompress_tilemap(original_data[1:])
        assert decompressed_data[-1] == 0xff
        recompressed_data = tilemaps.compress_tmap(decompressed_data)
        compression_match = original_data[1:] == recompressed_data
        redecompressed_data = tilemaps.decompress_tilemap(recompressed_data)
        decompression_match = decompressed_data == redecompressed_data
        if not compression_match:
            compression_match_fail.append( (filename, "Worse Compression" if len(original_data[1:]) < len(recompressed_data) else "Better/Same Compression") )
        assert decompression_match

if(len(compression_match_fail)):
    print("Compression did not match for the following:")
    for cmf in compression_match_fail:
        print(cmf)

print("OK!")