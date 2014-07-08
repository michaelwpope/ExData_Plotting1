
# plot3.R

install.packages("sqldf")
library(sqldf)

setwd( "D:/Users/Michael/R Working Directory/Data Science Specialization" )
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file( fileUrl, destfile = "household_power_consumption.zip" )
dateDownloaded <- date()

unzip( "household_power_consumption.zip" )

data <- read.csv.sql( "household_power_consumption.txt", sql = 'select * from file where Date = "1/2/2007" or Date = "2/2/2007"', header = TRUE, colClasses = c( rep( "character", 2 ), rep( "numeric", 7 ) ), sep = ";" )
data$datetime <- strptime( paste( data$Date, data$Time ), format = "%d/%m/%Y %H:%M:%S" )

png( "plot3.png", width = 480, height = 480 )
with( data, plot( datetime, Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy sub metering" ) )
with( data, lines( datetime, Sub_metering_2, col = "red" ) )
with( data, lines( datetime, Sub_metering_3, col = "blue" ) )
legend( "topright", lty = 1, col = c( "black", "red", "blue" ), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ) )
dev.off()

