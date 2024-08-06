#!/bin/python

import sys
import openpyxl as xl
import csv
from os import path

sys.path.append(path.join(path.dirname(__file__), 'common'))
from common import utils

xlsx = sys.argv[1]
file_path = sys.argv[2]
sheet_name = sys.argv[3]

wb = xl.load_workbook(filename = xlsx)

for sheet in wb.worksheets:
	if not sheet.title == sheet_name:
		continue
	values = sheet.values
	data = sheet.rows
	with open(file_path, "w", encoding='utf-8-sig', newline='\n') as csvfile:
		writer = csv.writer(csvfile, lineterminator='\n', delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)
		for line in data:
			if line is None or line[0].value is None:
				continue
			writer.writerow([x.value for x in line])