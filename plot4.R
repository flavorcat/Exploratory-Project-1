graph4 <- function(x) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="power.zip", method="curl")
  unzip("power.zip")
  power <- read.table ("household_power_consumption.txt", header=T, sep=";", na.strings="?")
  T1 <- paste(power$Date, power$Time)
  NiceTime <- strptime(T1, "%d/%m/%Y %H:%M:%S")
  NicePower <- cbind(power, NiceTime)
  useful <- NicePower[NicePower$Date=="1/2/2007" | NicePower$Date=="2/2/2007",]
  useful <- useful[complete.cases(useful),]
  png(file="plot4.png")
  par(mfrow=c(2,2))
  with(useful, {
    plot(NiceTime, Global_active_power, type="l", xlab="", ylab="Global Active Power")
    plot(NiceTime, Voltage, type="l", xlab="datetime", ylab="Voltage")
    plot(NiceTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
    lines(NiceTime, Sub_metering_2, col="red")
    lines(NiceTime, Sub_metering_3, col="blue")
    legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1)
    plot(NiceTime, Global_active_power, ylim=c(0,.5), type="l", xlab="datetime")
  })
  dev.off()
}