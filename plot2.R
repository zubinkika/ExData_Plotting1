# This R program plots  Global Active power usage across time series.
plot2<- function(){
	# Read the data
	mydata = read.csv("household_power_consumption.txt", , header = TRUE, sep = ";")
	# Filter the records
	mydata$Date <- as.Date( mydata$Date,  , format="%d/%m/%Y") 
	fromdate <- as.Date("2007-02-01")
	todate <- as.Date("2007-02-02")
	filtermydata <- mydata[mydata$Date == fromdate  | mydata$Date == todate,]
	filtermydata$datetime =  strptime(paste(filtermydata$Date, " " , filtermydata$Time), "%Y-%m-%d %H:%M:%S")
	filtermydata$Global_active_power = as.numeric(as.character(filtermydata$Global_active_power))
	# Plot the Series to PNG file
	plot(filtermydata$datetime, filtermydata$Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)")
	dev.copy(png, file = "plot2.png") 
	dev.off()
		
}

