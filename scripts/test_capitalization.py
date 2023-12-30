#!/bin/python
import csv
import os
import re
import sys

lang_code = sys.argv[1]
input_file = sys.argv[2]
glossary_file = sys.argv[3]

base_filename = os.path.basename(input_file)

glossary = None
with open(glossary_file, 'r', encoding='utf-8-sig') as fp:
    reader = csv.reader(fp, delimiter=',', quotechar='"')
    header = next(reader, None)
    idx = header.index(lang_code)
    glossary_words = set(
        word
        for row in reader
        for word in re.split(',', row[idx])
    )
    glossary = { v.upper() : v for v in glossary_words }

failed = []
with open(input_file, 'r', encoding='utf-8-sig') as fp:
    reader = csv.reader(fp, delimiter=',', quotechar='"')
    header = next(reader, None)
    idx_index = header.index("Index[#version]")
    idx_pointer = header.index("Pointer[#version|]")
    idx_text = header.index("Translated")


    for i, row in enumerate(reader, 1):
        words = re.findall(r"<[^>]+>|[\w\']+", row[idx_text])
        l = [w for w in words if w.upper() in glossary and w != glossary[w.upper()]]
        if len(l) > 0:
            failed.append((i, l))

for f in failed:
    print(f"{base_filename}:{f[0]:02}: {f[1]}")