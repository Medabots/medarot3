import os
import sys

output_file = sys.argv[1]
output_bin_dir = sys.argv[2]
version_suffix = sys.argv[3]
data_file = sys.argv[4]
input_files = sys.argv[5:]

bin_files = {}

for input_file in input_files:
    base_name = os.path.basename(input_file)
    output_path = os.path.join(output_bin_dir, base_name)
    key = os.path.splitext(base_name)[0].rpartition(f"_{version_suffix}")[0]
    bin_files[key] = output_path
    open(output_path, 'wb').close()

with open(output_file, 'w') as output:
    for k in bin_files:
        output.write(f'c{k}        EQUS "\\"{bin_files[k]}\\""\n')