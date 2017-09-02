downloadURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
downloadFile <- "C:/DataSciencetext/JohnHopkins/household_power_consumption.zip"
householdFile <-"C:/DataSciencetext/JohnHopkins/household_power_consumption/household_power_consumption.txt"
##
if (!file.exists(householdFile)) {
  download.file(downloadURL, downloadFile, method = "curl")
  unzip(downloadFile, overwrite = T, exdir = "./Data")
}
##
plotData <- read.table(householdFile, header=T, sep=";", na.strings="?")
## set time variable
finalData <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finalData <- cbind(SetTime, finalData)
##
## Generating Plot 2
plot(finalData$SetTime, finalData$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png,"plot2.png", width = 480, height = 480, units = "px", bg = "white")
dev.off()