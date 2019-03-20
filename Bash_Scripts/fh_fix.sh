#!/bin/bash
# replaces spaces in fasta headers with underscores
# changes file extensions to .fa, for consistencies sake for the project this was designed for 
for file in $(ls *.fna); do
  SAMPLE=`basename $file | cut -d "." -f1`
  tr ' ' '_' <$file>$SAMPLE.fa
done
#file=AAVL02.fasta
#SAMPLE=`basename $file | cut -d "." -f1`
#tr ' ' '_' <$file>$SAMPLE.fa
