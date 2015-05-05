library(graphics)
setwd('/home/ajayr/code/R//ExData_Plotting1')
hp <- read.table(file = "household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
hp$Date <- as.Date(strptime(hp$Date, "%d/%m/%Y"))
# Subset
hp <- hp[hp$Date >= as.Date("2007-02-01") & hp$Date <= as.Date("2007-02-02"), ]
reading_ts <- paste(hp$Date, hp$Time)
thu <- which(reading_ts=="2007-02-01 00:00:00")
fri <- which(reading_ts=="2007-02-02 00:00:00")
sat <- which(reading_ts=="2007-02-02 23:59:00")
#par(pch=10, col="black")
png(filename = "plot2.png", width = 480, height = 480)
plot(hp$Global_active_power, type="l", lwd =2, col="black", xlab="", ylab = "Global Active Power (kilowatts)", xaxt = "n" )
axis(1, at=c(thu,fri,sat), labels=c("Thu", "Fri", "Sat"))
dev.off()