## Script to plot results of applying ancestryinfer in the three source population mode to X. birchmanni x X. malinche hybrid populations that are not sympatric with X. variatus.
## See Fig. S3 of Banerjee & Powell et al. in press.

# read in data
data<-read.csv(file="hybrid_index_TLMC_TOTO_3way.txt",sep="\t",head=TRUE)

# separate out TLMC individuals
tlmc<-head(data,25)

# plot TLMC X.var
densevar<-density(tlmc$par3,bw=0.01)
plot(densevar,col=corcol,xlim=c(-0.05,1.05),ylab="Density",cex.lab=1.4,cex.axis=1.3,main="",xlab=expression(Proportion~italic(X.~variatus)))
polygon(densevar, col=corcol, border=NA)

# plot TLMC X.bir
densemalbir<-density(tlmc$par2,bw=0.04)
plot(densemalbir,col=malcol,xlim=c(-0.05,1.05),ylab="Density",cex.lab=1.4,cex.axis=1.3,main="",xlab=expression(Proportion~italic(X.~malinche)))
polygon(densemalbir, col=malcol, border=NA)

# plot TLMC X.mal
densemalbir<-density(tlmc$par1,bw=0.04)
plot(densemalbir,col=bircol,xlim=c(-0.05,1.05),ylab="Density",cex.lab=1.4,cex.axis=1.3,main="",xlab=expression(Proportion~italic(X.~birchmanni)))
polygon(densemalbir, col=bircol, border=NA)

# separate out TOTO individuals
toto<-tail(data,30)

# plot TOTO X.var
densevar<-density(toto$par3,bw=0.01)
plot(densevar,col=corcol,xlim=c(-0.05,1.05),ylab="Density",cex.lab=1.4,cex.axis=1.3,main="",xlab=expression(Proportion~italic(X.~variatus)))
polygon(densevar, col=corcol, border=NA)

# plot TOTO X.bir
densemalbir<-density(toto$par2,bw=0.02)
plot(densemalbir,col=malcol,xlim=c(-0.05,1.05),ylab="Density",cex.lab=1.4,cex.axis=1.3,main="",xlab=expression(Proportion~italic(X.~malinche)))
polygon(densemalbir, col=malcol, border=NA)

# plot TOTO X.mal
densemalbir<-density(toto$par1,bw=0.02)
plot(densemalbir,col=bircol,xlim=c(-0.05,1.05),ylab="Density",cex.lab=1.4,cex.axis=1.3,main="",xlab=expression(Proportion~italic(X.~birchmanni)))
polygon(densemalbir, col=bircol, border=NA)