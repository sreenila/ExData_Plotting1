
setwd("C:/Users/Sreenilad/Coursera/Exploring Data/exdata-data-household_power_consumption")
classes<-c(rep("character",2),rep("numeric",7))

#Reading Data
newdata<-read.table("household_power_consumption.txt",sep=";",colClasses=classes,header=T,na.strings = "?")
newdata$newdate<-as.Date(newdata[,1],"%d/%m/%Y")
newdata$newtime<-as.POSIXct(newdata[,2],format="%H:%M:%S")
subdata<-subset(newdata,newdata$newdate=="2007-02-01"|newdata$newdate=="2007-02-02")

#Creating graph in png format
png("plot1.png",width=480,height=480,units="px")
hist(subdata$Global_active_power,xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power",col="Red")
dev.off()
