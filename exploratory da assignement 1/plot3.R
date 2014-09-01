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



#plot 3

png("C:/Users/groyde/Documents/datasciencecoursera/plot3.png")

plot(data$datetimepos,data$Sub_metering_1,ylim = c(0,40),ylab ="Energy sub metering",xlab= "", type = "n")
points(data$datetimepos,data$Sub_metering_1,col = "black", type = "l")
points(data$datetimepos,data$Sub_metering_2, col = "red", type = "l")
points(data$datetimepos,data$Sub_metering_3, col = "blue", type = "l")
legend("topright", lty = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()