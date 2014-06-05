
library(data.table)

# read file into R

data <-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=F,colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'),na.strings="?")

# format and subset 
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
df <- subset(data,data$Date=="2007-02-01"|data$Date=="2007-02-02")
require("lubridate")
df$Dt <- ymd_hms(paste(df$Date, df$Time, sep = "_"))

# plot 4 

p1 <-df$Global_active_power
p2 <-df$Dt
p3 <-df$Voltage
p31 <- df$ Sub_metering_1
p32 <- df$ Sub_metering_2
p33 <- df$ Sub_metering_3
p4 <- df$Global_reactive_power

png(filename="plot4.png", width=480, height=480, units="px",bg = "transparent" )
par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))
plot(p2,p1,type="l",ylab="Global Active Power",xlab="")
plot(p2,p3,type="l",xlab="datetime",ylab="Voltage")
plot (df$Dt,p31,type="l",xlab="",ylab="Energy sub metering") 
lines(df$Dt,p32,col="red") 
lines(df$Dt,p33,col="blue") 
legend("topright",lty=1,lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n")
plot(p2,p4,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()
