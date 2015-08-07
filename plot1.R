# read data 
data = read.table("household_power_consumption.txt",header = FALSE, 
                  sep = ";",na.strings = "?",stringsAsFactors= FALSE,
                  skip = 66637,nrows=2880)
names(data) = c("Date","Time","Global_active_power","Global_reactive_power",
                "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",
                "Sub_metering_3")
data$Time = strptime(data$Time,'%H:%M:%S')
data$Date = as.Date(data$Date,'%d/%m/%Y')

# plot 1
hist(data$Global_active_power,main="Global Active Power",xlab = "Global Active Power(kilowatts)",col = "red")
dev.copy(png, file = "plot1.png",width=480,height=480)
dev.off()

