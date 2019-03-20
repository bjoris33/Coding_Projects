#!/bin/bash
# run in directory for project
acclist='SRR1778454 SRR1778455 SRR1778456 SRR1778451 SRR1778452 SRR1778453'
for i in $acclist; do
  urlb="ftp://ftp.sra.ebi.ac.uk/vol1/fastq/"
  acc=$i
  short=$(echo $acc | cut -c1-6)
  urlef="_1.fastq.gz"
  urler="_2.fastq.gz"
  urlefuz="_1.fastq"
  urleruz="_2.fastq"
  urlbase="$urlb"
  urlbase+="$short"
  urlbase+="/"
  urlbase+="$acc"
  urlbase+="/"
  urlbase+="$acc"
  urlf="$urlbase$urlef"
  urlr="$urlbase$urler"
  fastqgzf="$acc$urlef"
  fastqgzr="$acc$urler"


  gunzip $fastqgzf
  gunzip $fastqgzr

  fastqf="$acc$urlefuz"
  fastqr="$acc$urleruz"

  pair="paired_"
  unpair="unpaired_"
  ddf="ddf_$fastqf"
  ddr="ddf_$fastqr"
  ftrimp=$pair$fastqf
  ftrimu=$unpair$fastqf
  rtrimp=$pair$fastqr
  rtrimu=$unpair$fastqr
  #/Volumes/data/bin/FastQC/fastqc $fastqgzf -t 1 -o ./qc
  #/Volumes/data/bin/FastQC/fastqc $fastqgzr -t 1 -o ./qc

  /Volumes/data/bin/bbmap/dedupe.sh in=$fastqf out=$ddf ac=f -Xmx100g
  /Volumes/data/bin/bbmap/dedupe.sh in=$fastqr out=$ddr ac=f -Xmx100g

  perl merge_filtered_fastq.pl $ddf $ddr

  count1=$(head fastq1.fastq -n2 | wc -c)
  count2=$(head fastq1.fastq -n1 | wc -c)
  count3=`expr $count1 - $count2`
  trimcount=`expr $count3 - 3`

  java -jar /Volumes/data/bin/Trimmomatic-0.36/trimmomatic-0.36.jar PE -threads 10 -phred33  fastq1.fastq fastq2.fastq $ftrimp $ftrimu $rtrimp $rtrimu LEADING:10 TRAILING:10 CROP:$trimcount MINLEN:$trimcount
  rm $fastqf
  rm $fastqr
  rm $ftrimu
  rm $rtrimu
  rm $ddf
  rm $ddr
  rm fastq1.fastq
  rm fastq2.fastq
done
