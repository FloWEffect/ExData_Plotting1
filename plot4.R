## Exploratory Data Analysis - Project Assignment 1 - Plot 4
#
# I decided to preprocess the file and only selected those dates that are relevant for
# the course project. That should be more convenient to work with regardless of computer.

library("data.table")

#Read the data using the data.table-package, using "?" as missing value string!

epc <- fread("hpc small.txt", colClasses ="character", na.strings="?")

# Create a DateTime field 
epc$DateTime <- paste(epc$Date,epc$Time)
epc$DateTime <- as.POSIXct(epc$DateTime, format="%d/%m/%Y %H:%M:%S")

# Melt data 

epc_molten <- melt(epc, measure.vars = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Create the plot using the png device with standard settings of 480x480

png(filename = "plot4.png")
  par(mfrow = c(2,2)) # Set plotting area
  plot(epc$DateTime, as.numeric(epc$Global_active_power), type = "l", xlab="", ylab= "Global Active Power")
  plot(epc$DateTime, as.numeric(epc$Voltage), type = "l", xlab="datetime", ylab= "Voltage")
  with(epc_molten, plot(DateTime, as.numeric(value), type="l", xlab = "", ylab = "Energy sub metering"))
  with(subset(epc_molten, variable=="Sub_metering_2"), lines(DateTime, as.numeric(value), col="red"))
  with(subset(epc_molten, variable=="Sub_metering_3"), lines(DateTime, as.numeric(value), col="blue"))
  legend("topright", lw=1, bty = "n", col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(epc$DateTime, as.numeric(epc$Global_reactive_power), type = "l", xlab="datetime", ylab = "Global_reactive_power")
dev.off()