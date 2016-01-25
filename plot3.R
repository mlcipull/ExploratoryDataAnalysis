rm(list=ls())
file="household_power_consumption.txt"
power <- read.table(file, header=TRUE, sep=";")
power$timestamp<-paste(power$Date,power$Time)
power$Date2Keep <- as.Date(power$Date, format="%d/%m/%Y")
#Keep only 02/02 and 02/02 from 2007
powerSubset<-power[which(power$Date2Keep=="2007-02-01" | power$Date2Keep=="2007-02-02"),]


datetime <- strptime(paste(powerSubset$Date, powerSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

submeter1<-as.numeric(powerSubset$Sub_metering_1)
submeter2<-as.numeric(powerSubset$Sub_metering_2)
submeter3<-as.numeric(powerSubset$Sub_metering_3)

png(filename = "plot3.png",width=480,height=480)
plot(datetime,submeter1, type="l",ylab="Energy sub metering",xlab="")
lines(datetime,submeter2,type="l",col="red")
lines(datetime,submeter3,type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
