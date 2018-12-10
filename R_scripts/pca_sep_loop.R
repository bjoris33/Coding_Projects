# developed to create a conds vector for inputting into aldex when the data isn't separating according to the metadata. Not very generalizable.
# conds is the conditions vector for ALDEx2 and PCA
# d.pcx is the principal components analysis table generated from CLR data with the function prcomp()
# for the scenario that I developed this script for, the data separated around 1 on PC1
conds <- c()
for(i in 1:nrow(d.pcx$x)) {
  if(d.pcx$x[i,1] > 1) {
    conds <- c(conds, 'pos')
  }
  else {
    conds <- c(conds, 'neg')
  }
}
