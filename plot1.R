
# plot1.R

install.packages("sqldf")
library(sqldf)

setwd( "D:/Users/Michael/R Working Directory/Data Science Specialization" )
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file( fileUrl, destfile = "household_power_consumption.zip" )
dateDownloaded <- date()

unzip( "household_power_consumption.zip" )

data <- read.csv.sql( "household_power_consumption.txt", sql = 'select * from file where Date = "1/2/2007" or Date = "2/2/2007"', header = TRUE, colClasses = c( rep( "character", 2 ), rep( "numeric", 7 ) ), sep = ";" )

png( "plot1.png", width = 480, height = 480 )
hist( data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power" )
dev.off()

