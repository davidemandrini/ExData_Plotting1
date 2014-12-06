plot2 <- function(pathToDataFile) {
    data <- readData(pathToDataFile)
    png(file = "plot2.PNG")
    par(mar = c(4,4,4,2))
    plot(data$Global_active_power, main = NULL, 
         ylab = "Global Active Power (kilowatts)", xlab = "", 
         col = "black", type = "n", axes = FALSE, frame = TRUE)
    lines(data$Global_active_power)
    axis(side = 1, labels = c("Thu", "Fri", "Sat"), 
         at = c(1, floor(nrow(data)/2), nrow(data)))
    axis(2)
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