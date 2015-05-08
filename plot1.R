library(graphics)
setwd('C:/Users//Aarthi/code/R//ExData_Plotting1')
hp <- read.table(file = "household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
hp$Date <- as.Date(strptime(hp$Date, "%d/%m/%Y"))
# Subset
hp <- hp[hp$Date >= as.Date("2007-02-01") & hp$Date <= as.Date("2007-02-02"), ]
#png(filename = "plot1.png", width = 480, height = 480)
hist(hp$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
#dev.off()