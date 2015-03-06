library(data.table)
fileUrl <- "household_power_consumption.txt"
colClasses <- c("character","character",rep("numeric",7))
dtFormat <- "%Y-%m-%d"
DT <- read.table(fileUrl, header=TRUE,sep=";",na.strings="?",colClasses=colClasses)
DT$Time <- strptime(paste(DT$Date,DT$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")
DT$Date <- as.Date(DT$Date,format="%d/%m/%Y")
dtRange <- c(as.Date("2007-02-01",format=dtFormat),as.Date("2007-02-02",format=dtFormat))
subDT <- subset(DT, Date %in% dtRange)

png(filename="plot1.png")
hist(subDT$Global_active_power, col="RED",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")
dev.off()


