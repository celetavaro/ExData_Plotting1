pdata <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

pdata[, 1] <- as.Date(pdata[, 1], format = "%d/%m/%Y")

# subset for the dates we want to use ("2007-02-01", "2007-02-02")    
testSet <- subset(pdata, pdata$Date == "2007-02-01" | pdata$Date == "2007-02-02")

testSet <- na.omit(testSet)

# remove original dataset to free memory
rm(pdata)

fixTime <- strptime(paste(testSet$Date, testSet$Time, sep = " "), "%Y-%m-%d %H:%M:%S")
gap <- as.numeric(testSet$Global_active_power)



png("plot4.png", width = 480, height = 480)
par(mfcol = c(2,2), mar = c(5,4,5,2))
    # panel plot 1
    plot(fixTime, gap, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
    # pane plot 2
    plot(fixTime, testSet$Sub_metering_1, xlab = "", ylab = "Energy Sub Metering", type = "l")
    lines(fixTime, testSet$Sub_metering_2, type = "l", col = "red")
    lines(fixTime, testSet$Sub_metering_3, type = "l", col = "blue")
    legend("topright", legend =  c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1,  
           col = c("black", "red", "blue"), bty = "n")
    # pane plot 3
    plot(fixTime, testSet$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
    # pane plot 4
    plot(fixTime, testSet$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
  dev.off()
