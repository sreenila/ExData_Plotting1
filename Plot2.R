setwd("C:/Users/Sreenilad/Coursera/Exploring Data/exdata-data-household_power_consumption")
classes<-c(rep("character",2),rep("numeric",7))

#Reading Data
newdata<-read.table("household_power_consumption.txt",sep=";",colClasses=classes,header=T,na.strings = "?")
newdata$newdate<-as.Date(newdata[,1],"%d/%m/%Y")
newdata$newtime<-strptime(paste(newdata$Date,newdata$Time,sep = " "),format="%d/%m/%Y %H:%M:%S")

#Using data from dates 2007-02-01 and 2007-02-02
subdata<-subset(newdata,newdata$newdate=="2007-02-01"|newdata$newdate=="2007-02-02")

#Creating graph in png format
png("plot2.png",width=480,height=480,units="px")
plot(subdata$newtime,subdata$Global_active_power,type="n",ylab="Global Active Power (Kilowatts)",xlab=" ")
lines(subdata$newtime,subdata$Global_active_power)
dev.off()