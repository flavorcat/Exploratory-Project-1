graph1 <- function(x) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="power.zip", method="curl")
  unzip("power.zip")
  power <- read.table ("household_power_consumption.txt", header=T, sep=";")
  T1 <- paste(power$Date, power$Time)
  NiceTime <- strptime(T1, "%d/%m/%Y %H:%M:%S")
  NicePower <- cbind(power, NiceTime)
  useful <- NicePower[NicePower$Date=="1/2/2007" | NicePower$Date=="2/2/2007",]
  gap <- as.numeric(as.character(useful$Global_active_power))
  png(file="plot1.png")
  hist(gap, col="red", main ="Global Active Power", xlab= "Global Active Power (kilowatts)")
  dev.off()
}