## Exploratory Data Analysis - Project Assignment 1 - Plot 1
#
# I decided to preprocess the file and only selected those dates that are relevant for
# the course project. That should be more convenient to work with regardless of computer.

library("data.table")

#Read the data using the data.table-package, using "?" as missing value string!

epc <- fread("hpc small.txt", colClasses ="character", na.strings="?")

# Create the plot using the png device with standard settings of 480x480

png(filename = "plot1.png")
hist(as.numeric(epc$Global_active_power), col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()