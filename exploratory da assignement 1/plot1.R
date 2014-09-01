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



#plot 1

png("C:/Users/groyde/Documents/datasciencecoursera/plot1.png")

hist(data$Global_active_power,xlab="Global Active Power (kilowatts)",ylim = c(0,1200),xaxp = c(0,6,3), col = "red", main = "Global Active Power" )

dev.off()