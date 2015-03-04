power_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
power_data$Date <- strptime(power_data$Date, "%d/%m/%Y")
day1 <- as.POSIXlt("2007-02-01")
day2 <- as.POSIXlt("2007-02-02")
power_data <- subset(power_data, power_data$Date == day1 | power_data$Date == day2)

png(file = "plot1.png", width = 480, height = 480, units = "px", bg = "transparent")
hist(power_data$Global_active_power,
     main = "Global Active Power",
     col = "#ff2500",
     xlab = "Global Active Power (kilowatts)")
dev.off()
