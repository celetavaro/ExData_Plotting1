pdata <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

pdata[, 1] <- as.Date(pdata[, 1], format = "%d/%m/%Y")

# subset for the dates we want to use ("2007-02-01", "2007-02-02")    
testSet <- subset(pdata, pdata$Date == "2007-02-01" | pdata$Date == "2007-02-02")

testSet <- na.omit(testSet)

# remove original dataset to free memory
rm(pdata)

fixTime <- strptime(paste(testSet$Date, testSet$Time, sep = " "), "%Y-%m-%d %H:%M:%S")
  
  png("plot3.png", width = 480, height = 480)
  plot(fixTime, testSet$Sub_metering_1, xlab = "", ylab = "Energy Sub Metering", type = "l")
  lines(fixTime, testSet$Sub_metering_2, type = "l", col = "red")
  lines(fixTime, testSet$Sub_metering_3, type = "l", col = "blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, 
         col = c("black", "red", "blue"), cex = 0.70)
  dev.off()
