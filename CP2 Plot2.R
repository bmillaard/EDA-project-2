## This first line will likely take a few seconds. Be patient! 
if(!exists("NEI")){ 
  NEI <- readRDS("C:\\Users\\BZM11\\Documents\\R\\EDA\\CP2\\summarySCC_PM25.rds") 
} 
if(!exists("SCC")){ 
  SCC <- readRDS("C:\\Users\\BZM11\\Documents\\R\\EDA\\CP2\\Source_Classification_Code.rds") 
} 


## Have total emissions from PM2.5 decreased in the Baltimore City, 
## Maryland () from 1999 to 2008? 
## Use the base plotting system to make a plot answering this question.


## Subset the data for Baltimore, Maryland

subsetBalt <- subset(NEI,fips == "24510")

## Sum total per year for subset
totalyear <- aggregate(Emissions ~ year, subsetBalt, sum) 


## create plot
par(mfrow=c(2,2))
with(totalyear, {
  
  plot(totalyear, type = 'o', main = 'emission at various years', xlab = 'year', ylab = 'PM2.5 Emission', col = 'red') 
  
  barplot(height=totalyear$Emissions, 
          names.arg=totalyear$year, xlab="years", col = c('red'), 
          ylab=expression('total'),
          main=expression('emissions at various years')) 
})


## Save to file
dev.copy(png, file="plot2.png", width=480, height=480) 
dev.off()
