#!/bin/bash
# looks at all the interpro annotated files and greps out any entries that contain type iv
# looking for type iv secretion systems in out bacteria 
for file in $(ls *.gff3); do
  grep -i "type iv" $file
  #echo "#########################"
done
