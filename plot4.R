library(graphics)

# Assume that the input file is in the current working directory

# Read the input file
hp <- read.table(file = "household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")

# Date format
hp$Date <- as.Date(strptime(hp$Date, "%d/%m/%Y"))

# Subset
hp <- hp[hp$Date >= as.Date("2007-02-01") & hp$Date <= as.Date("2007-02-02"), ]

# Get positions in X-axis for the days
reading_ts <- paste(hp$Date, hp$Time)
thu <- which(reading_ts=="2007-02-01 00:00:00")
fri <- which(reading_ts=="2007-02-02 00:00:00")
sat <- which(reading_ts=="2007-02-02 23:59:00")

# Plot
png(filename = "plot4.png", width = 480, height = 480)
# 2x2 = 4 plots
par(mfrow=c(2,2))

# Plot 1
plot(hp$Global_active_power, type="l", lwd =2, col="black", xlab="", ylab = "Global Active Power", xaxt = "n" )
axis(1, at=c(thu,fri,sat), labels=c("Thu", "Fri", "Sat"))

# Plot 2
plot(hp$Voltage, type="l", lwd =2, col="black", xlab="datetime", ylab = "Voltage", xaxt = "n" )
axis(1, at=c(thu,fri,sat), labels=c("Thu", "Fri", "Sat"))

# Plot 3
plot(hp$Sub_metering_1, type="l", lwd =1, col="black", xlab="", ylab = "Energy sub metering", xaxt = "n" )
lines(hp$Sub_metering_2, type="l", lwd =1, col="red")
lines(hp$Sub_metering_3, type="l", lwd =1, col="blue")
axis(1, at=c(thu,fri,sat), labels=c("Thu", "Fri", "Sat"))
legend(750, 39.5 , c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n", lty=c(1,1,1), lwd=c(1, 1, 1), col=c("black", "red", "blue"))

# Plot 4
plot(hp$Global_reactive_power, type="l", lwd =2, col="black", xlab="datetime", ylab = "Global_reactive_power", xaxt = "n" )
axis(1, at=c(thu,fri,sat), labels=c("Thu", "Fri", "Sat"))

dev.off()
