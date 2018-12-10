seqtab <- read.table('seqtab.txt')
collapsetab <- data.frame()
for (uniques in unique(seqtab$taxonomy)) {
  #new <- data.frame(seqtab[grep(uniques, seqtab$taxonomy),])
  new <- data.frame(seqtab[which(seqtab$taxonomy == uniques),])
  sumtab <- data.frame()
  sumcol <- as.numeric()
  for(i in 1:ncol(new)-1){
    sumcol <- c(sumcol, sum(as.numeric(new[,i])))
  }
  sumtab <- t(data.frame(sumcol))
  sumtab <- data.frame(sumtab, uniques)
  #collapsetab <- rbind(collapsetab, new)
  collapsetab <- rbind(collapsetab, sumtab)
}
collapsetab <- collapsetab[,-1]
colnames(collapsetab) <- colnames(seqtab)
write.table(collapsetab, "collapsetab.txt", sep = "\t")
