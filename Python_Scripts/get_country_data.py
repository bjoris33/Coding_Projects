'''
Author: Ben Joris
Created: October 24, 2019
Purpose: Extract country of origin info from file names and add it to tsv to import into anvio
'''
import glob # glob is a library to get lists of files on your system


countrydict={} # initialize empty dictionary that will be populated with the metadata

######
'''
- This for loop goes through all the full file paths of individual Anvio profiles in a certain directory
- These file paths contain the information on what cohort they belong to, which is the value of the dictionary
- Also added to the value is a number which can be used as a coarse way to order your samples
- Ordering of samples can be done on the metadata directly, but this gives more control
- The keys in the dictionary are the stripped file names
- {samplename:metadata  order_vector}
- To generalize, create a dictionary of your sample name as a key and a tab separated list of the values you wish to add
'''
######
for file in glob.glob("/Volumes/data/gutDB/conjugative_operons/population_mapping/*/*/PROFILE.db"):
    if "africa" in file:
        countrydict[file.split("/")[7].split(".")[0].upper()]="West African Adult"+"\t"+"1"
    if "south_america" in file:
        countrydict[file.split("/")[7].split(".")[0].upper()]="South American Adult"+"\t"+"2"
    if "asia" in file:
        countrydict[file.split("/")[7].split(".")[0].upper()]="South East Asian Adult"+"\t"+"3"
    if "north_america_firstnations" in file:
        countrydict[file.split("/")[7].split(".")[0].upper()]="First Nations Adult"+"\t"+"4"
    if "north_america/" in file:
        countrydict[file.split("/")[7].split(".")[0].upper()]="North American Adult"+"\t"+"5"
    if "north_america_infants" in file:
        countrydict[file.split("/")[7].split(".")[0].upper()]="North American Infant"+"\t"+"6"
    if "europe/" in file:
        countrydict[file.split("/")[7].split(".")[0].upper()]="Western European Adult"+"\t"+"7"
    if "europe_infants" in file:
        countrydict[file.split("/")[7].split(".")[0].upper()]="Western European Infant"+"\t"+"8"



######
'''
- Opens original layer data file
- Takes original line, appends new data, and writes to new file in append mode
- This section depends on the file names (which are in your dictionary) being exact matches to what's in the layer data file
'''
######
with open("originalmisc.txt") as miscfh:
    for line in miscfh:
        if "layers" in line: # for the first line in the file, add the two new column names
            with open("newmisc.txt","a") as newfh:
                newfh.write(line.strip()+"\t"+"cohort"+ "\t"+ "order_vector""\n")
        else: # adding the data to the samples
            with open("newmisc.txt","a") as newfh:
                newfh.write(line.strip()+"\t"+countrydict[line.split("\t")[0]]+"\n")
