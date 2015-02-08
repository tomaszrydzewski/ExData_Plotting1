## read the file
data <- read.table("./household_power_consumption.txt",sep=";", header=TRUE)

## Create a subset of the data as we will only be using data from the dates 2007-02-01 and 2007-02-02
data_subset <- data
x <- paste(data_subset$Date, data_subset$Time)
data_subset$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
data_subset$Date <- as.Date(data_subset$Date, "%d/%m/%Y")
data_subset <- data_subset[data_subset$Date >= as.Date("2007-02-01") & data_subset$Date <= as.Date("2007-02-02") ,]


par(mfrow = c(2,2))
#first subplot
plot(data_subset$DateTime,as.numeric( data_subset$Global_active_power)/1000,type="l",main="Global Active Power",ylab="Global Active Power (kilowatts)",xlab="")
#second subplot
plot(data_subset$DateTime,as.numeric( as.character(data_subset$Voltage)),type="l",ylab="Voltage",xlab="datetime")
#third subplot
plot(data_subset$DateTime,as.numeric( data_subset$Sub_metering_1),type="l",ylab="Energy sub metering",xlab="")
lines(data_subset$DateTime,as.numeric( data_subset$Sub_metering_2),col="red")
lines(data_subset$DateTime,as.numeric( data_subset$Sub_metering_3),col="blue")
legend("topright", lwd=1,col= c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#fourth subplot
plot(data_subset$DateTime,as.numeric( data_subset$Global_reactive_power),type="l",ylab="Global_reactive_power",xlab="datetime")
dev.copy(png,'plot4.png')
dev.off()