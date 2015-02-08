## read the file
data <- read.table("./household_power_consumption.txt",sep=";", header=TRUE)

## Create a subset of the data as we will only be using data from the dates 2007-02-01 and 2007-02-02
data_subset <- data
x <- paste(data_subset$Date, data_subset$Time)
data_subset$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
data_subset$Date <- as.Date(data_subset$Date, "%d/%m/%Y")
data_subset <- data_subset[data_subset$Date >= as.Date("2007-02-01") & data_subset$Date <= as.Date("2007-02-02") ,]

## Create a histogram 
par(mfrow = c(1,1))
plot(data_subset$DateTime,as.numeric( data_subset$Global_active_power)/1000,type="l",main="Global Active Power",ylab="Global Active Power (kilowatts)",xlab="")
dev.copy(png,'plot2.png')
dev.off()