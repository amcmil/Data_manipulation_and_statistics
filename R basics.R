#Amy Mcmillan 05/23/17
#R basics
"#" (hash) symobols are ignored by R. Used these to document your code

# "$" specifies column name in data frame. For examples to call column "BMI" in variable "met"
met$"BMI"

#square brackets are used to call specific rows or columns
[rows,columns]

#to call row 2 in variable "met" for example
met[2,]

#set working directory where you will pull files from
setwd("/path to files")

#load package
library(package name)

#read in a table
read.table("filename.txt",  header=T, check.names=F, row.names=1, sep="\t")

#write a variable to a file
write.table(variable, "filename.txt",col.names=NA,sep="\t")

#view first couple lines of a variable
head(variable)

#print dimensions of a variable
dim(variable)

#get data structure
str(variable)

#print row names of a variable
rownames(variable)

#print column names of a variable 
colnames(variable)