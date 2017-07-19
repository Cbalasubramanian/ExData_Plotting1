week_1_data<- read.table("household_power_consumption.txt",sep=";",header=TRUE)
data_to_use <-subset(week_1_data,week_1_data$Date=="1/2/2007"|week_1_data$Date=="2/2/2007")

### plot 1 histogram
hist(as.numeric(as.character(data_to_use$Global_active_power)),col="red",xlab="Global Active Power(kilowatts)",main="Global Active Power")

dev.copy(png,file ="Plot_1.png")
dev.off()