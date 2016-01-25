rm(list=ls())
file="household_power_consumption.txt"
power <- read.table(file, header=TRUE, sep=";")

power$Date2Keep <- as.Date(power$Date, format="%d/%m/%Y")
#Keep only 02/02 and 02/02 from 2007
powerSubset<-power[which(power$Date2Keep=="2007-02-01" | power$Date2Keep=="2007-02-02"),]


Global_active_power<-as.numeric(as.character(powerSubset$Global_active_power))
Global_reactive_power<-as.numeric(as.character(powerSubset$Global_reactive_power))                              
power$timestamp<-paste(power$Date,power$Time)
datetime <- strptime(paste(powerSubset$Date,powerSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

submeter1<-as.numeric(powerSubset$Sub_metering_1)
submeter2<-as.numeric(powerSubset$Sub_metering_2)
submeter3<-as.numeric(powerSubset$Sub_metering_3)
voltage<-as.numeric(powerSubset$Voltage)

png(filename="plot4.png",width=480,height = 480)
par(mfrow=c(2,2))
plot(datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(datetime,voltage,type="l",xlab="datetime",ylab="Voltage")

plot(datetime,submeter1, type="l",ylab="Energy sub metering",xlab="")
lines(datetime,submeter2,type="l",col="red")
lines(datetime,submeter3,type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(datetime,Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()
