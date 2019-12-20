##############
# AUTHOR: Ben Joris
# CREATED: December 20th, 2019
# PURPOSE: Output from iprs2anvio.sh with full fasta header is not importable into anvio
    # Will strip column 1 to the numbers only
# COMMAND LINE ARGS:
    # Position 1: "fixed" tsv for import from iprs2anvio.sh
    # Position 2: tsv output with proper column 1
##############
import sys

with open(sys.argv[1]) as old:
    for line in old:
        if "gene_callers_id" in line:
            with open(sys.argv[2],"a") as new:
                new.write(line)
        else:
            with open(sys.argv[2],"a") as new:
                contents=line.split("\t")
                new.write(contents[0].split("|")[0]+"\t"+contents[1]+"\t"+contents[2]+"\t"+contents[3]+"\t"+contents[4])
