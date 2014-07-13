source("data_init.R")

plot3 <- function(){
    data <- data_init()
    
    png(filename = "plot3.png", width = 480, height = 480, units  = "px")
    
    plot(data$DateTime, data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
    lines(data$DateTime, data$Sub_metering_1, type = "l")
    lines(data$DateTime, data$Sub_metering_2, type = "l", col = "red" )
    lines(data$DateTime, data$Sub_metering_3, type = "l", col = "blue" )
    legend("topright",lty = 1, lwd =1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    dev.off()
}

plot3()