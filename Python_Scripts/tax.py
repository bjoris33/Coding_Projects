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

for file in glob.glob("*.m8"):
    taxdict={}
    fh=open(file)
    for line in fh:
        x = re.search("TaxID=(\d*):", line).group(1)
        if x not in taxdict:
            taxdict[x] = 1
        else:
            taxdict[x] = taxdict[x] + 1

    l = list()
    for key, val in taxdict.items():
        l.append((val,key))
    l.sort(reverse=True)
    tax=l[0][1]
    if tax == "1":
        tax = l[1][1]

    ctx = ssl.create_default_context()
    ctx.check_hostname = False
    ctx.verify_mode = ssl.CERT_NONE


    url = 'https://www.ebi.ac.uk/ena/data/view/Taxon:%s&display=xml' % tax
    #print(url)
    html = urllib.request.urlopen(url, context=ctx).read()
    phylum = "Undefined"
    taxclass = "Undefined"
    order = "Undefined"
    family = "Undefined"
    genus = "Undefined"
    species = "Undefined"
    tree = ET.fromstring(html)
    basetax = tree.findall("taxon")
    if basetax[0].get("rank") == "species":
        fullspecies = basetax[0].get("scientificName")
        species = re.search("\s(\w*)", fullspecies).group(1)
    if basetax[0].get("rank") == "genus":
        genus = basetax[0].get("scientificName")
    if basetax[0].get("rank") == "family":
        family = basetax[0].get("scientificName")
    if basetax[0].get("rank") == "order":
        order = basetax[0].get("scientificName")
    if basetax[0].get("rank") == "class":
        taxclass = basetax[0].get("scientificName")
    if basetax[0].get("rank") == "phylum":
        phylum = basetax[0].get("scientificName")
    basetaxa = basetax[0].get("scientificName")
    #print(basetaxa)
    taxlist = tree.findall('taxon/lineage/taxon')
    #print(taxlist)
    for el in taxlist:
        if el.get("rank") == "genus":
            genus = el.get("scientificName")
        if el.get("rank") ==	"family":
            family = el.get("scientificName")
        if el.get("rank") ==	"order":
            order = el.get("scientificName")
        if el.get("rank") ==	"class":
            taxclass = el.get("scientificName")
        if el.get("rank") ==	"phylum":
            phylum = el.get("scientificName")
        taxa = el.get("scientificName")
    filebase = re.search("(.*)\.faa\.m8", file).group(1)
    print(filebase+"\t"+phylum+"_"+taxclass+"_"+order+"_"+family+"_"+genus+"_"+species)


#print("%s_%s_%s_%s_%s_%s") % (phylum, taxclass, order, family, genus, species)
