
# read in data
hhpc <- read.csv("~/datasciencecoursera/household_power_consumption.txt", sep=";")

# organise dates & times into new column in posix format. Also convert date column to date format
datetime<-paste(hhpc$Date,hhpc$Time, sep = ", ")
datetimepos<-as.POSIXct(strptime(datetime, "%d/%m/%Y, %H:%M:%S"))
hhpc<-cbind(datetimepos,hhpc)
hhpc$Date<-as.Date(hhpc$Date, format = "%d/%m/%Y")

#Create a Subset of data to the 1st & 2nd of Feb 07, remove remaining data to save space in memory
data<-hhpc[hhpc$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]
rm(hhpc)

#Set data columns as numeric results
data[,4]<-as.numeric(as.character(data[,4]))
data[,5]<-as.numeric(as.character(data[,5]))
data[,6]<-as.numeric(as.character(data[,6]))
data[,7]<-as.numeric(as.character(data[,7]))
data[,8]<-as.numeric(as.character(data[,8]))
data[,9]<-as.numeric(as.character(data[,9]))


#starts of plots

#plot 1
hist(data$Global_active_power,xlab="Global Active Power (kilowatts)",ylim = c(0,1200),xaxp = c(0,6,3), col = "red")
title(main= "Global Active Power")

#plot 2
plot(data$datetimepos,data$Global_active_power,ylab ="Global Active Power (kilowatts)",xlab= "", type = "l")

#plot 3
plot(data$datetimepos,data$Sub_metering_1,ylim = c(0,40),ylab ="Energy sub metering",xlab= "", type = "n")
points(data$datetimepos,data$Sub_metering_1,col = "black", type = "l")
points(data$datetimepos,data$Sub_metering_2, col = "red", type = "l")
points(data$datetimepos,data$Sub_metering_3, col = "blue", type = "l")
legend("topright", lty = 1, col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


#plot 4

par(mfrow = c(2,2))
with(data, {
      plot(data$datetimepos,data$Global_active_power,ylab ="Global Active Power (kilowatts)",xlab= "", type = "l")
      plot(data$datetimepos,data$Voltage, col = "black", type = "l",xlab = "datetime", ylab = "Voltage")
      plot(data$datetimepos,data$Sub_metering_1,ylab ="Energy sub metering",xlab= "", type = "n")
      points(data$datetimepos,data$Sub_metering_1,col = "black", type = "l")
      points(data$datetimepos,data$Sub_metering_2, col = "red", type = "l")
      points(data$datetimepos,data$Sub_metering_3, col = "blue", type = "l")
      legend("topright", lty = 1, bty = "n", col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
      plot(data$datetimepos,data$Global_reactive_power, col = "black", type = "l",xaxp = c(0,0.5,5),xlab = "datetime", ylab = "Global_reactive_power", cex.axis = 0.9)
})
