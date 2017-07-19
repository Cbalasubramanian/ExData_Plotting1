week_1_data<- read.table("household_power_consumption.txt",sep=";",header=TRUE)
data_to_use <-subset(week_1_data,week_1_data$Date=="1/2/2007"|week_1_data$Date=="2/2/2007")

### Converting date and time
data_to_use$Date <- as.Date(data_to_use$Date, format="%d/%m/%Y")
data_to_use$Time <- strptime(data_to_use$Time, format="%H:%M:%S")
data_to_use[1:1440,"Time"] <- format(data_to_use[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data_to_use[1441:2880,"Time"] <- format(data_to_use[1441:2880,"Time"],"2007-02-02 %H:%M:%S") ## Trying POSIXct and paste to combine time and date returned NA due to diff tz.

# calling the basic plot function
png(filename="Plot3.png",width=850, height=600, bg="white")
plot(data_to_use$Time,data_to_use$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering",main="Energy sub-metering") 
lines(data_to_use$Time,as.numeric(as.character(data_to_use$Sub_metering_1)))
lines(data_to_use$Time,as.numeric(as.character(data_to_use$Sub_metering_2)),col="red")
lines(data_to_use$Time,as.numeric(as.character(data_to_use$Sub_metering_3)),col="blue") ## transform the factor variable to numeric for plotting
legend("topright",col=c("black","red","blue"),lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#dev.copy(png,file ="Plot_3.png")
dev.off()