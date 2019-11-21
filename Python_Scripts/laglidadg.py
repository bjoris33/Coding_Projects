'''
Desired outcomes of this script: read laglidag.txt, open relavent .m8 file and retrieve all 10 annotations for the ORF and write to file, retieve protein sequence for the endonuclease and write to a file, retrieve DNA sequence and output laglidag specific area and area +/- 1000nt


'''

# Retrieve all the names of the orfs (with the filename brought along)
orflist=[]
ftxt=open("../prodigal/laglidadg.txt")
for line in ftxt:
    i=line.split("\t")
    if i[0] not in orflist:
        orflist.append(i[0])
ftxt.close()

#x=orflist[0]
for x in orflist:
    q=x.split(":")
    bn=q[0].split(".")[0]
    ffaam8=open("../prodigal/"+bn+".faa.m8")
    newm8=open(bn+".m8","a")
    for line in ffaam8:
        if q[1] in line:
            newm8.write(line)
            #print(line)
    newm8.close()
    ffaam8.close()

    headerflag=False
    fhfaa=open("../prodigal/"+bn+".faa")
    newfaa=open(bn+".faa", "a")
    for line in fhfaa:
        stripped=line.strip()
        if ">" in line:
            headerflag=False
        if q[1] in line:
            newfaa.write(line)
            faheader=line.split(" # ")
            startpos=faheader[1]
            stoppos=faheader[2]
            direct=faheader[3]
            #print(startpos,stoppos,direct)
            headerflag=True
        elif headerflag is True:
            newfaa.write(line)
    fhfaa.close()
    newfaa.close()

    fhfna=open("../genomes/"+bn+".fa")
    dnah=q[1].rsplit("_",1)[0]
    fnaflag=False
    fnabody=""
    for line in fhfna:
        if ">" in line:
            fnaflag=False
        if dnah in line:
            fnaflag=True
            fnaheader=line.strip()
        elif fnaflag is True:
            fnabody=fnabody+line.strip()
    fhfna.close()
    newfna=open(bn+".fna", "a")
    dna1=int(startpos)-1
    dna2=int(stoppos)
    newfna.write(fnaheader+"\n")
    newfna.write(fnabody[dna1:dna2]+"\n")
    newfna.close()
    fna1000=open(bn+"_1000.fna", "a")
    dna1000=dna1-1000
    dna2000=dna2+1000
    if dna1000 > -1 and dna2000 < len(fnabody):
        fna1000.write(fnaheader+"\n")
        fna1000.write(fnabody[dna1000:dna2000]+"\n")
    if dna1000 < 0 and dna2000 < len(fnabody):
        fna1000.write(fnaheader+"\n")
        fna1000.write(fnabody[:dna2000]+"\n")
    if dna1000 > -1 and dna2000 > len(fnabody):
        fna1000.write(fnaheader+"\n")
        fna1000.write(fnabody[dna1000:]+"\n")
    if dna1000 < 0 and dna2000 > len(fnabody):
        fna1000.write(fnaheader+"\n")
        fna1000.write(fnabody+"\n")
    fna1000.close()

    #print(fnaheader)
    #print(fnabody[dna1:dna2])
