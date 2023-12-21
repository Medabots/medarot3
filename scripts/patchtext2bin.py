#!/bin/python

import os, sys
sys.path.append(os.path.join(os.path.dirname(__file__), 'common'))
from common import utils, tilesets

if __name__ == '__main__':
    output_file = sys.argv[1]
    input_file = sys.argv[2]

    char_table = utils.reverse_dict(utils.merge_dicts([
            tilesets.get_tileset("VWF", override_offset=0x0),
        ]))

    try:
        with open(output_file, 'wb') as o, open(input_file, 'r', encoding="utf-8") as i:
            for line in i:
                assert(len(line) <= 0xFF)
                o.write(bytearray(utils.txt2bin(line, char_table)))
            o.write(bytearray([0xCB]))
    except:
        try:
            os.remove(output_file)
        except OSError:
            pass