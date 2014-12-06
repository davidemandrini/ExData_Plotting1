plot3 <- function(pathToDataFile) {
    data <- readData(pathToDataFile)
    png(file = "plot3.PNG")
    par(mar = c(4,4,4,2))
    plot(data$Sub_metering_1, main = NULL, 
         ylab = "Energy sub metering", xlab = "", 
         col = "black", type = "n", axes = FALSE, frame = TRUE)
    lines(data$Sub_metering_1, col = "black")
    lines(data$Sub_metering_2, col = "red")
    lines(data$Sub_metering_3, col = "blue")
    axis(side = 1, labels = c("Thu", "Fri", "Sat"), 
         at = c(1, floor(nrow(data)/2), nrow(data)))
    axis(2)
    legend("topright", lwd = 1, col = c("black", "red", "blue"),
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    dev.off()
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