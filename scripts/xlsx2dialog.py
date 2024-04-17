#!/bin/python

## Converts translator-defined XLSX file to CSV file for bin conversion
## Usage: python3 scripts/xlsx2csv.py ../Medarot\ 1\ Translation\ Sheet.xlsx ./text/dialog
import sys
import re
import openpyxl as xl
from collections import OrderedDict
import csv
from os import path

sys.path.append(path.join(path.dirname(__file__), 'common'))
from common import utils

font_table = utils.read_table("scripts/res/fonts.tbl", keystring=True)

def transform_line(line):
	line = (line or "").replace('""', '"')
	# D3 is universal linebreak (new line or new box, depending), CF is new line
	line = re.sub(r'\n((?:</{0,1}(?:b|i)>)*)\n', r'<CF>\1', line).replace('\n','<D3>')
	sections = re.split(r'(<b>|</b>|<i>|</i>)', line)
	if len(sections) > 1:
		current_font = "Normal"
		proposed_font = "Normal" # Don't change fonts until we have non-space characters
		line = ""
		for section in sections:
			if section == '<b>':
				assert "Bold" not in proposed_font
				proposed_font = proposed_font + "Bold"
			elif section == '</b>':
				assert "Bold" in proposed_font
				proposed_font = proposed_font.replace("Bold", "", 1)
			elif section == '<i>':
				proposed_font = "ItalicBold" if proposed_font == "NormalBold" else "Italic"
			elif section == '</i>':
				assert "Italic" in proposed_font
				proposed_font = proposed_font.replace("Italic", "Normal", 1)
			elif section:
				if proposed_font != current_font and not section.isspace():
					line += f"<f{int(font_table[proposed_font], 16):02X}>"
					current_font = proposed_font
				line += section
	return line

xlsx = sys.argv[1]
csvdir = sys.argv[2]
SHEETS = list(sys.argv[3:])

wb = xl.load_workbook(filename=xlsx, rich_text=True)

for sheet in wb.worksheets:
	if not sheet.title in SHEETS:
		continue
	values = sheet.values
	data = sheet.rows
	header = next(values)
	index_idx = header.index('Index[#version]') # Index must precede all useful data (data before the pointer index is ignored)
	original_idx = header.index('Original')
	translated_idx = header.index('Translated') # Translated is the end of useful data, everything after this is ignored
	file_path = path.join(csvdir, "{0}.csv".format(sheet.title))
	text = {}
	for line in data:
		if line is None or line[0].value is None:
			continue
		# 'line' is a tuple of Cells
		if str(line[0].value).startswith('#'):
			continue
		idx = line[index_idx].value
		try:
			int(line[index_idx].value.split("#")[0], 16)
		except ValueError:
			continue
		text[idx] = [];
		for x in line[:translated_idx+1]:
			prefix = ["", "<b>", "<i>", "<b><i>"][int(x.font.b) + (int(x.font.i) << 1)]
			suffix = ["", "</b>", "</i>", "</i></b>"][int(x.font.b) + (int(x.font.i) << 1)]
			if type(x.value) is str:
				text[idx].append(prefix + x.value + suffix)
			else:
				start = 1
				t = ""
				if type(x.value) is str:
					t = prefix + x.value[0] + suffix
				else:
					start = 0
				for val in x.value[start:]:
					prefix = ["", "<b>", "<i>", "<b><i>"][int(val.font.b) + (int(val.font.i) << 1)]
					suffix = ["", "</b>", "</i>", "</i></b>"][int(val.font.b) + (int(val.font.i) << 1)]
					t += prefix + val.text + suffix
				text[idx].append(t)
	orig_text = OrderedDict()
	fieldnames = []
	orig_text_idx = None
	with open(file_path, "r", encoding='utf-8-sig', newline='\n') as csvfile:
		reader = csv.reader(csvfile, delimiter=',')
		fieldnames = next(reader)
		while "Translated" in fieldnames:
			fieldnames.remove("Translated")
		orig_text_idx = fieldnames.index("Original")
		orig_index_idx = fieldnames.index('Index[#version]')
		for line in reader:
			idx = line[orig_index_idx]
			orig_text[idx.strip()] = line[:len(fieldnames)]

	with open(file_path, "w", encoding='utf-8-sig', newline='\n') as csvfile:
		print("Writing {0}".format(file_path))
		writer = csv.writer(csvfile, lineterminator='\n', delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)
		fieldnames.append("Translated")
		writer.writerow(fieldnames)
		for ptr in orig_text:
			row = []
			original_text = orig_text[ptr][orig_text_idx]
			if original_text.startswith("=") or original_text == "<IGNORED>":
				row = orig_text[ptr]
				row.append(original_text)
			elif ptr not in text:
				if not ptr.startswith("UNUSED"):
					print("\tWarning: Missing text for {}".format(ptr))
				row = orig_text[ptr]
				row.append("")
			else:
				row = [transform_line(x) if i == (original_idx - index_idx) or i == (translated_idx - index_idx) else x for i, x in enumerate(text[ptr][index_idx:translated_idx+1])]
				row[original_idx - index_idx] = original_text # Keep our dumped version of the original text at all times
			writer.writerow(row)