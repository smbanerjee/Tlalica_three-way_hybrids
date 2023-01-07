## Script to plot the proportion of the genome inferred to be derived from X. variatus in individuals phenotypically determined to be X. variatus at the Tlalica site upon collection.
## See Fig. S4 in Banerjee & Powell et al. in press

data<-read.csv(file="xvar_caps_only_admixprop.txt",sep="\t",head=TRUE)

densevar<-density(data$propvar,bw=0.02)
plot(densevar,col=corcol,xlim=c(0,1.05),ylab="Density",cex.lab=1.4,cex.axis=1.3,main="",xlab=expression(Proportion~italic(X.~variatus)))
polygon(densevar, col=corcol, border=NA)