##############
# AUTHOR: Ben Joris
# CREATED: December 20th, 2019
# PURPOSE: Create a tsv of all lengths of contigs in a fasta files
# COMMAND LINE ARGS:
    # Position 1: Fasta file input
    # Position 2: tsv output
##############
import sys # for the command line arguments

# Initialize the data structures
length_dict={}
fasta_header=""
sequence=""

with open(sys.argv[1]) as fasta: # open the input fasta
    for line in fasta: # populate the dictionary with this loop
        if fasta_header is "": # handle file start
            fasta_header=line.strip()[1:] # first fasta header
        else: # rest of the fasta file
            if ">" in line: # if a fasta header
                length_dict[fasta_header]=len(sequence) # dump the contents of the previous fasta entry into dict
                fasta_header=line.strip()[1:] # store new fasta header
                sequence="" # empty the previous sequence
            else:
                sequence=sequence+line.strip() # append sequence to string

with open(sys.argv[2],"a") as tsv: # write tsv
    tsv.write("contig"+"\t"+"length"+"\n") # column names
    for key,value in length_dict.items(): # loop through the contents of the dictionary
        tsv.write(key+"\t"+str(value)+"\n") # write the contents of the dictionary entry to the tsv 
