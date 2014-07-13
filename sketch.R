# Course project 1 - Explanatory Data Analysis 


data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric","numeric"))

data_new <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

data_new$DateTime <- strptime(paste(data_new$Date, data_new$Time), "%d/%m/%Y %H:%M:%S")

# data_new$DateTime <- as.Date(data_new$DateTime)

# head(data_new)

# class(data_new$DateTime)


# Plot 1 


hist(data_new$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png")
dev.off()

#  Plot 2 

plot(data_new$DateTime, data_new$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")


# Plot  3 
plot(data_new$DateTime, data_new$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(data_new$DateTime, data_new$Sub_metering_1, type = "l")
lines(data_new$DateTime, data_new$Sub_metering_2, type = "l", col = "red" )
lines(data_new$DateTime, data_new$Sub_metering_3, type = "l", col = "blue" )
legend("topright",lty = 1, lwd =1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


# Plot  4 


par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))


plot(data_new$DateTime, data_new$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(data_new$DateTime, data_new$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")


plot(data_new$DateTime, data_new$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(data_new$DateTime, data_new$Sub_metering_1, type = "l")
lines(data_new$DateTime, data_new$Sub_metering_2, type = "l", col = "red" )
lines(data_new$DateTime, data_new$Sub_metering_3, type = "l", col = "blue" )
legend("topright", lty = 1, lwd =1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

plot(data_new$DateTime, data_new$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

