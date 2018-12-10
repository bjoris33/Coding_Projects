# developed to create a conds vector for inputting into aldex when the data isn't separating according to the metadata. Not very generalizable.

conds <- c()
for(i in 1:nrow(d.pcx$x)) {
  if(d.pcx$x[i,1] > 1) {
    conds <- c(conds, 'pos')
  }
  else {
    conds <- c(conds, 'neg')
  }
}
