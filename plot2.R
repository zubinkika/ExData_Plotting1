# This R program plots  Global Active power usage across time series.
library(sqldf)
plot2<- function(){
	# Read the data
	filtermydata <- read.csv.sql('household_power_consumption.txt', sql = "select * from file where Date in ('1/2/2007', '2/2/2007')", sep =";" ,   header = T,   stringsAsFactors = F)
	filtermydata$Date <- as.Date( filtermydata$Date,  , format="%d/%m/%Y") 
	filtermydata$datetime =  strptime(paste(filtermydata$Date, " " , filtermydata$Time), "%Y-%m-%d %H:%M:%S")
	filtermydata$Global_active_power = as.numeric(as.character(filtermydata$Global_active_power))
	# Plot the Series to PNG file
	plot(filtermydata$datetime, filtermydata$Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)")
	dev.copy(png, file = "plot2.png") 
	dev.off()
	closeAllConnections()		
}

