# "Date"
# "Time"
# "Global_active_power"  
# "Global_reactive_power" 
# "Voltage"
# "Global_intensity"     
# "Sub_metering_1"
# "Sub_metering_2"        
# "Sub_metering_3"

power_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
power_data$Date <- strptime(power_data$Date, "%d/%m/%Y")
day1 <- as.POSIXlt("2007-02-01")
day2 <- as.POSIXlt("2007-02-02")
power_data <- subset(power_data, power_data$Date == day1 | power_data$Date == day2)
power_data$Time <- strptime(paste(as.character(power_data$Date), power_data$Time), "%Y-%m-%d %H:%M:%S")

png(file = "plot2.png", width = 480, height = 480, units = "px")
plot(power_data$Time, power_data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()

