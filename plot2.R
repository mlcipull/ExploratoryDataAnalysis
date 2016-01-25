rm(list=ls())
file="household_power_consumption.txt"
power <- read.table(file, header=TRUE, sep=";")
power$timestamp<-paste(power$Date,power$Time)

power$Date <- as.Date(power$Date, format="%d/%m/%Y")
#Keep only 02/02 and 02/02 from 2007
powerSubset<-power[which(power$Date=="2007-02-01" | power$Date=="2007-02-02"),]
powerSubset$Global_active_power<-as.numeric(as.character(powerSubset$Global_active_power))

png(filename="plot2.png",width=480,height=480)
plot(strptime(powerSubset$timestamp,"%d/%m/%Y %H:%M:%S"),powerSubset$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
