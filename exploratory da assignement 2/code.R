
require(ggplot2)
setwd("C:/Users/groyde/Documents/datasciencecoursera/exploratory da assignement 2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

setwd("C:/Users/groyde/Documents/datasciencecoursera")

years<-unique(NEI$year)

#Question 1
yTot<-rowsum(NEI$Emissions,NEI$year)
plot(years,yTot)


#Question 2
Bdata<- NEI[NEI$fips == "24510",]
BTot<-rowsum(Bdata$Emissions,Bdata$year)
plot(years,BTot)


#Question 3 - needs to be done using ggplot 2
Bpoint<-Bdata[Bdata$type == "POINT",]
Bnpoint<-Bdata[Bdata$type == "NONPOINT",]
Broad<-Bdata[Bdata$type == "ON-ROAD",]
Bnroad<-Bdata[Bdata$type == "NON-ROAD",]

a<-rowsum(Bpoint$Emissions, Bpoint$year)
b<-rowsum(Bnpoint$Emissions, Bnpoint$year)
c<-rowsum(Broad$Emissions, Broad$year)
d<-rowsum(Bnroad$Emissions, Bnroad$year)

plot(years,b, type = "n", ylim = c(0,2500))
points(years,a, col = "black", type = "l")
points(years,b, col = "blue", type = "l")
points(years,c, col = "green", type = "l")
points(years,d, col = "red", type = "l")
legend("topright", lty = 1, col = c("black","blue","green", "red"), legend = c("Point", "Non-Point", "Road", "Non-Road"))

#or

data<-merge(NEI,SCC, by = "SCC")
Bdata<-data[data$fips == "24510",]
qplot(year, Emissions,data = Bdata, facets = .~type, geom = c("point","smooth"), method = "lm")


#Question 4

data<-merge(NEI,SCC, by = SCC)
coal<-data[grepl("Coal",data$EI.Sector),]
CTot<-rowsum(coal$Emissions, coal$year)
plot(years,CTot)

#or?
qplot(year, Emissions,data = coal, facets = .~type,geom = c("point","smooth"), method = "lm")

#Question 5 
data<-merge(NEI,SCC, by = "SCC")
Bdata<-data[data$fips == "24510",]
Bmotor<-Bdata[grepl("Vehicles",Bdata$EI.Sector),]
BmTot<-rowsum(Bmotor$Emissions, Bmotor$year)
plot(years,BmTot)


#Question 6
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


