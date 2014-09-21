## Plot 3
## which of four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
## Which have seen increases in emissions from 1999–2008?

## reading data and R packages
data<-readRDS("summarySCC_PM25.rds")
classification<-readRDS("Source_Classification_Code.rds")
library(plyr)
library(ggplot2)

## preparing data
subset.Baltimore<-data[data$fips == "24510",]
data.plot3<- ddply(subset.Baltimore,.(type, year), 
                   summarize, sum=sum(Emissions))

## plotting
png(file="plot3.png")
g<-qplot(year,sum,data=data.plot3,
         main=" PM2.5 emissions from various sources in Baltimore City 1999-2008",
         xlab="year",ylab="PM2.5 emission")
g + facet_wrap(~ type, ncol=2) + geom_smooth() 
dev.off()
