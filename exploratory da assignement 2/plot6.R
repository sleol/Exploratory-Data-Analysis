
require(ggplot2)
setwd("C:/Users/groyde/Documents/datasciencecoursera/exploratory da assignement 2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

setwd("C:/Users/groyde/Documents/datasciencecoursera")

years<-unique(NEI$year)


#Question 6

png("C:/Users/groyde/Documents/datasciencecoursera/exploratory da assignement 2/plot6.png")

data<-merge(NEI,SCC, by = "SCC")
Bdata<-data[data$fips == "24510",]
Bmotor<-Bdata[grepl("Vehicles",Bdata$EI.Sector),]
BmTot<-rowsum(Bmotor$Emissions, Bmotor$year)

LAdata<-data[data$fips == "06037",]
LAmotor<-LAdata[grepl("Vehicles",LAdata$EI.Sector),]
LAmTot<-rowsum(LAmotor$Emissions, LAmotor$year)

par(mfrow = c(2,1))
with(data, {
      plot(years,BmTot)
      plot(years,LAmTot)
})


dev.off()
