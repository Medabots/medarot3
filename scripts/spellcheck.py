import csv
import glob
import os
import re
import sys
from dataclasses import dataclass

from pygit2 import Repository
from spellchecker import SpellChecker


@dataclass(frozen=True)
class Line:
    words: list[str]


@dataclass(frozen=True)
class File:
    name: str
    lines: list[Line]


checker = SpellChecker()

dialog_dir = sys.argv[1]
glossary = sys.argv[2]
known_words_lists = sys.argv[3:]

# Either tr_EN or tr_EN-US
branch_name = Repository(".").head.shorthand


# Open glossary file and add words based on language version
# NOTE: Can be expanded for other languages later
with open(glossary) as csv_file:
    reader = csv.reader(csv_file, delimiter=",")
    glossary_words = set(
        word
        for row in reader
        for word in (row[1] if branch_name == "tr_EN" else row[2]).split()
    )
    checker.word_frequency.load_words(glossary_words)


# Add additional known words to the dictionary
for known_words_list in known_words_lists:
    checker.word_frequency.load_text_file(known_words_list)

# Get list of .csv files in dialog dir
csv_files = glob.glob(os.path.join(dialog_dir, "*.csv"))

# Set of all unknown words
unknown: set[str] = set()

# Dictionary mapping words to their corrected words
corrections: dict[str, str] = {}

# List containing file data
files: list[File] = []

# Build set of unknown words and make a dictionary with line information
for filename in sorted(csv_files):
    base_filename = os.path.basename(filename)
    # List of all lines in the file
    lines: list[Line] = []
    with open(filename, newline="") as csv_file:
        reader = csv.reader(csv_file, delimiter=",")
        for i, row in enumerate(reader, 1):
            # The translated column is the third column in the .csv
            translated = row[3]
            # Extract words from line
            words: list[str] = re.findall(r"<[^>]+>|[\w\']+", translated)
            # Update the set with all unknown words
            unknown.update(checker.unknown(words))
            # Saving lines for later output
            lines.append(Line(words))
    # Add file data to list
    files.append(File(base_filename, lines))

# Spellcheck unknown words
for word in unknown:
    # Skip correcting the word if any of the following statements are true
    if any(
        [
            # The word is already corrected
            word in corrections,
            # The word is in < >
            re.match(r"<[^\]]+>", word),
            # The word is less than 3 characters
            len(word) < 3,
            # The word contains quotes
            "'" in word,
        ]
    ):
        continue
    # Get the correction of the word
    correction = checker.correction(word)
    # If the correction succeeded
    if correction != None:
        # Add the correction to the dictionary
        corrections[word.lower()] = correction

for file in files:
    for i, line in enumerate(file.lines, 1):
        for word in line.words:
            # If the word is misspelled
            if word.lower() in corrections:
                print(f"{file.name}:{i}\t{word} -> {corrections[word.lower()]}")
