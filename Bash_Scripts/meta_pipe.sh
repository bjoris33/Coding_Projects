#!/bin/bash
# run in directory for project
acclist='SRR341581  SRR341582  SRR341583  SRR341584  SRR341585  SRR341586  SRR341587  SRR341588  SRR341654  SRR341589  SRR341655  SRR341656  SRR341657  SRR341658  SRR341590  SRR341591  SRR341592  SRR341593  SRR341594  SRR341595  SRR341596  SRR341597  SRR341659  SRR341598  SRR341660  SRR341661  SRR341662  SRR341663  SRR341664  SRR341665  SRR341666  SRR341667  SRR341668  SRR341669  SRR341670  SRR341671  SRR341672  SRR341673  SRR341674  SRR341599  SRR341675  SRR341676  SRR341677  SRR341600  SRR341678  SRR341601  SRR341602  SRR341603  SRR341604  SRR341605  SRR341606  SRR341679  SRR341680  SRR341607  SRR341681  SRR341682  SRR341608  SRR341683  SRR341609  SRR341684  SRR341685  SRR341610  SRR341686  SRR341687  SRR341611  SRR341612  SRR341688  SRR341613  SRR341614  SRR341615  SRR341689  SRR341616  SRR341617  SRR341618  SRR341619  SRR341620  SRR341690  SRR341621  SRR341622  SRR341623  SRR341691  SRR341692  SRR341624  SRR341693  SRR341625  SRR341694  SRR341626  SRR341695  SRR341627  SRR341696  SRR341697  SRR341628  SRR341629  SRR341698  SRR341630  SRR341631  SRR341632  SRR341699  SRR341700  SRR341633  SRR341701  SRR341634  SRR341702  SRR341703  SRR341704  SRR341705  SRR341706  SRR341707  SRR341635  SRR341636  SRR341637  SRR341708  SRR341638  SRR341639  SRR341709  SRR341640  SRR341710  SRR341641  SRR341711  SRR341642  SRR341643  SRR341712  SRR341713  SRR341644  SRR341714  SRR341645  SRR341646  SRR341715  SRR341716  SRR341647  SRR341648  SRR341717  SRR341718  SRR341719  SRR341720  SRR341649  SRR341721  SRR341722  SRR341650  SRR341651  SRR341723  SRR341652  SRR341724  SRR341725  SRR341653  SRR413615  SRR413626  SRR413631  SRR413632  SRR413633  SRR413634  SRR413668  SRR413669  SRR413670  SRR413671  SRR413672  SRR1778454  SRR1778455  SRR1778456  SRR1778451  SRR1778452  SRR1778453  SRR413724  SRR413725  SRR413726  SRR413727  SRR413730  SRR413731'
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

  wget $urlf
  wget $urlr

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
