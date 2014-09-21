## reading data and R packages
data<-readRDS("summarySCC_PM25.rds")
classification<-readRDS("Source_Classification_Code.rds")
library(plyr)
library(ggplot2)


## Plot 1
## plot showing the total PM2.5 emission from all sources 
## for each of the years 1999, 2002, 2005, and 2008

## preparing data
data.plot1<- ddply(data,.(year), summarize, 
                   sum=sum(Emissions))
data.plot1$emissions<-data.plot1$sum/1000

## plotting
png(file="plot1.png")
plot(data.plot1$year,data.plot1$emissions,
     main="PM2.5 emissions across the United States 1999-2008",
     xlab="year",
     ylab="PM2.5 emission (in thousands)",
     tick=0,labels=F,type="n")
axis(1, at = data.plot1$year)
axis(2)
points(data.plot1$year,data.plot1$emissions,pch=19)
lines(data.plot1$year,data.plot1$emissions)
dev.off()