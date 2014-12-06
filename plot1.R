plot1 <- function(pathToDataFile) {
    data <- readData(pathToDataFile)
    png(file = "plot1.PNG")
    hist(data$Global_active_power, main = "Global Active Power", 
         xlab = "Global Active Power (kilowatts)", ylab = "Frequency", 
         col = "red")
    dev.off();
}


readData <- function(pathToDataFile) {
    completeFileName = paste0(pathToDataFile, "/household_power_consumption.txt")
    fullData <- read.csv(completeFileName, sep = ";", 
                     na.strings = "?", 
                     colClasses=c(rep("character",2), rep("numeric",7)))
    fullData$Date = as.Date(fullData$Date, format = "%d/%m/%Y")
    myData <- subset(fullData, Date >= "2007-02-01" & Date <= "2007-02-02" )
    myData
}