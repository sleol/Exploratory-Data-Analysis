setwd("C:/Users/groyde/Documents/datasciencecoursera/exploratory da assignement 2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

setwd("C:/Users/groyde/Documents/datasciencecoursera")

years<-unique(NEI$year)


#Question 2


png("C:/Users/groyde/Documents/datasciencecoursera/exploratory da assignement 2/plot2.png")

Bdata<- NEI[NEI$fips == "24510",]
BTot<-rowsum(Bdata$Emissions,Bdata$year)
plot(years,BTot)

dev.off()


