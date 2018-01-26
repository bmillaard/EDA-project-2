## This first line will likely take a few seconds. Be patient! 
if(!exists("NEI")){ 
  NEI <- readRDS("C:\\Users\\BZM11\\Documents\\R\\EDA\\CP2\\summarySCC_PM25.rds") 
} 
if(!exists("SCC")){ 
  SCC <- readRDS("C:\\Users\\BZM11\\Documents\\R\\EDA\\CP2\\Source_Classification_Code.rds") 
} 

library(ggplot2)



## Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

## we need to select all the records that contain 'coal' in Short.Name

## first Merge the two datasets

merged <- merge(NEI, SCC, by = 'SCC')

## second filter records that contain 'coal' in Short.Name 
coal  <- grepl("coal", merged$Short.Name, ignore.case=TRUE)

subsetmerged <- merged[coal, ]


## Sum total per year for subset per type
totalyearmerge <- aggregate(Emissions ~ year, subsetmerged, sum) 


## create plot 
G <- ggplot(data = totalyearmerge, aes(x=year, y = Emissions)) + 
  geom_line(col = 'red') + geom_point(size = 3, col = 'darkblue') + 
  ggtitle("Emissions from Coal Sources in the US")
print(G)



## Save to file
dev.copy(png, file="plot4.png", width=480, height=480) 
dev.off()
