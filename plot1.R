##reading the data and choosing data for appropriate time period
data<-read.table("household_power_consumption2.txt",header=1,na.strings="?",sep=";")
data<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
data[,1]<-as.Date(data[,1],format="%d/%m/%Y")

##creating a variable combining date and time and  adding it to the matrix
x<-paste(data[,1],data[,2])
y<- strptime(x,"%Y-%m-%d %H:%M:%S")
df<-as.data.frame(y)
data[,10]<-df

##that's just to change the weekday names on the plots to English
Sys.setlocale("LC_TIME", "English")

##creating the plot
hist(data[,3], col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
##saving the plot to png
dev.copy(png,"plot1.png")
dev.off()