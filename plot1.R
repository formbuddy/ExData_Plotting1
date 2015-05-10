library(graphics)

# Assume that the input file is in the current working directory

# Read the input file
hp <- read.table(file = "household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")

# Date format
hp$Date <- as.Date(strptime(hp$Date, "%d/%m/%Y"))

# Subset
hp <- hp[hp$Date >= as.Date("2007-02-01") & hp$Date <= as.Date("2007-02-02"), ]

# Plot
png(filename = "plot1.png", width = 480, height = 480)
hist(hp$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()