##Plot2

## Read household_power_consumption.txt file
## data needed from the dates 2007-02-01 and 2007-02-02
##separator ?
Sys.setlocale("LC_TIME", "English") ##set Days name in english

library(data.table)
consumption<-fread("household_power_consumption.txt",na.strings = "?")
consumption<-consumption[,datetime:=paste(consumption$Date,consumption$Time)]
consumption$Date<-as.Date.character(consumption$Date,"%d/%m/%Y")
start<-as.Date("2007-02-01")
end<- as.Date("2007-02-02")

##subset the file for graphing
graph<-consumption[(consumption$Date>=start)&(consumption$Date<=end),]
##vector with dates for printing
c<-graph$datetime
c<-strptime(c,format="%d/%m/%Y %H:%M:%S")
##conversion of the needed values
graph$Global_active_power<- as.numeric(graph$Global_active_power)
##plot the graph and save it .png
png(file = "plot2.png",width=480,height=480,units="px",bg = "transparent")
plot(c,graph$Global_active_power,type="n", 
     ylab = "Global Active Power (kilowatts)",
     xlab="")
lines(c,graph$Global_active_power, col = "black" )
dev.off()