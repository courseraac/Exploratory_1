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

par(mfrow=c(1,1))
plot(datasub$Time,datasub$Global_active_power,type="l", 
     xlab = "", ylab="Global Active Power (Kilowatts)")

dev.copy(png,file="plot2.png", height=480, width=480)
dev.off()