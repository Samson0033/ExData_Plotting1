
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
par(mar = c(3, 5, 2, 2))
plot(finaldata$Date_Time, finaldata$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power(killowatts)")

######################################################################

## Code for saving the plot to a PNG file

dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()