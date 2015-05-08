library(graphics)
setwd('C:/Users//Aarthi/code/R//ExData_Plotting1')
hp <- read.table(file = "household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
hp$Date <- as.Date(strptime(hp$Date, "%d/%m/%Y"))
# Subset
hp <- hp[hp$Date >= as.Date("2007-02-01") & hp$Date <= as.Date("2007-02-02"), ]
reading_ts <- paste(hp$Date, hp$Time)
thu <- which(reading_ts=="2007-02-01 00:00:00")
fri <- which(reading_ts=="2007-02-02 00:00:00")
sat <- which(reading_ts=="2007-02-02 23:59:00")
#par(pch=10, col="black")
png(filename = "plot3.png", width = 480, height = 480)
plot(hp$Sub_metering_1, type="l", lwd =1, col="black", xlab="", ylab = "Energy sub metering", xaxt = "n" )
lines(hp$Sub_metering_2, type="l", lwd =1, col="red")
lines(hp$Sub_metering_3, type="l", lwd =1, col="blue")
axis(1, at=c(thu,fri,sat), labels=c("Thu", "Fri", "Sat"))

legend(1875, 39.5 , c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(2.5,2.5, 2.5), col=c("black", "red", "blue"))
dev.off()