source("data_init.R")



plot4 <- function(){
    data <- data_init()
    
    png(filename = "plot4.png", width = 480, height = 480, units  = "px")
    
    par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
    
    
    plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
    
    plot(data$DateTime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
    
    plot(data$DateTime, data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
    lines(data$DateTime, data$Sub_metering_1, type = "l")
    lines(data$DateTime, data$Sub_metering_2, type = "l", col = "red" )
    lines(data$DateTime, data$Sub_metering_3, type = "l", col = "blue" )
    legend("topright",lty = 1, lwd =1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    plot(data$DateTime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
    
    
    dev.off()
}

plot4()