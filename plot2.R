library(dplyr)


my_data <- read.delim("household_power_consumption.txt",header=TRUE, sep=";", na.strings="?")

my_data$Date <- as.Date(my_data$Date , "%d/%m/%Y")


sub_data<-subset(my_data, Date <= as.Date('2007-02-02',format = "%Y-%m-%d") & Date >= as.Date('2007-02-01',format = "%Y-%m-%d"))

#plot 2

sub_data<-sub_data %>%
  mutate(datatime=as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"))

png(filename="plot2.png", height = 480, width = 480)

plot(sub_data$datatime, sub_data$Global_active_power, type='l', col='black', xlab="", ylab="Global Active Power (kilowatts)")

dev.off()