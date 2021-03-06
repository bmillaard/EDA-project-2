## This first line will likely take a few seconds. Be patient! 
if(!exists("NEI")){ 
 NEI <- readRDS("C:\\Users\\BZM11\\Documents\\R\\EDA\\CP2\\summarySCC_PM25.rds") 
} 
if(!exists("SCC")){ 
SCC <- readRDS("C:\\Users\\BZM11\\Documents\\R\\EDA\\CP2\\Source_Classification_Code.rds") 
 } 
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?  
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources  
# for each of the years 1999, 2002, 2005, and 2008.

## Sum total emission per year
totalyear <- aggregate(Emissions/100000 ~ year, NEI, sum) 


## Create plot


plot(totalyear, type = 'o', main = 'emission at various years', xlab = 'year', ylab = 'PM2.5 Emission', col = 'red') 




## Saving to file
dev.copy(png, file="plot1.png", width=480, height=480) 
dev.off()

