#!/bin/bash
# runs fastqc on all fastq files in directory, made for Thomas' nature communications paper
for file in $(ls *.fastq); do
  /Volumes/data/bin/FastQC/fastqc $file -o ./qc/
  #echo "#########################"
done
