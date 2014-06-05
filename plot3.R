library(data.table)

# read file into R

data <-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=F,
                  colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'),na.strings="?")

# format and subset 
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
df <- subset(data,data$Date=="2007-02-01"|data$Date=="2007-02-02")
require("lubridate")
df$Dt <- ymd_hms(paste(df$Date, df$Time, sep = "_"))

# for plot 3
p31 <- df$ Sub_metering_1
p32 <- df$ Sub_metering_2
p33 <- df$ Sub_metering_3
png(filename="plot3.png", width=480, height=480, units="px",bg = "transparent" )
plot (df$Dt,p31,type="l",xlab="",ylab="Energy sub metering") 
lines(df$Dt,p32,col="red") 
lines(df$Dt,p33,col="blue") 
legend("topright",lty=1,lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()