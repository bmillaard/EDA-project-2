## This first line will likely take a few seconds. Be patient! 
if(!exists("NEI")){ 
  NEI <- readRDS("C:\\Users\\BZM11\\Documents\\R\\EDA\\CP2\\summarySCC_PM25.rds") 
} 
if(!exists("SCC")){ 
  SCC <- readRDS("C:\\Users\\BZM11\\Documents\\R\\EDA\\CP2\\Source_Classification_Code.rds") 
} 

library(ggplot2)



## How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
## we need to select all the records in Baltimore with the type ON-ROAD 

## first Merge the two datasets

merged <- merge(NEI, SCC, by = 'SCC')

## second filter records for Baltimore (fips 24510) and type equal to ON-ROAD 
motor_balt  <- subset(merged, fips == '24510' & type == 'ON-ROAD')
motor_la 
## Sum total per year for motor_balt
totalyearmotorbalt <- aggregate(Emissions ~ year, motor_balt, sum) 


## create plot 
G <- ggplot(data = totalyearmotorbalt, aes(x=year, y = Emissions)) + 
  geom_line(col = 'red') + geom_point(size = 3, col = 'darkblue') + 
  ggtitle("Emissions from Motor Vehicles in Baltimore")
print(G)



## Save to file
dev.copy(png, file="plot5.png", width=480, height=480) 
dev.off()
