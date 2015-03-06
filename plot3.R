fileUrl <- "household_power_consumption.txt"
colClasses <- c("character","character",rep("numeric",7))
dtFormat <- "%Y-%m-%d"
dtRange <- c(as.Date("2007-02-01",format=dtFormat),as.Date("2007-02-02",format=dtFormat))
lineLabels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")

DT <- read.table(fileUrl, header=TRUE,sep=";",na.strings="?",colClasses=colClasses)
DT$Time <- strptime(paste(DT$Date,DT$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")
DT$Date <- as.Date(DT$Date,format="%d/%m/%Y")
subDT <- subset(DT, Date %in% dtRange)

g <- gl(3,nrow(subDT),labels= lineLabels)
x <- rep(subDT$Time,3)
y <- c(subDT$Sub_metering_1,subDT$Sub_metering_2,subDT$Sub_metering_3)

png(filename="plot3.png")
plot(x,y, type="n", ylab="Energy sub metering",xlab="")
points(x[g == "Sub_metering_1"],y[g == "Sub_metering_1"],col="BLACK",type="l")
points(x[g == "Sub_metering_2"],y[g == "Sub_metering_2"],col="RED",type="l")
points(x[g == "Sub_metering_3"],y[g == "Sub_metering_3"],col="BLUE",type="l")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("BLACK","RED","BLUE"),lty=1)
dev.off()
