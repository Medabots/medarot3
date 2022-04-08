#!/bin/python

# Script to dump free space in each bank
# Just naively counts 00s starting from the end of each bank and generates a file

import sys
import os
from collections import OrderedDict

sys.path.append(os.path.join(os.path.dirname(__file__), 'common'))
from common import utils

rom_info = ([
            ("baserom_kabuto.gbc", "kabuto"), 
            ("baserom_kuwagata.gbc", "kuwagata")
           ]) # (File, Version)

manual_offsets = ({
                    0x27: 16, # Unknown00 Pointer List
                    0x36: 0x400,
                  })

output_file = sys.argv[1]
version_dir = sys.argv[2]

free_info = OrderedDict()

for rom in rom_info:
  filename = rom[0]
  version = rom[1]
  with open(filename, 'rb') as f:
    f.seek(0, os.SEEK_END)
    
    end = f.tell()
    bank = 0x01

    while(bank <= 0xff):
      bank_start = bank * 0x4000
      bank_end = bank_start + 0x3fff
      f.seek(bank_end, os.SEEK_SET) # Seek to the end of the bank

      while(f.read(1) == b'\x00'):
        if f.seek(-2, os.SEEK_CUR) == bank_start:
          break

      # I purposely wanted to see how unreadable this line could be made
      curr_pos = f.tell() + (manual_offsets[bank] if bank in manual_offsets else 1 if f.tell() != bank_start else 0)
      curr_pos = utils.real2romaddr(curr_pos)[1]

      if bank not in free_info:
        free_info[bank] = curr_pos
      elif free_info[bank] != curr_pos:
        if(type(free_info[bank]) is not list):
          free_info[bank] = [free_info[bank]]
        free_info[bank].append(curr_pos)
      bank += 1

files = [open(os.path.join(version_dir, version[1], output_file), 'w') for version in rom_info]
for file in files:
  file.write(f'INCLUDE "{os.path.join(version_dir, output_file)}"\n\n')

files.append(open(os.path.join(version_dir, output_file), 'w'))

try:
  for bank in free_info:
    addr = free_info[bank]
    if type(addr) is list:
      # Versioned
      for idx, i in enumerate(addr):
          files[idx].write(f'SECTION "BANK{bank:02X}_END", ROMX[${addr[idx]:X}], BANK[${bank:X}]\n')
          files[idx].write(f'BANK{bank:02X}_END::\n')
          files[idx].write(f'REPT $8000 - BANK{bank:02X}_END\n')
          files[idx].write(f'  db 0\n')
          files[idx].write(f'ENDR\n\n')
    else:
      files[-1].write(f'SECTION "BANK{bank:02X}_END", ROMX[${addr:X}], BANK[${bank:X}]\n')
      files[-1].write(f'BANK{bank:02X}_END::\n')
      files[-1].write(f'REPT $8000 - BANK{bank:02X}_END\n')
      files[-1].write(f'  db 0\n')
      files[-1].write(f'ENDR\n\n')
finally:
  for file in files:
    file.close()
