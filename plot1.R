## read the file
data <- read.table("./household_power_consumption.txt",sep=";", header=TRUE)

## Create a subset of the data as we will only be using data from the dates 2007-02-01 and 2007-02-02
data_subset <- data
data_subset$Date <- as.Date(data_subset$Date, "%d/%m/%Y")
data_subset <- data_subset[data_subset$Date >= as.Date("2007-02-01") & data_subset$Date <= as.Date("2007-02-02") ,]

## Create a histogram 
hist(as.numeric(data_subset$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.copy(png,'plot1.png')
dev.off()