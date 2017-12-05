

filename <- "household_power_consumption.txt"
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipFile <- "exdata%2Fdata%2Fhousehold_power_consumption.zip"

    if(!file.exists(filename)){
      
      download.file(fileURL, filename, method = "curl")
      unzip(zipFile)
      
    }

pdata <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)


    pdata[, 1] <- as.Date(pdata[, 1], format = "%d/%m/%Y")


    
# subset for the dates we want to use ("2007-02-01", {2007-02-02})    
    testSet <- subset(pdata, pdata$Date == "2007-02-01" | pdata$Date == "2007-02-02")
    
# generate the Histogram
    par(mar = c(5.1, 4.1, 4.5, 2.1)) # extend top margin so export won't cut off upper limit of y-axis 
    
    hist(testSet$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")