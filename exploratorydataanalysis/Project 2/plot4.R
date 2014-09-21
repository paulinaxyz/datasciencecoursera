## Plot 4
## Across the United States, how have emissions 
## from coal combustion-related sources changed from 1999–2008?  

## reading data and R packages
data<-readRDS("summarySCC_PM25.rds")
classification<-readRDS("Source_Classification_Code.rds")
library(plyr)
library(ggplot2)

## preparing data
coal<-unique(grep("coal", classification$EI.Sector, 
                  ignore.case=TRUE, value =TRUE))
x<-classification[classification$EI.Sector %like% "Coal",]
subset.plot4<-data[data$SCC %in% x$SCC,]
data.plot4<-ddply(subset.plot4,.(year), 
                  summarize, sum=sum(Emissions))
data.plot4$emissions<-data.plot4$sum/1000

## plotting
png(file="plot4.png")
plot(data.plot4$year,data.plot4$emissions,
     main="PM2.5 emission from coal combustion sources \nacross the United States 1999-2008",
     xlab="year",ylab="PM2.5 emission from coal combustion sources",
     tick=0,labels=F,type="n")
axis(1, at = data.plot4$year)
axis(2)
points(data.plot4$year,data.plot4$emissions,pch=19)
lines(data.plot4$year,data.plot4$emissions)
dev.off()