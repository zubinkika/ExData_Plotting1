plot1<- function(){
	mydata = read.csv("household_power_consumption.txt", , header = TRUE, sep = ";")
	mydata$Date <- as.Date( mydata$Date,  , format="%d/%m/%Y") 
	fromdate <- as.Date("2007-02-01")
	todate <- as.Date("2007-02-02")
	#strptime("10/1/2007 17:24:00","%d/%m/%Y %H:%M:%S")
	filtermydata <- mydata[mydata$Date == fromdate  | mydata$Date == todate,]
	 filtermydata$Global_active_power = as.numeric(filtermydata$Global_active_power)/1000
	 hist(filtermydata$Global_active_power*2,col="red",main="Global Active Power",
	 xlab="Global Active Power(kilowatts)" , ylab="Frequency")
	 dev.copy(png, file = "plot1.png") 
	 dev.off()

}

