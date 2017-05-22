#Amy McMillan 05/22/17
#basic commands for subsetting data in R

#to keep samples in metadata table with variable = x or y. x and y are numbers in your metadata table. "|" denotes "OR"
keep<-mdata[mdata$"variable"==x | mdata$"variable"==y,]

#to keep samples in metadata table with variable1 = x and variable2 = y. "&" denotes "AND"
keep<-mdata[mdata$"variable1"==x | mdata$"variable1"==y,]

#to keep samples in metadata table with variable between numbers x and y.
keep<-mdata[mdata$"variable1"<x & mdata$"variable1">y,]

#to make new metabolite table with only samples in "keep"
met_new<-met_t[rownames(keep),]
 
#using not operator (!)
met_rem<-met[!(rownames(met) %in% rownames(ids)),]
