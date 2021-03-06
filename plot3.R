# read data 
data = read.table("household_power_consumption.txt",header = FALSE, 
                  sep = ";",na.strings = "?",stringsAsFactors= FALSE,
                  skip = 66637,nrows=2880)
names(data) = c("Date","Time","Global_active_power","Global_reactive_power",
                "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",
                "Sub_metering_3")
datetime = strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
data$Datetime <- as.POSIXct(datetime)

# plot 3
plot(data$Datetime,data$Sub_metering_1,xlab="",
     ylab="Energy Submetering",type="l")
lines(data$Datetime, data$Sub_metering_2, type="l", col="red")
lines(data$Datetime, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2.5,col=c("black", "red", "blue"))
dev.copy(png, file = "plot3.png",width=480,height=480)
dev.off()

