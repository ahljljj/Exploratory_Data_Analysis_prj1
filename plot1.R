library(dplyr)


my_data <- read.delim("household_power_consumption.txt",header=TRUE, sep=";", na.strings="?")

my_data$Date <- as.Date(my_data$Date , "%d/%m/%Y")


sub_data<-subset(my_data, Date <= as.Date('2007-02-02',format = "%Y-%m-%d") & Date >= as.Date('2007-02-01',format = "%Y-%m-%d"))


#plot 1

png(filename="plot1.png", height = 480, width = 480)

hist(sub_data$Global_active_power, col='red', main='Global active power', xlab='Global active power(kilowatts)')


dev.off()