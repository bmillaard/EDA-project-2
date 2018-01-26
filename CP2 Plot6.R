## This first line will likely take a few seconds. Be patient! 
if(!exists("NEI")){ 
  NEI <- readRDS("C:\\Users\\BZM11\\Documents\\R\\EDA\\CP2\\summarySCC_PM25.rds") 
} 
if(!exists("SCC")){ 
  SCC <- readRDS("C:\\Users\\BZM11\\Documents\\R\\EDA\\CP2\\Source_Classification_Code.rds") 
} 

library(ggplot2)



## Compare emissions from motor vehicle sources in Baltimore City 
## with emissions from motor vehicle sources in Los Angeles County, California (fips == 06037).
## Which city has seen greater changes over time in motor vehicle emissions?




## filter records for Baltimore (fips 24510), LA (fips 06037) and type equal to ON-ROAD 
motorbaltla <- subset(NEI, fips == '24510' | fips == '06037' & type == 'ON-ROAD')

## Sum the emissions and name the 'fips' 
tbybala <- aggregate(Emissions ~ year + fips, motorbaltla, sum) 
tbybala$fips[tbybala$fips=="24510"] <- "Baltimore, MD" 
tbybala$fips[tbybala$fips=="06037"] <- "Los Angeles, CA" 






## create plot 
 
G <- ggplot(data = tbybala, aes(x=year, y=Emissions, col=fips)) +
  geom_line() + geom_point() +
  ggtitle("Emissions from Motor Vehicles in Baltimore City compared to Los Angeles") 
print(G)


## Save to file
dev.copy(png, file="plot6.png", width=480, height=480) 
dev.off()

