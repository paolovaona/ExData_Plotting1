##Plot3

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
graph$Sub_metering_1<- as.numeric(graph$Sub_metering_1)
graph$Sub_metering_2<- as.numeric(graph$Sub_metering_2)
graph$Sub_metering_3<- as.numeric(graph$Sub_metering_3)

##plot the graph and save it .png
png(file = "plot3.png",width=480,height=480,units="px",bg = "transparent")
plot(c,graph$Sub_metering_1,type="n",
     ylab = "Energy sub metering",
     xlab="")
lines(c,graph$Sub_metering_1, col = "black" )
lines(c,graph$Sub_metering_2, col = "red" )
lines(c,graph$Sub_metering_3, col = "blue" )
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),
       lwd=c(1,1,1),
       col= c("black","red","blue"))
dev.off()