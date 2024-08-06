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

        if index.startswith("UNUSED") or translated_text.startswith("@") or translated_text.startswith("<#NOCHECK_TEXTSPEED>"):
            continue

        original_codes = re.findall(r"((?:\<#NOCHECK_TEXTSPEED\>)?\<S.+?\>)", original_text)
        translated_codes = re.findall(r"((?:\<#NOCHECK_TEXTSPEED\>)?\<S.+?\>)", translated_text)

        errors = None
        if len(original_codes) != len(translated_codes):
            # If the length doesn't match, then short-circuit and show the error
            errors = [f"Text speed control code count doesn't match (original {len(original_codes)} != {len(translated_codes)})"]
        elif original_codes != translated_codes:
            errors = [f"Mismatched Text speed control code: {p[1]} -> {p[0]}" for p in zip(original_codes, translated_codes) if p[0] != p[1] and not p[1].startswith("<#NOCHECK_TEXTSPEED>")]
        
        if errors is not None and len(errors) > 0:
            print(f"Check Text speed Control Code: {base_filename}:{index}: ", end = '')
            print(errors)