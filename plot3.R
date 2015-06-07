library(sqldf)
# This R program plots values of Energy sub metering across a given time series.
plot3<- function(){
	# Read the data
	filtermydata <- read.csv.sql('household_power_consumption.txt', sql = "select * from file where Date in ('1/2/2007', '2/2/2007')", sep =";" ,   header = T,   stringsAsFactors = F)
	filtermydata$Date <- as.Date( filtermydata$Date,  , format="%d/%m/%Y") 
	filtermydata$datetime =  strptime(paste(filtermydata$Date, " " , filtermydata$Time), "%Y-%m-%d %H:%M:%S")
    filtermydata$Sub_metering_1 <-as.numeric(as.character(filtermydata$Sub_metering_1))
	filtermydata$Sub_metering_2 <-as.numeric(as.character(filtermydata$Sub_metering_2))
	filtermydata$Sub_metering_3 <-as.numeric(as.character(filtermydata$Sub_metering_3))
	# Plot the Time series to PNG file
	plot(filtermydata$datetime, filtermydata$Sub_metering_1,type="l" ,col="black",
	 xlab="" , ylab="Energy sub metering")
	lines(filtermydata$datetime, filtermydata$Sub_metering_2,type="l" ,col="red")
	lines(filtermydata$datetime, filtermydata$Sub_metering_3,type="l" ,col="blue")
	legend("topright",c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))
	dev.copy(png, file = "plot3.png") 
	dev.off()
	closeAllConnections()	
		
}

