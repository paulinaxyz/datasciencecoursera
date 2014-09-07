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
plot(data[,10],data[,7],type="n",main=NULL,xlab="",ylab="Energy sub metering")
lines(data[,10],data[,7])
lines(data[,10],data[,8],col="red")
lines(data[,10],data[,9],col="blue")
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1,col = c("black","red","blue"), y.intersp=0.5)
##saving the plot to png
dev.copy(png,"plot3.png",pointsize=10)
dev.off()