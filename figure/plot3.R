
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
par(mar = c(3, 5, 2, 1))
line_colors <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(finaldata$Date_Time, finaldata$Sub_metering_1, type = "l", 
     col = line_colors[1], xlab = "", ylab = "Energy sub metering")
lines(finaldata$Date_Time, finaldata$Sub_metering_2, col = line_colors[2])
lines(finaldata$Date_Time, finaldata$Sub_metering_3, col = line_colors[3])
legend("topright", legend = labels, col = line_colors, lty = "solid")

######################################################################

## Code for saving the plot to a PNG file

dev.copy(png, file = "plot3.png", width = 600, height = 480)
dev.off()

## Here, it is to be noticed that if the width is 480 pixels, 
## the legend cannot be fully read. I was thus obliged to set
## it to 600 pixels.