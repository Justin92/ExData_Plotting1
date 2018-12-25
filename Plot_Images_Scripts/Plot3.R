##Plot3
#Assuming data in "Downloads" file
PowerUsage <- read.table("Downloads/household_power_consumption.txt", sep = ";", header = T)
PowerUsage <- filter(PowerUsage, Date == "2/2/2007" | Date == "1/2/2007")

PowerUsage$Global_active_power <- as.numeric(as.character(PowerUsage$Global_active_power))

PowerUsage <- mutate(PowerUsage, Date_Time = 
                       as.POSIXct(paste(as.character(PowerUsage2$Date), 
                                        as.character(PowerUsage2$Time), sep = " "), 
                                  format = "%d/%m/%Y %H:%M:%S"))

PowerUsage$Sub_metering_1 <- as.numeric(as.character(PowerUsage$Sub_metering_1))
PowerUsage$Sub_metering_2 <- as.numeric(as.character(PowerUsage$Sub_metering_2))
PowerUsage$Sub_metering_3 <- as.numeric(as.character(PowerUsage$Sub_metering_3))

png(file = "plot3.png")

plot(PowerUsage$Date_Time, PowerUsage$Sub_metering_1, type = "l", col = "black", xlab = "", 
     ylab = "Energy sub metering")

lines(PowerUsage$Date_Time, PowerUsage$Sub_metering_2, type = "l", col = "red")
lines(PowerUsage$Date_Time, PowerUsage$Sub_metering_3, type = "l", col = "blue")

legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"), cex = 0.8)

dev.off()
