library(data.table)

# read file into R

data <-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=F,
                  colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'),na.strings="?")

# format and subset 
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
df <- subset(data,data$Date=="2007-02-01"|data$Date=="2007-02-02")

# plot

png(filename="plot1.png", width=480, height=480, units="px",bg = "transparent" )
p1 <- df$Global_active_power
hist(p1,ylim=c(0,1200),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()