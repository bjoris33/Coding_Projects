# Coding_Projects

# Purpose of Repository
This repository was created to house miscellaneous scripts that I have written during my PhD. I will try to comment the best I can, but the majority of the tools will not be developed with generalizability in mind.

# Table of Contents
general_functions.Rmd - a document for command line functions used to call tools on the server or locally (read the manuals for more information)

## Python_scripts
* ena_meta.py - a script for fetching metadata information from sample XML file on ENA
* accession_matching.py - a script for building assembly download links for ENA from list of samples of raw reads
* wgs_links.py - python script for generating a text file of download links to 

## R_scripts
* pca_sep_loop.R - a script for separating features based on the PCA values
* tax_collapse.R - a script for taking all the rows for a unique taxonomic assignment in a count table and collapsing them into a single row
* CDS_biplot.R - code for recreating a biplot in the plot function, useful for when you only want the samples to be plotted (with colour), but not the features

## Bash_Scripts
* meta_pipe.sh - a script for pulling metagenomic datasets from online, unzipping , deduping, re-merging, and trimming them
* assembly_dl.sh - shell loop for downloading assemblies from urls created by accession_matching.py
* bowtie2_execute.sh - shell script for default execution of bowtie2
* bt2_gutdb.sh - shell script for building bowtie2 index
* count-fh.sh - shell script for counting fasta headers in a list of files
* fh_fhgr.sh - shell script for editing fasta headers
* fh_fix.sh - replaces spaces in fasta headers and changes file extensions
* fh_umgs.sh - same idea as fh_fhgr.sh
* meta_pipe_small.sh - smaller version of meta_pipe.sh (in terms of number of downloads)
* small_dl.sh - just a wget loop for some ENA data
* wgs_links.py - wget loop for downloading genomes

## Perl_Scripts
* merge_filtered_fastq.pl - written by GG - a script for re-merging files following dedupe (dedupe creates mismatched files)
