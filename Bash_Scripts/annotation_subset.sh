#!/bin/bash
# the purpose of this script is to access the .m8 files, pull out the uniref identifier
# grep out the match from uniref90.fasta
# output ORF and uniref info to file
acclist=()
while read line
do
  arr=($line)
  acc=${arr[1]}
  acclist+=("$acc")
  #grep ${arr[1]} /Volumes/data/uniref/uniref90.fasta
done < <(cat unireftest.m8)

echo "${acclist[*]}"

awk 'NR==FNR{hash[$1];next} $1 in hash{print ">" substr($0, 2); nr[NR+1]; next} NR in nr' read_names.txt all_reads.fastq > subset.fasta
