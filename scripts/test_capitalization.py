#!/bin/python
import csv
import os
import re
import sys
import string

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

    for row in reader:
        if row[idx_text].startswith("@"):
            continue
        i = row[idx_index]
        text = re.sub(r"\<.+?\>(?:'s)*", ' ', row[idx_text])
        words = re.split(' ', text)
        if len(words) == 0:
            continue
        l = []

        w_np = words[0].translate(str.maketrans('', '', string.punctuation))
        if len(w_np) > 0 and w_np[0].isalpha() and not w_np[0].isupper():
            l.append(w_np)

        for w, word in enumerate(words[1:], 1):
            # Get a version of the word with no punctuation
            w_np = word.translate(str.maketrans('', '', string.punctuation))

            if w_np.upper() in glossary and w_np != glossary[w_np.upper()] and not words[w - 1] == '' and not words[w - 1].endswith(('.', '?', '!')):
                l.append(w_np)

        if len(l) > 0:
            failed.append((i, l))

for f in failed:
    print(f"Capitalization: {base_filename}:{f[0]}: {f[1]}")