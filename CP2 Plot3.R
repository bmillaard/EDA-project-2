## This first line will likely take a few seconds. Be patient! 
if(!exists("NEI")){ 
  NEI <- readRDS("C:\\Users\\BZM11\\Documents\\R\\EDA\\CP2\\summarySCC_PM25.rds") 
} 
if(!exists("SCC")){ 
  SCC <- readRDS("C:\\Users\\BZM11\\Documents\\R\\EDA\\CP2\\Source_Classification_Code.rds") 
} 

library(ggplot2)

## Of the four types of sources indicated by the  
## (point, nonpoint, onroad, nonroad) variable, which of these four 
## sources have seen decreases in emissions from 1999–2008 for 
## Baltimore City? Which have seen increases in emissions from 1999–2008? 
## Use the ggplot2 plotting system to make a plot answer this question.


## Subset the data for Baltimore, Maryland

subsetBalt <- subset(NEI,fips == "24510")

## Sum total per year for subset per type
totalyeartype <- aggregate(Emissions ~ year + type, subsetBalt, sum) 


## create plot using GGplot2
G <- ggplot(data = totalyeartype, aes(x = year, y = Emissions, col=type)) + 
  geom_line() + geom_point() + ggtitle("Emissions in Baltimore City") 
print(G)

## Save to file
dev.copy(png, file="plot3.png", width=480, height=480) 
dev.off()
