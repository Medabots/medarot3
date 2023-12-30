#!/bin/python
import csv
import os
import re
import sys

input_file = sys.argv[1]

base_filename = os.path.basename(input_file)

with open(input_file, 'r', encoding='utf-8-sig') as fp:
    reader = csv.reader(fp, delimiter=',', quotechar='"')
    header = next(reader, None)
    idx_index = header.index("Index[#version]")
    idx_original = header.index("Original")
    idx_text = header.index("Translated")

    for row in reader:
        original_text = row[idx_original]
        translated_text = row[idx_text]
        index = row[idx_index]

        if index.startswith("UNUSED") or translated_text.startswith("@"):
            continue

        original_portraits = re.findall(r"\<@.+?\>", original_text)
        translated_portraits = re.findall(r"\<@.+?\>", translated_text)

        if original_portraits != translated_portraits:
            print(f"Portraits: {base_filename}:{index}: ", end = '')
            if len(original_portraits) != len(translated_portraits):
                print("Portrait count doesn't match")
            else:
                print(f'Mismatched portraits: {[f"{p[1]} -> {p[0]}" for p in zip(original_portraits, translated_portraits) if p[0] != p[1]]}')