#!/bin/bash

for r1 in /mnt/iusers01/fatpou01/bmh01/s12846fp/analysis/WP1/samples/reads/*_1_trimmed.fastq.gz; do
    r2="${r1/_R1/_R2}"
    sample=$(basename "$r1" _R1.fastq.gz)
    echo -e "${sample}\t${r1}\t${r2}"
done > snippy_sample_sheet.txt