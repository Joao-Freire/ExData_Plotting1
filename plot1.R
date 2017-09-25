# Code for reading the data

unzip("exdata_data_household_power_consumption.zip")
library(sqldf)
data <- read.csv.sql("household_power_consumption.txt",header=TRUE,sep=";",sql="select * from file where Date in ('1/2/2007','2/2/2007')")

# Code for constructing the plot and to create the PNG file

hist(data$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.copy(png,file="plot1.png")
dev.off()
