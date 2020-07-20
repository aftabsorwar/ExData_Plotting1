hpc <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                  nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
hpc1 <- subset(hpc, Date %in% c("1/2/2007","2/2/2007"))
hpc1$Date <- as.Date(hpc1$Date, format="%d/%m/%Y")
dateandtime<-paste(as.Date(hpc1$Date),hpc1$Time)
hpc1$dateandtime<-as.POSIXct(dateandtime)

png(file="Plot4.png",width = 480,height = 480)
par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))
with(hpc1,
     {
          plot(Global_active_power~dateandtime,type="l",
               xlab = "",ylab = "Global Active Power")
          plot(Voltage~dateandtime,type="l",
               xlab = "datetime",ylab = "Voltage")
          plot(dateandtime,Sub_metering_1,type="l",
               col="black",
               xlab="",ylab = "Energy sub metering")
          lines(Sub_metering_2~dateandtime,col="red")
          lines(Sub_metering_3~dateandtime,col="blue")         
          legend("topright",col=c("black","red","blue"),
                 lty=1,lwd=2,bty="n",
                 legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
          plot(Global_reactive_power~dateandtime,type="l",
               xlab="datetime", ylab = "Global Rective Power (kilowatts)")
     })
dev.off()