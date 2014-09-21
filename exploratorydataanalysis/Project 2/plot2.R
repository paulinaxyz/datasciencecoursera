## Plot 2
## Have total emissions from PM2.5 decreased 
## in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008?

## reading data and R packages
data<-readRDS("summarySCC_PM25.rds")
classification<-readRDS("Source_Classification_Code.rds")
library(plyr)
library(ggplot2)


## preparing data
subset.Baltimore<-data[data$fips == "24510",]
data.plot2<- ddply(subset.Baltimore,.(year), 
                   summarize, sum=sum(Emissions))

## plotting
png(file="plot2.png")
plot(data.plot2$year,data.plot2$sum,
     main="PM2.5 emissions in Baltimore City 1999-2008",
     xlab="year",
     ylab="PM2.5 emission",
     tick=0,labels=F,type="n")
axis(1, at = data.plot2$year)
axis(2)
points(data.plot2$year,data.plot2$sum,pch=19)
lines(data.plot2$year,data.plot2$sum)
dev.off()