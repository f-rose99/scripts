#!/usr/bin/python3

import os 
import sys
import csv

# Input parameters: sample location, desired output name and location 
sample_directory = sys.argv[1]
output_name = sys.argv[2]
output_dir = sys.argv[3]

# Name file and output to desired location
tsv = output_name + ".tsv"
tsv = os.path.join(output_dir, tsv)

# Creates tsv with sample name in column 1 and full pathway in column 2
with open(tsv, 'w', newline='') as f_output:
    tsv_output = csv.writer(f_output, delimiter='\t')
    for file in os.listdir(sample_directory):
        sample_name, _ = os.path.splitext(file)
        sample_path = sample_directory + file
        tsv_output.writerow([sample_name, sample_path]) 





