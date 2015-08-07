# read data 
data = read.table("household_power_consumption.txt",header = FALSE, 
                  sep = ";",na.strings = "?",stringsAsFactors= FALSE,
                  skip = 66637,nrows=2880)
names(data) = c("Date","Time","Global_active_power","Global_reactive_power",
                "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",
                "Sub_metering_3")
datetime = strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
data$Datetime <- as.POSIXct(datetime)

# plot 2
plot(data$Global_active_power~data$Datetime,xlab="",
     ylab="Global Active Power (kilowatts)",type="l")
dev.copy(png, file = "plot2.png",width=480,height=480)
dev.off()

