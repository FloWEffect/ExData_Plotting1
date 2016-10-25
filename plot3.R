## Exploratory Data Analysis - Project Assignment 1 - Plot 3
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

# Change the sub metering column to factor for coloring

#epc_molten <- transform(epc_molten, variable = factor(variable))

# Create the plot using the png device with standard settings of 480x480

png(filename = "plot3.png")
with(epc_molten, plot(DateTime, as.numeric(value), type="S", xlab = "", ylab = "Energy sub metering"))
with(subset(epc_molten, variable=="Sub_metering_2"), lines(DateTime, as.numeric(value), col="red"))
with(subset(epc_molten, variable=="Sub_metering_3"), lines(DateTime, as.numeric(value), col="blue"))
legend("topright", lw=1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()