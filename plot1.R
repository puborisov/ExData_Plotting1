#library(tidyr)

#Getting data and preparing it
data <- read.table("Data\\hpc.txt", header = TRUE, sep = ";", colClasses = "character", na.strings = "?")
sub_data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
sub_data <- unite(sub_data, Date_Time, Date, Time, sep = " ")
sub_data$Date_Time <- strptime(sub_data$Date_Time, format = "%d/%m/%Y %H:%M:%S")
sub_data$Global_active_power <- as.numeric(sub_data$Global_active_power)
sub_data$Global_reactive_power <- as.numeric(sub_data$Global_reactive_power)
sub_data$Voltage <- as.numeric(sub_data$Voltage)
sub_data$Global_intensity <- as.numeric(sub_data$Global_intensity)
sub_data$Sub_metering_1 <- as.numeric(sub_data$Sub_metering_1)
sub_data$Sub_metering_2 <- as.numeric(sub_data$Sub_metering_2)
sub_data$Sub_metering_3 <- as.numeric(sub_data$Sub_metering_3)

#Creating file with plot1
png("plot1.png",width = 480, height = 480, bg = "white")
par(mfrow = c(1,1))
hist(sub_data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
