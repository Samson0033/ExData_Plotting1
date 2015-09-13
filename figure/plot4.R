
## Reading the data in R
dataset <- read.table("household_power_consumption.txt", 
                      header = TRUE, sep = ";", dec = ".", na.strings = "?")

## Subsetting the data 
finaldata <- dataset[which(dataset$Date == "1/2/2007"|dataset$Date == "2/2/2007"), ]

## Converting the Date and Time into Date/Time classes in R
Date_Time <- strptime(paste(finaldata$Date, finaldata$Time, sep = " "), 
                      "%d/%m/%Y %H:%M:%S")
finaldata <- cbind(Date_Time, finaldata)

## Constructing the Histogram
par(mar = c(5, 5, 2, 2))
line_colors <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
par(mfrow = c(2, 2))
plot(finaldata$Date_Time, finaldata$Global_active_power, type = "l", xlab = "", 
          col = "green", ylab = "Global Active Power")
plot(finaldata$Date_Time, finaldata$Voltage, type = "l", xlab = "datetime", 
     col = "orange", ylab = "Voltage", )
plot(finaldata$Date_Time, finaldata$Sub_metering_1, type = "l", 
     col = line_colors[1], xlab = "", ylab = "Energy sub metering")
lines(finaldata$Date_Time, finaldata$Sub_metering_2, col = line_colors[2])
lines(finaldata$Date_Time, finaldata$Sub_metering_3, col = line_colors[3])
legend("topright", legend = labels, col = line_colors, lty = "solid", bty = "n")
plot(finaldata$Date_Time, finaldata$Global_reactive_power, type = "l", 
     col = "blue", xlab = "datetime", ylab = "Global_reactive_power")

######################################################################

## Code for saving the plot to a PNG file

dev.copy(png, file = "plot4.png", width = 600, height = 480)
dev.off()

## Here, it is to be noticed that if the width is 480 pixels, 
## the legend cannot be fully read. I was thus obliged to set
## it to 600 pixels.