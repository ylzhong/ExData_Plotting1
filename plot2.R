library(data.table)

# read file into R

data <-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=F,
                  colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'),na.strings="?")

# format and subset 
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
df <- subset(data,data$Date=="2007-02-01"|data$Date=="2007-02-02")

# plot

p1 <- df$Global_active_power

require("lubridate")
df$Dt <- ymd_hms(paste(df$Date, df$Time, sep = "_"))
png(filename="plot2.png", width=480, height=480, units="px" )
plot(df$Dt,p1,type="l",ylab="Global Active Power(kilowatts)",xlab="")
dev.off()