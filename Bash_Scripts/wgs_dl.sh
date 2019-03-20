#!/bin/bash
# run in directory for project
# list of file URLs generated by wgs_links.py, check github for more info

dllist='ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ad/ADCQ01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ad/ADDR02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ae/AEEG01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ae/AEER01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACCR02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/aa/AAVL02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ab/ABAW02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ab/ABCA03.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ab/ABED02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ab/ABEE02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ab/ABFK02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ab/ABFY02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ab/ABGC03.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ab/ABIK02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ab/ABIL02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ab/ABIY02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ab/ABJD02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ab/ABJK02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ab/ABKW02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ab/ABOU02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ab/ABQR01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ab/ABQU01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ab/ABVO01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ab/ABVQ01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ab/ABVR01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ab/ABWK02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ab/ABWL02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ab/ABWM02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ab/ABWN01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ab/ABWP01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ab/ABXH02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ab/ABXJ01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ab/ABXU01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ab/ABXV02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ab/ABYI02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ab/ABYT01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ab/ABZX01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ab/ABZY02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACBW01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACBX02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACBY02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACCF01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACCI02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACCJ01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACDB02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACDC03.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACDD01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACDG02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACDH02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACDK02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACDM02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACDN02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACDO01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACDP02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACDQ01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACEC01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACFX02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACGG01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACGI01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACGS02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACGU01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACHL01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACHN01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACIB02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACIE02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACII02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACJX03.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACKU01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACKV01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACLM01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACOI02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACPM01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACPO01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACPQ01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACPT01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACSF01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACXA01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ad/ADCW01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ad/ADGG01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ad/ADGK01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACTJ01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ae/AECU01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/aa/AAVM02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/aa/AAVN02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ab/ABIX02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ab/ABJL02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ab/ABXA01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACCL02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACFY01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ad/ADDX02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ae/AEPU01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ad/ADCP02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ae/AEQO01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ad/ADMF01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ad/ADME01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ae/AEVB01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ab/ABQC02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ae/AEVN01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ae/AEVO01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ad/ADLR01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ad/ADBG01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ae/AEXR01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ae/AEXU01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/af/AFBN01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ae/AEXS01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/af/AFBR01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ad/ADLB02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACWP01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACTV01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ad/ADLV01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ad/ADLW01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACWH01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACTN01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACTP02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACTO01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/af/AFQE01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ad/ADLS01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACWR01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACTT02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ad/ADLD01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ad/ADLJ01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACWU01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/af/AFFY01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ad/ADLL01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ad/ADLN01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/af/AFZZ01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ca/CAEM01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/af/AFZX01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACUH01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACWW01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACWE01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACWF01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACWX01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ad/ADLG01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACWJ01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ag/AGCI01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ag/AGCL01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ag/AGCN01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACTK01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ad/ADLT01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACTL01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ad/ADMC01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACTG01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ad/ADMB01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/af/AFBQ01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ak/AKCB01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ak/AKCA01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ca/CAER01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ca/CAES01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ca/CAET01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ca/CAEU01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ca/CAEV01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ca/CAHK01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ad/ADMD01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ad/ADMG01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/am/AMGT01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ca/CAGY01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ca/CAHJ01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ca/CAGZ01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ca/CAHB01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ca/CAHA01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ca/CAHD01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ca/CAHF01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ca/CAHG01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ca/CAHH01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ca/CAHI01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ca/CAEN01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ad/ADLF01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/am/AMEZ01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ca/CAEK01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ca/CAEL01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ca/CAEO01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ca/CAPF01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ca/CAPG01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ca/CAPH01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ca/CALK01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ap/APDX01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/aq/AQHX01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ag/AGEU01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/aq/AQOB01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ca/CAVS02.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ag/AGEM01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ag/AGEN01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ag/AGEO01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ag/AGEQ01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ag/AGEV01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/at/ATBZ01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/at/ATCA01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/at/ATCD01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/at/ATCE01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/at/ATCG01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/at/ATDT01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/at/ATFM01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/at/ATFN01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/at/ATFO01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ca/CAVG01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cb/CBLL01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cb/CBLK01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cb/CBLM01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/aw/AWSJ01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/aw/AWTA01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/aw/AWVF01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/aw/AWVI01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/aw/AWVJ01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/aq/AQFP01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ax/AXZF01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ax/AXNY01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cb/CBTZ01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cb/CBVB01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/az/AZJI01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/az/AZJJ01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ja/JAOZ01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ja/JALA01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ja/JALB01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cb/CBYL01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cb/CBYP01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cc/CCAS01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cc/CCDP01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/jg/JGYW01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cc/CCDM01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cc/CCEZ01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cc/CCFF01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cc/CCFE01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cc/CCFG01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cc/CCNO01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cc/CCNN01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ad/ADLA01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cc/CCXI01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cc/CCXH01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cc/CCXR01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cc/CCXS01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cc/CCYJ01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cc/CCYM01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cc/CCYK01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cd/CDGT01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cd/CDPP01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ce/CECI01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/aq/AQHV01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ag/AGES01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cv/CVPE01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cv/CVRN01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ad/ADLI01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cv/CVTY01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cw/CWHU01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ac/ACTH01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cv/CVPI01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cv/CVQX01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cv/CVTZ01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cv/CVUG01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cw/CWJM01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cw/CWJP01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ct/CTEJ01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cx/CXYU01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cx/CXYV01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cy/CYUJ01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ct/CTED01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ct/CTEA01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cs/CSSZ01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ct/CTDZ01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ct/CTRN01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cy/CYPV01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cy/CYSO01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cy/CYXK01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cy/CYUO01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/az/AZCP01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/az/AZDK01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/az/AZEP01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cy/CYUM01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cz/CZPU01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cz/CZPV01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cz/CZPW01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cz/CZPX01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cz/CZRP01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/fa/FAUL01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/fa/FAUQ01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/fa/FAUP01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/fa/FAUK01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/fa/FAVJ01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/fa/FAVK01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/fa/FAVH01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/fc/FCEY01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/fc/FCEX01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/fc/FCOY01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/fc/FCOQ01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/fc/FCOP01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/fc/FCOT01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/fc/FCOU01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/fi/FIZH01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/fi/FIZC01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/fi/FIZW01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/ct/CTEK01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/fj/FJVE01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/fj/FJVG01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/fl/FLLS01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/fk/FKYL01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/fl/FLKM01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/fl/FLKL01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/fl/FLKE01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/fl/FLKH01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/fl/FLKP01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/fl/FLSN01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/fl/FLSM01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/fl/FLSO01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/fl/FLTI01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/fm/FMJA01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/fm/FMIW01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/fm/FMIU01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/fm/FMIX01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/fm/FMIY01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/fm/FMIZ01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/fm/FMIV01.fasta.gz	ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/fn/FNRI01.fasta.gz'
for i in $dllist; do
  echo $i
  wget $i
done
