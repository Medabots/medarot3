import argparse
import csv
import os
import re
from dataclasses import dataclass

from spellchecker import SpellChecker


@dataclass(frozen=True)
class Line:
    words: list[str]


@dataclass(frozen=True)
class File:
    name: str
    lines: list[Line]


def parse_arguments():
    parser = argparse.ArgumentParser(description="Spellcheck CSV files.")
    parser.add_argument("language", help="Language identifier")
    parser.add_argument("filename", help="CSV file for dialog")
    parser.add_argument("glossary", help="Path to the glossary CSV file")
    parser.add_argument(
        "known_words_lists", nargs="*", help="List of known words files"
    )

    return parser.parse_args()


def main():
    args = parse_arguments()
    checker = SpellChecker()

    language_code = args.language
    filename = args.filename
    glossary = args.glossary
    known_words_lists = args.known_words_lists

    # Open glossary file and add words based on language version
    with open(glossary) as glossary_csv_file:
        reader = csv.reader(glossary_csv_file, delimiter=",")
        header = next(reader)
        language_index = header.index(language_code)
        glossary_words = set(
            word
            for row in reader
            for word in re.split(' |,', row[language_index])
        )
        checker.word_frequency.load_words(glossary_words)

    # Add additional known words to the dictionary
    for known_words_list in known_words_lists:
        checker.word_frequency.load_text_file(known_words_list)

    # Set of all unknown words
    unknown: set[str] = set()

    # Dictionary mapping words to their corrected words
    corrections: dict[str, str] = {}

    # List containing file data
    files: list[File] = []


    # Build set of unknown words and make a dictionary with line information
    lines: list[Line] = []
    with open(filename, 'r', encoding='utf-8-sig') as csv_file:
        reader = csv.reader(csv_file, delimiter=",")
        header = next(reader, None)
        idx_text = header.index("Translated")
        for row in reader:
            # The translated column is the third column in the .csv
            translated = row[idx_text]
            # Extract words from line
            words: list[str] = re.findall(r"<[^>]+>|[\w\']+", translated)
            # Update the set with all unknown words
            unknown.update(checker.unknown(words))
            # Saving lines for later output
            lines.append(Line(words))
    base_filename = os.path.basename(filename)
    file = File(base_filename, lines)

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
        if correction is not None:
            # Add the correction to the dictionary
            corrections[word.lower()] = correction

    for i, line in enumerate(file.lines, 1):
        for word in line.words:
            # If the word is misspelled
            if word.lower() in corrections:
                print(f"Spellcheck: {file.name}:{i}\t{word} -> {corrections[word.lower()]}")

if __name__ == "__main__":
    main()
