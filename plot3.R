hpc <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                  nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
hpc1 <- subset(hpc, Date %in% c("1/2/2007","2/2/2007"))
hpc1$Date <- as.Date(hpc1$Date, format="%d/%m/%Y")
dateandtime<-paste(as.Date(hpc1$Date),hpc1$Time)
hpc1$dateandtime<-as.POSIXct(dateandtime)

png(file="Plot3.png",width = 480,height = 480)
with(hpc1,
     {plot(dateandtime,Sub_metering_1,type="l",col="black",
           xlab="",ylab = "Energy sub metering")
          lines(Sub_metering_2~dateandtime,col="red")
          lines(Sub_metering_3~dateandtime,col="blue")
     })
legend("topright",col=c("black","red","blue"),lty=1,lwd=2,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
