## Plot 5
## How have emissions from motor vehicle sources changed 
## from 1999–2008 in Baltimore City?

## reading data and R packages
data<-readRDS("summarySCC_PM25.rds")
classification<-readRDS("Source_Classification_Code.rds")
library(plyr)
library(ggplot2)

## preparing data
vehicle<-unique(grep("vehicle", classification$EI.Sector, 
                     ignore.case=TRUE, value =TRUE))
z<-classification[classification$EI.Sector %like% "Vehicle",]
subset.Baltimore<-data[data$fips == "24510",]
subset.plot5<-subset.Baltimore[subset.Baltimore$SCC %in% z$SCC,]
data.plot5<-ddply(subset.plot5,.(year), 
                  summarize, sum=sum(Emissions))

## plotting
png(file="plot5.png")
plot(data.plot5$year,data.plot5$sum,
     main="PM2.5 emission from motor vehicle sources \nin Baltimore City 1999-2008",
     xlab="year",ylab="PM2.5 emission",
     tick=0,labels=F,type="n")
axis(1, at = data.plot5$year)
axis(2)
points(data.plot5$year,data.plot5$sum,pch=19)
lines(data.plot5$year,data.plot5$sum)
dev.off()