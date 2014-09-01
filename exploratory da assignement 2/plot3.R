require(ggplot2)
setwd("C:/Users/groyde/Documents/datasciencecoursera/exploratory da assignement 2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

setwd("C:/Users/groyde/Documents/datasciencecoursera")

years<-unique(NEI$year)

#Question 3

png("C:/Users/groyde/Documents/datasciencecoursera/exploratory da assignement 2/plot3.png")

data<-merge(NEI,SCC, by = "SCC")
Bdata<-data[data$fips == "24510",]
qplot(year, Emissions,data = Bdata, facets = .~type, geom = c("point","smooth"), method = "lm")


dev.off()