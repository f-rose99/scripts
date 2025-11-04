#!/bin/bash

ref=$1
sample_dir=$2
out_dir=$3
mqc_title=$4

# Make a quast output directory e.g. path/to/quast_results
mkdir -p $out_dir

# Run quast on each of your samples
for sample in "$sample_dir"*; do 
    sample_name=$(basename $sample .fna)
    quast -r $ref $sample -o "$out_dir/${sample_name}_quast"/
done 

# Combine outputs using multiqc 
multiqc $out_dir --outdir $out_dir --title $mqc_title