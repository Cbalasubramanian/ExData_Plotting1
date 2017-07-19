week_1_data<- read.table("household_power_consumption.txt",sep=";",header=TRUE)
data_to_use <-subset(week_1_data,week_1_data$Date=="1/2/2007"|week_1_data$Date=="2/2/2007")

### Converting date and time
data_to_use$Date <- as.Date(data_to_use$Date, format="%d/%m/%Y")
data_to_use$Time <- strptime(data_to_use$Time, format="%H:%M:%S")
data_to_use[1:1440,"Time"] <- format(data_to_use[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data_to_use[1441:2880,"Time"] <- format(data_to_use[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# calling the basic plot function
plot(data_to_use$Time,as.numeric(as.character(data_to_use$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

dev.copy(png,file ="Plot_2.png")
dev.off()