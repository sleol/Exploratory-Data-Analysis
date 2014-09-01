setwd("C:/Users/groyde/Documents/datasciencecoursera/exploratory da assignement 2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

setwd("C:/Users/groyde/Documents/datasciencecoursera")

years<-unique(NEI$year)

#Question 1

png("C:/Users/groyde/Documents/datasciencecoursera/exploratory da assignement 2/plot1.png")

yTot<-rowsum(NEI$Emissions,NEI$year)
plot(years,yTot)

dev.off()

