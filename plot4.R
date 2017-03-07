data<-read.table("household_power_consumption.txt",sep = ";", header = TRUE)

# subsetting and formatting data

data$Date<-as.Date(data$Date, format = "%d/%m/%Y")

datasub<-subset(data,data$Date == "2007-02-01" | data$Date == "2007-02-02" )

datasub$Global_active_power<-as.numeric(as.character(datasub$Global_active_power))
datasub$Global_reactive_power<-as.numeric(as.character(datasub$Global_reactive_power))
datasub$Voltage<-as.numeric(as.character(datasub$Voltage))

datasub$Sub_metering_1<-as.numeric(as.character(datasub$Sub_metering_1))
datasub$Sub_metering_2<-as.numeric(as.character(datasub$Sub_metering_2))
datasub$Sub_metering_3<-as.numeric(as.character(datasub$Sub_metering_3))

datasub$Time<-as.POSIXct((paste(datasub$Date,datasub$Time)))
par(mfrow=c(2,2))

with(datasub) {
    plot(datasub$Time,datasub$Global_active_power,type="l",
         ylab = "Global Active Power", xlab = "")
    plot(datasub$Time,datasub$Voltage, type="l", xlab = "datetime", ylab = "Voltage")
    plot(datasub$Time,datasub$Sub_metering_1, ylab="Energy sub metering", type="l")
    lines(datasub$Sub_metering_2~datasub$Time, col="red")
    lines(datasub$Sub_metering_3~datasub$Time, col="blue")
    legend("topright", col=c("black","red", "blue"), lty = 1, 
           legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), cex = .2, pt.cex = 15)
    plot(datasub$Time,datasub$Global_reactive_power,type="l", xlab = "datetime", ylab = "Global_reactive_power")
    
}
dev.copy(png,file="plot4.png", height=480, width=480)
dev.off()