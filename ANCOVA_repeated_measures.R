#Amy McMillan 05/22/17
#repeated measures ANCOVA adjusted for potential confounders

visit<-as.factor(mdata$"Visit")
subject<-as.factor(mdata$"Patient_ID")
treatment<-as.factor(mdata$"Treatment_label")

#treatment effect
out<-matrix(data=NA, nrow =1, ncol=ncol(met_t))
colnames(out)<-colnames(met_t)

for(i in 1:ncol(met_t)){
aov.out<-aov(met_t[,i]~ visit*treatment + Error(subject)+ mdata$"Smoking" + mdata$"AGE"+ mdata$"Gender"+ mdata$"Ethnicity"+mdata$"BMI",met_t)
sum<-summary(aov.out)
d<-as.data.frame(unlist(sum[1]$`Error: subject`))
pval<-d[29,]
out[,i]<-pval
}

td<-as.data.frame(out)
fdr=p.adjust(td,method="BH")
pval<-t(rbind(out,fdr))

#write to table
write.table(pval,"pval_repeated_measures_ANOVA_treatment_effect.txt",sep="\t",col.names=NA)
