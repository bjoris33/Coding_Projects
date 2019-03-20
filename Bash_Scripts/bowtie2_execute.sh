#!/bin/bash
# run in directory containing your db files
# note: only outputs a single sam file, construct a loop if you want to create a sam for each file
# bash script for executing bowtie2 on default settings, consult manual for options (or mapping_results file I have on my Macbook)
acclist1='paired_SRR341581_1.fastq,paired_SRR341582_1.fastq,paired_SRR341583_1.fastq'
acclist2='paired_SRR341581_2.fastq,paired_SRR341582_2.fastq,paired_SRR341583_2.fastq'

echo $acclist
/Volumes/data/bin/bowtie2 -p 10 -x t2d -1 $acclist1 -2 $acclist2 -S test.sam
