library(sqldf)
# This R program plots a Histogram of Global Active power vs Frequency
plot1<- function(){
	# Read the data
	filtermydata <- read.csv.sql('household_power_consumption.txt', sql = "select * from file where Date in ('1/2/2007', '2/2/2007')", sep =";" ,   header = T,   stringsAsFactors = F)
	filtermydata$Date <- as.Date( filtermydata$Date,  , format="%d/%m/%Y") 
	filtermydata$Global_active_power = as.numeric(as.character(filtermydata$Global_active_power))
    # Plot the Histogram to PNG file
	hist(filtermydata$Global_active_power,col="red",main="Global Active Power",
	xlab="Global Active Power(kilowatts)" , ylab="Frequency")
	dev.copy(png, file = "plot1.png") 
	dev.off()
	closeAllConnections()
}

