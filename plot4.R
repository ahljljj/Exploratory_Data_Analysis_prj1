library(dplyr)


my_data <- read.delim("household_power_consumption.txt",header=TRUE, sep=";", na.strings="?")

my_data$Date <- as.Date(my_data$Date , "%d/%m/%Y")


sub_data<-subset(my_data, Date <= as.Date('2007-02-02',format = "%Y-%m-%d") & Date >= as.Date('2007-02-01',format = "%Y-%m-%d"))

sub_data<-sub_data %>%
  mutate(datatime=as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"))

# plot 4

png(filename="plot4.png", height = 480, width = 480)

par(mfrow=c(2,2))

plot(sub_data$datatime, sub_data$Global_active_power, type='l', col='black', xlab="", ylab="Global Active Power")

plot(sub_data$datatime, sub_data$Voltage, type='l', col='black', xlab="datetime", ylab="Voltage")

plot(sub_data$datatime, sub_data$Sub_metering_1, type='l', col='black',xlab='', ylab='Energy sub metering')
lines(sub_data$datatime, sub_data$Sub_metering_2, col='red')
lines(sub_data$datatime, sub_data$Sub_metering_3, col='blue')
legend('topright', legend=c("Sub_metering_1", "Sub_metering_2", 'Sub_metering_3'),
       col=c("black", "red","blue"), lty=c(1,1,1), cex=0.75)

plot(sub_data$datatime, sub_data$Global_reactive_power, type='l', col='black', xlab="datetime", ylab="Global_reactive_power")

dev.off()

par(mfrow=c(1,1))
