## Plot 6
## Compare emissions from motor vehicle sources in Baltimore City 
## with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037")
## Which city has seen greater changes over time in motor vehicle emissions?

## reading data and R packages
data<-readRDS("summarySCC_PM25.rds")
classification<-readRDS("Source_Classification_Code.rds")
library(plyr)
library(ggplot2)

## preparing data
subset.Balt.LA <- data[(data$fips == "24510" | data$fips == "06037"),]
subset.plot6<-subset.Balt.LA[subset.Balt.LA$SCC %in% z$SCC,]
data.plot6<- ddply(subset.plot6,.(fips, year), 
                   summarize, sum=sum(Emissions))
data.plot6$fips<-factor(x=data.plot6$fips, 
                        labels=c("LA","Baltimore"))


## plotting
png(file="plot6.png")
xyplot(data.plot6$sum ~ data.plot6$year | data.plot6$fips,
       type="b",
       scales=list(y=list(relation="sliced"),x=list(at=data.plot6$year)),
       main="PM2.5 emission from motor vehicle sources \nin LA 1999-2008",
       xlab="year",
       ylab="PM2.5 emission (in thousands)")
dev.off()
