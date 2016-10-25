## Exploratory Data Analysis - Project Assignment 1 - Plot 2
#
# I decided to preprocess the file and only selected those dates that are relevant for
# the course project. That should be more convenient to work with regardless of computer.

library("data.table")

#Read the data using the data.table-package, using "?" as missing value string!

epc <- fread("hpc small.txt", colClasses ="character", na.strings="?")

# Create a DateTime field 
epc$DateTime <- paste(epc$Date,epc$Time)
epc$DateTime <- as.POSIXct(epc$DateTime, format="%d/%m/%Y %H:%M:%S")

# Create the plot using the png device with standard settings of 480x480

png(filename = "plot2.png")
plot(epc$DateTime, as.numeric(epc$Global_active_power), type = "s", xlab="", ylab= "Global Active Power (kilowatts)")
dev.off()