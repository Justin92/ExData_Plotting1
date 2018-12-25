##Plot2
#Assuming data in "Downloads" file
PowerUsage <- read.table("Downloads/household_power_consumption.txt", sep = ";", header = T)
PowerUsage <- filter(PowerUsage, Date == "2/2/2007" | Date == "1/2/2007")

PowerUsage$Global_active_power <- as.numeric(as.character(PowerUsage$Global_active_power))

PowerUsage <- mutate(PowerUsage, Date_Time = 
                       as.POSIXct(paste(as.character(PowerUsage2$Date), 
                                        as.character(PowerUsage2$Time), sep = " "), 
                                  format = "%d/%m/%Y %H:%M:%S"))

png(file = "plot2.png")
plot(PowerUsage$Date_Time, PowerUsage$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()
