## Reading Text file data, removing missing items
powerdata <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")

## Extracting Relevant rows
data <- subset(powerdata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(powerdata)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 1 - Histogram
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Save Plot to PNG
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
