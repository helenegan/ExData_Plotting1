# Reading and cleaning the data. household_power_consumption.txt must be in your working directory to run this code.

#Reading the data and paying attention to decimals and NA values
working_data<-read.csv2("household_power_consumption.txt", dec = ".", na.strings="?")
#Selecting data only for required dates
working_data<-working_data[working_data$Date=="1/2/2007" | working_data$Date=="2/2/2007",]
#Converting dates and time into class 'POSIXct' and merging into one column
working_data$Date<-as.Date(working_data$Date, "%d/%m/%Y")
working_data$Date<-strptime(paste(working_data$Date, working_data$Time), "%Y-%m-%d %H:%M:%S" , "GMT")
working_data <- working_data[ , !(names(working_data) %in% "Time")]
colnames(working_data)[1]<-"Date/Time"

#Creating plot3
png(filename="plot3.png") # creates a plot into the current working directory
plot(working_data$`Date/Time`,working_data$Sub_metering_1, type="l", col="black", ylab="Energy sub metering", xlab="")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red", "blue"), lty=1)
lines(working_data$`Date/Time`,working_data$Sub_metering_2, type="l", col="red", ylab="Energy sub metering", xlab="")
lines(working_data$`Date/Time`,working_data$Sub_metering_3, type="l", col="blue", ylab="Energy sub metering", xlab="")

dev.off()