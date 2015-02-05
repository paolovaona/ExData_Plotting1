##Plot1

## Read household_power_consumption.txt file
## data needed from the dates 2007-02-01 and 2007-02-02
##separator ?
library(data.table)
consumption<-fread("household_power_consumption.txt",na.strings = "?")

consumption$Date<-as.Date.character(consumption$Date,"%d/%m/%Y")
start<-as.Date("2007-02-01")
end<- as.Date("2007-02-02")
##subset the file for graphing
graph<-consumption[(consumption$Date>=start)&(consumption$Date<=end),]
##conversion of the needed values
graph$Global_active_power<- as.numeric(graph$Global_active_power)
##plot the graph and save it .png
png(file = "plot1.png",width=480,height=480,units="px",bg = "transparent")
hist(x = graph$Global_active_power,
     xlab = "Global Active Power (kilowatts)",
     col = "red",
     main = "Global Active Power")
dev.off()

