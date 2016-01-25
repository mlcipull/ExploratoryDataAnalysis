rm(list=ls())
file="household_power_consumption.txt"
power <- read.table(file, header=TRUE, sep=";")

#Use as date, as suggested in assignment
power$Date <- as.Date(power$Date, format="%d/%m/%Y")


#Keep only 02/02 and 02/02 from 2007
powerSubset<-power[which(power$Date=="2007-02-01" | power$Date=="2007-02-02"),]
powerSubset$Global_active_power<-as.numeric(as.character(powerSubset$Global_active_power))

#Plot 1
png(filename="plot1.png",width=480,height=480)
hist(powerSubset$Global_active_power,main="Global Active Power",ylab="Frequency",xlab="Global Active Power (kilowatts)",col="red")
dev.off()
