##dplyr package for data management
#Week 4

#Install the package
library(dplyr)

#Upload our dataset Tips

dt=read.csv("tips.csv")

dim(dt)
names(dt)
table(dt$sex)

#Filter to filter rows

fcust=filter(dt, sex=="Female")   #in this subdataset only females are included
head(fcust)
dim(fcust)

mcust=filter(dt, sex!="Female")
head(mcust)  
  
table(dt$day)
unique(dt$day)
  
NoFriday=filter(dt, day !="Friday")
head(NoFriday)  

#Female customers who smoke
head(dt)

fsmokcust=filter(dt, sex=="Female", smoker=="Yes")
head(fsmokcust)  
dim(fsmokcust)

#Logical operators &, |

weekendCust=filter(dt, day=="Sun" | day =="Sat")
head(weekendCust)

testcust=filter(dt, day=="Sun" & day =="Sat")
dim(testcust)


##   %in%
unique(dt$size)

smallSize=filter(dt, size %in% c(1,2,3))
head(smallSize)

#  >, <

largeSize=filter(dt, size>=3)
head(largeSize)

#Arrange 

View(dt)
dt1=arrange(dt, -desc(tip))
View(dt1)

dt2=arrange(dt, day)
View(dt2)

##Create subdatasets using columns
names(dt)

dt0=select(dt, -c(total_bill, tip, size))
View(dt0)
#everything

dt3=select(dt, everything(), -c(X))
View(dt3)

#rename
dt4=rename(dt, bill=total_bill)
View(dt4)

##Mutate
#totalCost=total_bill+tip

dtNew=mutate(dt, totalCost=total_bill+tip)
View(dtNew)
dtNew=select(dtNew, everything(), -c(X))

#one pays 20% tax on tip 

dtTax=mutate(dt, tax_tip=0.2*tip)
View(dtTax)

###summarize

summarise(dt, mean(total_bill), sd(total_bill), min(total_bill), max(total_bill))

Gender=group_by(dt, sex)
Gender

summarise(Gender, mean(total_bill), mean(tip))

#sample_n  is used to draw random samples 
sample1=sample_n(dt, 100)
View(sample1)




