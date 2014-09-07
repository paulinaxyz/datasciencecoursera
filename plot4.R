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

par(mfrow=c(2,2))

##creating the plot
plot(data[,10],data[,3],type="n",main=NULL,xlab="",ylab="Global Active Power")
lines(data[,10],data[,3])

plot(data[,10],data[,5],type="n",main=NULL,xlab="datetime",ylab="Voltage")
lines(data[,10],data[,5])

plot(data[,10],data[,7],type="n",main=NULL,xlab="",ylab="Energy sub metering")
lines(data[,10],data[,7])
lines(data[,10],data[,8],col="red")
lines(data[,10],data[,9],col="blue")
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1,col = c("black","red","blue"),bty="n",y.intersp=0.5,cex=0.7)

plot(data[,10],data[,4],type="n",main=NULL,xlab="datetime",ylab="Global_reactive_power")
lines(data[,10],data[,4])
##saving the plot to png
dev.copy(png,"plot4.png")
dev.off()