#!/bin/bash
# replaces spaces in fasta headers with underscores
# changes file extensions to .fa, for consistencies sake for the project this was designed for
count=0
for file in $(ls *.fa); do
  if [ "$file" = "combined.fa" ]
  then
    echo "***********************"
    continue
  fi
  #((i=i%N)); ((i++==0)) && wait
  count=`expr $count + 1`
  if [ $count -lt 500 ]
  then
  echo $file
  echo $count
  /Volumes/data/interpro/interproscan-5.32-71.0/interproscan.sh -t n -appl Pfam,TIGRFAM,PRINTS,PROSITEPATTERNS,Gene3d -pa -iprlookup -goterms -i $file
  fi
  #echo "#########################"
done
