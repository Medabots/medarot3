#!/bin/python

## Converts translator-defined XLSX file to pointer list
## Usage: python3 scripts/xlsx2csv.py ../Medarot\ 1\ Translation\ Sheet.xlsx ./text/ptrlists
from collections import OrderedDict
import sys
import re
import openpyxl as xl
import csv
import functools
from os import path

sys.path.append(path.join(path.dirname(__file__), 'common'))
from common import utils

font_table = utils.read_table("scripts/res/fonts.tbl", keystring=True)

def transform_line(line):
    line = (line or "").replace('""', '"')
    return line

def try_int(val):
    try:
        val = int(val)
    except ValueError:
        pass
    return val


lang_code = sys.argv[1]
glossary_file = sys.argv[2]
xlsx = sys.argv[3]
csvdir = sys.argv[4]
SHEETS = list(sys.argv[5:])

# Rely on regex substitutions at word boundaries
substitutions = []
with open(glossary_file, "r", encoding='utf-8-sig', newline='\n') as csvfile:
    reader = csv.reader(csvfile, delimiter=',')
    header = next(reader)
    lang_idx = header.index(lang_code)
    assert lang_idx > 0
    if lang_idx != 1: # Only care about substitutions if we aren't the default language
        string_replacements = []
        for line in reader:
            string_replacements += list(zip(line[1].split(','), line[lang_idx].split(',')))

        string_replacements.sort(key=lambda string: len(string[0]), reverse=True)

        for string in string_replacements:
            if string[0] == string[1]:
                continue
            substitutions.append(functools.partial(re.sub, r"\b" + re.escape(string[0].strip()) + r"\b", string[1].strip()))

wb = xl.load_workbook(filename = xlsx)

for sheet in wb.worksheets:
    if not sheet.title in SHEETS:
        continue
    values = sheet.values
    data = sheet.rows
    header = next(values)
    file_path = path.join(csvdir, "{0}.txt".format(sheet.title))

    # Get the remaining indices from the file itself
    metadata = []
    fieldnames = []
    updated_data = OrderedDict()
    with open(file_path, "r", encoding='utf-8-sig', newline='\n') as csvfile:
        reader = csv.reader(csvfile, delimiter=',')
        
        # Get the metadata
        metadata.append(next(csvfile))
        metadata.append(next(csvfile))
        metadata.append(next(csvfile))

        fieldnames = next(reader)
        
        index_idx = fieldnames.index('Index[#version]')
        assert index_idx == header.index('Index[#version]') == 0, "Index must always be first"
        
        # Get the indices in the sheet of the relevant fields
        # Will preserve the order in the original ptrlist and will error if any are misisng
        data_idxs = [header.index(x) for x in fieldnames]
        assert len(data_idxs) == len(fieldnames), f"Not all data columns are accounted for in {sheet.title}"

        next(data) # Skip header row
        for row in data:
            if row is None or row[0].value is None:
                # An empty line most likely got introduced by mistake
                continue
            # Convert the index to an int because sometimes the sheet turns it into a float
            idx = row[index_idx].value.strip() if type(row[index_idx].value) is str else try_int(row[index_idx].value)
            idx = str(idx)
            updated_data[idx] = [row[x].value if row[x].value is not None else "?" for x in data_idxs]
            updated_data[idx][0] = updated_data[idx][0].strip() if type(updated_data[idx][0]) is str else try_int(updated_data[idx][0])

        # Check that every line is accounted for, or preserve the original
        for line in reader:
            idx = line[0].strip() if type(line[0]) is str else try_int(line[0])
            idx = str(idx)
            if idx in updated_data:
                continue
            else:
                print(f"::warning file=scripts/xlsx2ptrlist.py,line=1,col=1,endColumn=1::Missing data for {idx} in {sheet.title}")
                updated_data[idx] = line

    # With all the data we need, reopen the file for writing and go
    print(f"Writing {file_path}")
    with open(file_path, "w", encoding='utf-8-sig', newline='\n') as csvfile:
        csvfile.write(''.join(metadata)) # We preserve the newlines, so no need to add them
        writer = csv.writer(csvfile, lineterminator='\n', delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)
        writer.writerow(fieldnames)
        for idx in updated_data:
            # TODO: This probably won't break but it's a bit shady
            for column, data in enumerate(updated_data[idx]):
                for subst in substitutions:
                    if type(data) is str:
                        updated_data[idx][column] = subst(data)
            writer.writerow(updated_data[idx])
