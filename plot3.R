graph <- function(x) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="power.zip", method="curl")
  unzip("power.zip")
  power <- read.table ("household_power_consumption.txt", header=T, sep=";", na.strings="?")
  T1 <- paste(power$Date, power$Time)
  NiceTime <- strptime(T1, "%d/%m/%Y %H:%M:%S")
  NicePower <- cbind(power, NiceTime)
  useful <- NicePower[NicePower$Date=="1/2/2007" | NicePower$Date=="2/2/2007",]
  useful <- useful[complete.cases(useful),]
  png(file="plot3.png")
  plot(useful$NiceTime, useful$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(useful$NiceTime, useful$Sub_metering_2, col="red")
  lines(useful$NiceTime, useful$Sub_metering_3, col="blue")
  legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1)
  dev.off()
}