plot2<- function(){
	mydata = read.csv("household_power_consumption.txt", , header = TRUE, sep = ";")
	mydata$Date <- as.Date( mydata$Date,  , format="%d/%m/%Y") 
	fromdate <- as.Date("2007-02-01")
	todate <- as.Date("2007-02-02")
	#strptime("10/1/2007 17:24:00","%d/%m/%Y %H:%M:%S")
	filtermydata <- mydata[mydata$Date == fromdate  | mydata$Date == todate,]
	filtermydata$datetime =  strptime(paste(filtermydata$Date, " " , filtermydata$Time), "%Y-%m-%d %H:%M:%S")
	filtermydata$Global_active_power = as.numeric(filtermydata$Global_active_power)/1000
	 plot(filtermydata$datetime, filtermydata$Global_active_power*2,type="l",xlab="",ylab="Global Active Power(kilowatts)")
	 dev.copy(png, file = "plot2.png") 
	 dev.off()
		
}

