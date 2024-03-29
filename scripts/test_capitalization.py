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
        word.translate(str.maketrans('', '', string.punctuation))
        for row in reader
        for word in re.split(',', row[idx])
    )
    glossary = { v.upper() : v for v in glossary_words }
    glossary_multiple_words_pattern = re.compile("|".join([ glossary[k] for k in glossary if len(glossary[k].split(' ')) > 1 ]))

failed = []
with open(input_file, 'r', encoding='utf-8-sig') as fp:
    reader = csv.reader(fp, delimiter=',', quotechar='"')
    header = next(reader, None)
    idx_index = header.index("Index[#version]")
    idx_text = header.index("Translated")

    for row in reader:
        if row[idx_index].startswith("UNUSED") or row[idx_text].startswith("@"):
            continue
        i = row[idx_index]
        # Strip out control codes
        text = re.sub(r"\<&.+?\>", '01234567', row[idx_text])
        text = re.sub(r"\<D1\>", ' ', text)
        text = re.sub(r"\<D3\>", ' ', text)
        text = re.sub(r"\<CD\>", ' ', text)
        text = re.sub(r"\<CF\>", ' ', text)
        text = re.sub(r"\<.+?\>", '', text)
        # Replace multi-word phrases since they may capitalize words that may otherwise not be capitalized normally
        text = glossary_multiple_words_pattern.sub('A', text)

        words = re.split(' ', text)
        if len(words) == 0:
            continue
        l = []

        # First word should always be capitalized with some exceptions
        w_np = words[0].translate(str.maketrans('', '', string.punctuation))
        if len(w_np) > 0 and w_np != "'s" and not words[0].startswith("...") and w_np[0].isalpha() and not w_np[0].isupper():
            l.append(w_np)

        for w, word in enumerate(words[1:], 1):
            # Get a version of the word with no punctuation
            w_np = word.translate(str.maketrans('', '', string.punctuation))
            if len(w_np) == 0:
                continue

            is_first_word = words[w - 1].endswith(('.', '?', '!'))
            is_ellipsis = words[w - 1].endswith("...") or word.startswith("...")
            is_capitalized = not w_np[0].islower()

            if is_first_word and not is_ellipsis:
                if len(w_np) > 0 and w_np[0].islower():
                    l.append(w_np)
            elif not is_first_word and w_np.upper() in glossary and w_np != glossary[w_np.upper()]:
                    l.append(w_np)

        if len(l) > 0:
            failed.append((i, l))

for f in failed:
    print(f"Capitalization: {base_filename}:{f[0]}: {f[1]}")