# This R-code loads the data from a specified URL and performs a few 
# modifications to the data.frame


filedownload <- function(URL, fname){
    if(!file.exists(fname)){
        download.file(URL, destfile = fname, method = "curl")
    }
    fname    
}


data_init <- function(){
    cachefile <- "plotting_data.csv"
    if(file.exists(cachefile)) {
            data <- read.csv(cachefile)
            data$DateTime <- strptime(data$DateTime, "%Y-%m-%d %H:%M:%S")
    }
    
    else {
        fname <- filedownload("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip")
        # Unzip file
        temp <- unz(fname, "household_power_consumption.txt")
        data <- read.table(temp, header = TRUE, sep = ";", na.strings = "?", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric","numeric"))
    
        # Select a subset of the data
        data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007") 
        # Add a new variable
        data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
        
        write.csv(data, cachefile)
    }
    data
}