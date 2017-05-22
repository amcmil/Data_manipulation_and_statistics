#Amy McMillan 05/22/17
#for correlations between a single variable and a multivariate dataset

#read in metabolite table
met <- read.table("peaktable.txt",  header=T, check.names=F, row.names=1, sep="\t")

#perform correlation between variable of interest (ie disease severity) and all metabolites
out<-matrix(data=NA, ncol =2, nrow=ncol(met_t))
rownames(out)<-colnames(met_t)

for(i in 1:ncol(met_t)){
cor<-cor.test(met_t[,i],met_t$"112",method=c("spearman"),exact=FALSE)
out[i,]<-cbind(cor$p.value,cor$estimate)
}

td<-as.data.frame(out)
fdr=as.data.frame(p.adjust(td[,1],method="fdr"))
pval<-cbind(out,fdr)

#write to table
write.table(pval,"Spearmans_cor_results.txt",sep="\t",col.names=NA)
