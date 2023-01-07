## Script to plot ancestry porportions determined by three-way ancestryinfer on pure parental species not used in training or filtering datasets
## See Fig. S2 of Banerjee & Powell et al. in press

# read in data
data<-read.csv(file="hybrid_index_parental_run_3way.txt",sep="\t",head=TRUE)

# separate data by parental species
bir<-head(data,12)
mal<-tail(head(data,22),10)
var<-tail(data,18)

# plot X.var ancestry proportions
densevar<-density(na.omit(var$par3),bw=0.02)
plot(densevar,col=corcol,xlim=c(-0.05,1.05),ylab="Density",cex.lab=1.4,cex.axis=1.3,main="",xlab=expression(Proportion~italic(X.~variatus)))
polygon(densevar, col=corcol, border=NA)

# plot X.bir ancestry proportions
densebir<-density(na.omit(bir$par1),bw=0.02)
plot(densebir,col=bircol,xlim=c(-0.05,1.05),ylab="Density",cex.lab=1.4,cex.axis=1.3,main="",xlab=expression(Proportion~italic(X.~birchmanni)))
polygon(densebir, col=bircol, border=NA)

# plot X.mal ancestry proportions
densemal<-density(na.omit(mal$par2),bw=0.02)
plot(densemal,col=malcol,xlim=c(-0.05,1.05),ylab="Density",cex.lab=1.4,cex.axis=1.3,main="",xlab=expression(Proportion~italic(X.~malinche)))
polygon(densemal, col=malcol, border=NA)