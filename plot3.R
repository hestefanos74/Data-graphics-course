zxc <- read.table("household_power_consumption.txt", sep = ";", colClasses = "character")
colnames(zxc) <- zxc[1, ]
zxc <- zxc[-1, ]
row.names(zxc) <- 1: nrow(zxc)
asd <- zxc[which(zxc$Date == "1/2/2007"),]
asd2 <- zxc[which(zxc$Date == "2/2/2007"),]
qwe <- rbind(asd, asd2)
mjk <- as.POSIXct(paste(qwe$Date, qwe$Time), format="%d/%m/%Y %H:%M:%S")
plot(mjk, qwe$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", mar = c(4.1,3.1,2.1,2.1))
lines(mjk, qwe$Sub_metering_2, type = "l", col = "red" )
lines(mjk, qwe$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = "solid", cex = 0.50, text.font = 40, x.intersp = 0.9, y.intersp = 0.6)
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()