#for ttest for every metabolite in column of matrix met_t
#replace t.test with wilcox.test for nonparametric test

out<-matrix(data=NA, nrow =1, ncol=ncol(met_t))
colnames(out)<-colnames(met_t)

for(i in 1:ncol(met_t)){
t<-wilcox.test(met_t[,i] ~ mdata$"group",exact=FALSE)
out[,i]<-t$p.value 
}

#fdr correction on pvalues to account for multiple testing
td<-as.data.frame(out)
fdr=p.adjust(td,method="fdr")
pval<-t(rbind(out,fdr))

#calculate all fold change in loop 
out_Cond1<-matrix(data=NA, nrow =1, ncol=ncol(met_t))
colnames(out_Cond1)<-colnames(met_t)

for(i in 1:ncol(met_t)){
fc<-(mean(met_t[,i] [which (mdata$"group"=="Cond1" )]))-((mean(met_t[,i] [which (mdata$"group"=="Cond2" )])))
out_Cond1[,i]<-fc 
}

out_Cond2<-matrix(data=NA, nrow =1, ncol=ncol(met_t))
colnames(out_Cond2)<-colnames(met_t)

for(i in 1:ncol(met_t)){
fc<-(mean(met_t[,i] [which (mdata$"group"=="Cond2" )]))-((mean(met_t[,i] [which (mdata$"group"=="Cond1" )])))
out_Cond2[,i]<-fc 
}

out_Cond1_t<-t(out_Cond1)
out_Cond2_t<-t(out_Cond2)

#Contatinate
sig<-cbind(out_Cond1_t,out_Cond2_t,pval)

#write table
write.table(sig,"pval_wilxoc_fc.txt",sep="\t",col.names=NA)