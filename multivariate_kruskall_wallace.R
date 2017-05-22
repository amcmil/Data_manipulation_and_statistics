#Amy McMillan 05/22/17
#to identify metabolites which differ significantly between more than two groups
#kruskall wallace test (equivalent to non-parametric ANOVA) 

out<-matrix(data=NA, nrow =1, ncol=ncol(met_t))
colnames(out)<-colnames(met_t)

for(i in 1:ncol(met_t)){
t<-kruskal.test(met_t[,i] ~ mdata$"group")
out[,i]<-t$p.value 
}

#fdr correction on pvalues to account for multiple testing

td<-as.data.frame(out)
fdr=p.adjust(td,method="fdr")
pval<-t(rbind(out,fdr))

#write table
write.table(pval,"kruskall_stats_test.txt",sep="\t",col.names=NA)

#Dunn's posthoc test to identify significant pairs for individual metabolites

library(dunn.test)
dunn.test (met[,13], g=mdata$"group", method="BH", kw=TRUE, label=TRUE,wrap=FALSE, table=TRUE, list=TRUE, rmc=TRUE, alpha=0.05)
