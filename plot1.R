hpc <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                  nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
hpc1 <- subset(hpc, Date %in% c("1/2/2007","2/2/2007"))
hpc1$Date <- as.Date(hpc1$Date, format="%d/%m/%Y")

png(file="Plot1.png",width = 480,height = 480)
hist(hpc1$Global_active_power,xlab="Global Active Power (kilowatts)",ylab = "Frequency",main = "Global Active Power",col="red")
dev.off()