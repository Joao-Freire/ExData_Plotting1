# Code for reading the data and converting the Date and Time variables to Date/Time class

unzip("exdata_data_household_power_consumption.zip")
library(sqldf)
data <- read.csv.sql("household_power_consumption.txt",header=TRUE,sep=";",sql="select * from file where Date in ('1/2/2007','2/2/2007')")
data$DateTime <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")

# Code for constructing the plot and to create the PNG file

plot(data$DateTime,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.copy(png,file="plot2.png")
dev.off()
