# Code for reading the data and converting the Date and Time variables to Date/Time class

unzip("exdata_data_household_power_consumption.zip")
library(sqldf)
data <- read.csv.sql("household_power_consumption.txt",header=TRUE,sep=";",sql="select * from file where Date in ('1/2/2007','2/2/2007')")
data$DateTime <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")

# Code for constructing the plot and to create the PNG file

par(mfcol=c(2,2))
plot(data$DateTime,data$Global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(data$DateTime,data$Sub_metering_1,xlab="",ylab="Energy sub metering",type="n")
points(data$DateTime,data$Sub_metering_1,type="l")
points(data$DateTime,data$Sub_metering_2,type="l",col="red")
points(data$DateTime,data$Sub_metering_3,type="l",col="blue")
legend("topright",bty="n",cex=0.85,lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(data$DateTime,data$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(data$DateTime,data$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.copy(png,file="plot4.png")
dev.off()
