# Purpose of this script is to take the most common taxonomic annotation for each genome
# Leads to a consistent assignment of the taxonomy for the genomes
# Functional script; however, the assignments probably aren't scienficially valid


import xml.etree.ElementTree as ET
import urllib.request, urllib.parse, urllib.error
import ssl
import json
import re
import glob
import os

# NEED TO DO: Create a dictionary of dictionaries to solve this problem 
func={}
fh=open("13414_6_44.faa.m8")
for line in fh:
    x = re.search("(^\S*)\s", line).group(1)
    y = re.search("UniRef90_(\w+){1}:(\S*):n=", line).group(2)
    if y not in func:
        func[y] = 1
    else:
        func[y] = func[y] + 1
    l = list()
    for key, val in func.items():
        l.append((val,key))
    l.sort(reverse=True)
    function=l[0][1]
    print(x+"\t"+function)
