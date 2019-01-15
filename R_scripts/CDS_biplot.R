col2 <- as.character()
for(i in samples2){
  if(i %in% 'french'){
    col2 <- c(col2, "black")
  }
  else{
    col2 <- c(col2, "red")
  }
}
plot(d.pcx$x[,1], d.pcx$x[,2], pch= samples, xlab=PC1, ylab=PC2, cex.lab=1.5, cex=2.5,
     col=col2,  main= NULL,
     xlim=c(min(d.pcx$x[,1]) *1.2, max(d.pcx$x[,1])) *1.2,
     ylim=c(min(d.pcx$x[,2]) *1.2, max(d.pcx$x[,2])) *1.2
)
abline(h=0, lty=2, lwd=2, col=rgb(0,0,0,0.3))
abline(v=0, lty=2, lwd=2, col=rgb(0,0,0,0.3))
