#!/bin/bash
# run in directory for project
# takes a gff3 file and combines the matching information to the protein sequences to create a fasta file
# want to create
organism=()
protein=()
annobtained=true

while read line
do
  arr=($line)
  temporg=${arr[0]}
  temppro=${arr[4]}
  organism+=("$temporg")
  protein+=("$temppro")
  if [[ $line == *"sequence-region"* ]];then
    echo $line
    if $annobtained; then
      annobtained=false
    else
      echo "************SOMETHING WENT WRONG**************"
    fi
  fi
  if [[ $line == *"Pfam"* ]];then
    echo $line
  fi
done < <(awk '/##sequence-region/{flag=1}/##FASTA/{flag=0}flag' /Volumes/data/gutDB/genomes/UMGS9.fa.gff3)

count=0
#fastainfo= $(awk '/>pep_/{flag=1}/>match/{flag=0}flag' /Volumes/data/gutDB/genomes/UMGS9.fa.gff3)
#for line in $fastainfo;do
  #if [[ $line == *">pep_"* ]];then
    #echo $line
    #echo ${organism[$count]}
    #echo ${protein[$count]}
    #newfasta=">${organism[$count]};${protein[$count]}"
    #echo $newfasta
    #count=`expr $count + 1`
  #else
    #echo $line
  #fi
#done
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
