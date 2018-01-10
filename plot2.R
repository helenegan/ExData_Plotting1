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

#Creating plot2
png(filename="plot2.png") # creates a plot into the current working directory
plot(working_data$`Date/Time`,working_data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
