plot3<- function(){
	mydata = read.csv("household_power_consumption.txt", , header = TRUE, sep = ";")
	mydata$Date <- as.Date( mydata$Date,  , format="%d/%m/%Y") 
	fromdate <- as.Date("2007-02-01")
	todate <- as.Date("2007-02-02")
	#strptime("10/1/2007 17:24:00","%d/%m/%Y %H:%M:%S")
	filtermydata <- mydata[mydata$Date == fromdate  | mydata$Date == todate,]
	filtermydata$datetime =  strptime(paste(filtermydata$Date, " " , filtermydata$Time), "%Y-%m-%d %H:%M:%S")
    filtermydata$Sub_metering_1 <-as.numeric(as.character(filtermydata$Sub_metering_1))
	filtermydata$Sub_metering_2 <-as.numeric(as.character(filtermydata$Sub_metering_2))
	filtermydata$Sub_metering_3 <-as.numeric(as.character(filtermydata$Sub_metering_3))
	plot(filtermydata$datetime, as.numeric(filtermydata$Sub_metering_1),type="l" ,col="black",
	 xlab="" , ylab="Energy sub metering")
	lines(filtermydata$datetime, as.numeric(filtermydata$Sub_metering_2),type="l" ,col="red")
	lines(filtermydata$datetime, as.numeric(filtermydata$Sub_metering_3),type="l" ,col="blue")
	legend("topright",c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))
	dev.copy(png, file = "plot3.png") 
	dev.off()
		
}

