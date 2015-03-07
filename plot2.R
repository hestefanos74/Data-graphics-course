zxc <- read.table("household_power_consumption.txt", sep = ";", colClasses = "character")
colnames(zxc) <- zxc[1, ]
zxc <- zxc[-1, ]
row.names(zxc) <- 1: nrow(zxc)
asd <- zxc[which(zxc$Date == "1/2/2007"),]
asd2 <- zxc[which(zxc$Date == "2/2/2007"),]
qwe <- rbind(asd, asd2)
mjk <- as.POSIXct(paste(qwe$Date, qwe$Time), format="%d/%m/%Y %H:%M:%S")
plot(mjk, qwe$Global_active_power,xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
