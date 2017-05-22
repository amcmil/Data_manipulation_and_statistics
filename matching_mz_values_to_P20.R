#Amy McMillan 05/22/17
#to find mz values in "P20" that are also in "sig" within predefined mass error range 

p20 <- read.table("P20_siglist",  header=T, check.names=F, sep="\t")
sig <- read.table("siglist_repeated_meas_anova_for_P20_match.txt",  header=T, check.names=F, row.names=1, sep="\t")

ma=0.01

in_list<-p20
cmp <- function(sig, in_list, cutoff=ma){abs(in_list-sig) <= cutoff}
match<-which(outer(in_list[,2], sig$mz, cmp), arr.ind=TRUE)
fc <- factor(match[,2])
I<-rownames(sig)[as.numeric(levels(fc))]

filtered<-sig[rownames(sig) %in% I,]


