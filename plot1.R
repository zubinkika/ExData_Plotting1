# This R program plots a Histogram of Global Active power vs Frequency
plot1<- function(){
	# Read the data
	mydata = read.csv("household_power_consumption.txt", , header = TRUE, sep = ";")
	# Filter the records
	mydata$Date <- as.Date( mydata$Date,  , format="%d/%m/%Y") 
	fromdate <- as.Date("2007-02-01")
	todate <- as.Date("2007-02-02")
	filtermydata <- mydata[mydata$Date == fromdate  | mydata$Date == todate,]
	filtermydata$Global_active_power = as.numeric(as.character(filtermydata$Global_active_power))
    # Plot the Histogram to PNG file
	hist(filtermydata$Global_active_power,col="red",main="Global Active Power",
	xlab="Global Active Power(kilowatts)" , ylab="Frequency")
	dev.copy(png, file = "plot1.png") 
	dev.off()

}

