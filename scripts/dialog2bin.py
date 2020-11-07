import os
import sys

output_file = sys.argv[1]
input_file = sys.argv[2]
column_name = sys.argv[3]
version_suffix = sys.argv[4]

open(output_file, 'wb').close()