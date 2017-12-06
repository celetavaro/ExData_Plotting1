pdata <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

pdata[, 1] <- as.Date(pdata[, 1], format = "%d/%m/%Y")

# subset for the dates we want to use ("2007-02-01", "2007-02-02")    
testSet <- subset(pdata, pdata$Date == "2007-02-01" | pdata$Date == "2007-02-02")

testSet <- na.omit(testSet)

# remove original dataset to free memory
rm(pdata)

fixTime <- strptime(paste(testSet$Date, testSet$Time, sep = " "), "%Y-%m-%d %H:%M:%S")
