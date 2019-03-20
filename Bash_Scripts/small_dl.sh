#!/bin/bash
# run in directory for project
dllist='ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR177/001/SRR1778451/SRR1778451_1.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR177/001/SRR1778451/SRR1778451_2.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR177/002/SRR1778452/SRR1778452_1.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR177/002/SRR1778452/SRR1778452_2.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR177/003/SRR1778453/SRR1778453_1.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR177/003/SRR1778453/SRR1778453_2.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR177/004/SRR1778454/SRR1778454_1.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR177/004/SRR1778454/SRR1778454_2.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR177/005/SRR1778455/SRR1778455_1.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR177/005/SRR1778455/SRR1778455_2.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR177/006/SRR1778456/SRR1778456_1.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR177/006/SRR1778456/SRR1778456_2.fastq.gz'
for i in $dllist; do
  echo $i
  wget $i
done
