#!/bin/bash
# run in directory for project
# takes a gff3 file and combines the matching information to the protein sequences to create a fasta file
# want to create
gfflist=(`ls *.gff3`)
tsvlist=(`ls *.tsv`)
for i in $(seq 1 2504);do
  organism=()
  protein=()

  while read line
  do
    arr=($line)
    temporg=${arr[0]}
    temppro=${arr[4]}
    organism+=("$temporg")
    protein+=("$temppro")
  done < <(cat ${tsvlist[$i]})

  count=0
  fastainfo=$(awk '/>match/{f=1}f' ${gfflist[$i]})
  for line in $fastainfo;do
    if [[ $line == *">match"* ]];then
      #echo $line
      #echo ${organism[$count]}
      #echo ${protein[$count]}
      newfasta=">${organism[$count]};${protein[$count]}"
      echo $newfasta
      count=`expr $count + 1`
    else
      echo $line
    fi
  done
done
#for file in $(ls *.gff3); do
  #gffinfo= grep -i "date=" $file
  #fastainfo= awk '/>match/{f=1}f' $file
  #echo "#########################"
#done

#gffinfo=$(grep -i "date=" 8080_1_69.fa.gff3)
#arrgff=($gffinfo)
#echo ${arrgff[0]}
#echo ${arrgff[10]}

#for i in $gffinfo; do
  #echo ${i[1]}
  #echo "****************"
#done









#for index in ${!filelist[*]}; do
  #file=${filelist[$index]}
  #meta=${metalist[$index]}
  #file+='.fa'
  #gunzip $file
  #uzfile=${filelist[$index]}
  #uzfile+='.fa'
  #newfile='/Volumes/data/gutDB/genomes/'
  #newfile+=$uzfile
  #sed  "s/>/>$meta\_/" $uzfile > $newfile


  #echo "**** ${filelist[$index]} **** ${metalist[$index]} ****"
#done

#file=${filelist[0]}
#meta=${metalist[0]}
#file+='.fa'
#gunzip $file
#uzfile=${filelist[0]}
#uzfile+='.fa'
#awk 'sub(/NODE_/, "test"); 0' $uzfile
#sed  "s/>/>$meta\_/" $file > /Users/benjoris/Desktop/PhD/Coding_Projects/test3.fa
