##Plot1
#Assuming data in "Downloads" file
PowerUsage <- read.table("Downloads/household_power_consumption.txt", sep = ";", header = T)
PowerUsage <- filter(PowerUsage, Date == "2/2/2007" | Date == "1/2/2007")

PowerUsage$Global_active_power <- as.numeric(as.character(PowerUsage$Global_active_power))

png(file = "plot1.png")
hist(PowerUsage$Global_active_power, xlab = "Global Active Power (kilowatts)", 
     col = "red", main = "Global Active Power")

dev.off()