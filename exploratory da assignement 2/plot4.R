require(ggplot2)
setwd("C:/Users/groyde/Documents/datasciencecoursera/exploratory da assignement 2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

setwd("C:/Users/groyde/Documents/datasciencecoursera")

years<-unique(NEI$year)


#Question 4

png("C:/Users/groyde/Documents/datasciencecoursera/exploratory da assignement 2/plot4.png")

data<-merge(NEI,SCC, by = SCC)
coal<-data[grepl("Coal",data$EI.Sector),]
CTot<-rowsum(coal$Emissions, coal$year)
plot(years,CTot)

dev.off()