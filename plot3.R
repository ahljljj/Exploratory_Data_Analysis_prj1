library(dplyr)


my_data <- read.delim("household_power_consumption.txt",header=TRUE, sep=";", na.strings="?")

my_data$Date <- as.Date(my_data$Date , "%d/%m/%Y")


sub_data<-subset(my_data, Date <= as.Date('2007-02-02',format = "%Y-%m-%d") & Date >= as.Date('2007-02-01',format = "%Y-%m-%d"))

sub_data<-sub_data %>%
  mutate(datatime=as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"))

# plot 3

png(filename="plot3.png", height = 480, width = 480)

plot(sub_data$datatime, sub_data$Sub_metering_1, type='l', col='black',xlab='', ylab='Energy sub metering')
lines(sub_data$datatime, sub_data$Sub_metering_2, col='red')
lines(sub_data$datatime, sub_data$Sub_metering_3, col='blue')
legend('topright', legend=c("Sub_metering_1", "Sub_metering_2", 'Sub_metering_3'),
       col=c("black", "red","blue"), lty=c(1,1,1))

dev.off()