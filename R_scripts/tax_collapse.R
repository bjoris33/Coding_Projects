# problem: ASV tables created by DADA2 say that every bacteria in a given sample is completely unique compared to the other samples (i.e. zeros in every sample but one)
# solution: get unique taxonomic assignments and collapse into single row
# input: count table with column with taxonomic information named 'taxonomy'
# generalizable
seqtab <- read.table('seqtab.txt')
collapsetab <- data.frame()
for (uniques in unique(seqtab$taxonomy)) {
  new <- data.frame(seqtab[which(seqtab$taxonomy == uniques),])
  sumtab <- data.frame()
  sumcol <- as.numeric()
  for(i in 1:ncol(new)-1){
    sumcol <- c(sumcol, sum(as.numeric(new[,i])))
  }
  sumtab <- t(data.frame(sumcol))
  sumtab <- data.frame(sumtab, uniques)
  collapsetab <- rbind(collapsetab, sumtab)
}
collapsetab <- collapsetab[,-1]
colnames(collapsetab) <- colnames(seqtab)
write.table(collapsetab, "collapsetab.txt", sep = "\t")
