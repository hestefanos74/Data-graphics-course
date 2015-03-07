zxc <- read.table("household_power_consumption.txt", sep = ";", colClasses = "character")
colnames(zxc) <- zxc[1, ]
zxc <- zxc[-1, ]
row.names(zxc) <- 1: nrow(zxc)
asd <- zxc[which(zxc$Date == "1/2/2007"),]
asd2 <- zxc[which(zxc$Date == "2/2/2007"),]
qwe <- rbind(asd, asd2)
mjk <- as.POSIXct(paste(qwe$Date, qwe$Time), format="%d/%m/%Y %H:%M:%S")
par(mfrow = c(2, 2))
par(mar = c(4,4,2,1))
with(qwe, {
  plot(mjk, qwe$Global_active_power,xlab = "", ylab = "Global Active Power", type = "l", cex.lab = 0.75, cex.axis =0.7, mar = c(0,0,0,0))
  plot(mjk, qwe$Voltage, xlab = "datetime", ylab = "Voltage", type = "l", cex.lab = 0.75, cex.axis =0.7, mar = c(0,0,0,0) )
  plot(mjk, qwe$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", , cex.lab = 0.75, cex.axis =0.7, mar = c(0,0,1,0))
  lines(mjk, qwe$Sub_metering_2, type = "l", col = "red" )
  lines(mjk, qwe$Sub_metering_3, type = "l", col = "blue")
  legend("topright", col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = "solid", cex = 0.45 , text.font = 3, bty = "n", y.intersp = 0.65)
  plot(mjk, qwe$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power" , type = "l", cex.lab = 0.75, cex.axis =0.7, mar = c(0,0,1,0) )
})
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()