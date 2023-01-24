## Script to plot the error rates for local ancestry inference from simulations using incorect priors for time of initial admixture and incorrect intial admixture proportions.
## See Fig. S8 in Banerjee & Powell et al. in press

## Fig S8A

data<-read.csv(file="~/Swordtail Dropbox/Schumer_lab_resources/Project_files/CAPS_3way_hybrids/Data/results_summary_admixture_SELAM_sim_bed_list_prior_admixtime_misspec",sep="\t",head=FALSE)
indiv<-unique(data$V1)
accuracy<-{}
for(x in 1:length(indiv)){
focal<-subset(data,data$V1==indiv[x])
acc<-sum(focal$V12)/(sum(focal$V12)+sum(focal$V11))
accuracy<-c(accuracy,acc)
}
dense<-density(accuracy)
plot(dense,col="cornflowerblue",xlim=c(0,0.3),ylab="Density",cex.lab=1.3,cex.axis=1.2,main="",xlab="Error rate")
polygon(dense, col="cornflowerblue", border=NA)
abline(v=median(accuracy),lty=2,lwd=2,col="red")

## Fig S8B

data<-read.csv(file="~/Swordtail Dropbox/Schumer_lab_resources/Project_files/CAPS_3way_hybrids/Data/results_summary_admixture_SELAM_sim_bed_list_misspec_admix",sep="\t",head=FALSE)
indiv<-unique(data$V1)
accuracy<-{}
for(x in 1:length(indiv)){
focal<-subset(data,data$V1==indiv[x])
acc<-sum(focal$V12)/(sum(focal$V12)+sum(focal$V11))
accuracy<-c(accuracy,acc)
}
dense<-density(accuracy)
plot(dense,col="cornflowerblue",xlim=c(0,0.3),ylab="Density",cex.lab=1.3,cex.axis=1.2,main="",xlab="Error rate")
polygon(dense, col="cornflowerblue", border=NA)
abline(v=median(accuracy),lty=2,lwd=2,col="red")