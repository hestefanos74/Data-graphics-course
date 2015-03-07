zxc <- read.table("household_power_consumption.txt", sep = ";", colClasses = "character")
colnames(zxc) <- zxc[1, ]
zxc <- zxc[-1, ]
row.names(zxc) <- 1: nrow(zxc)
asd <- zxc[which(zxc$Date == "1/2/2007"),]
asd2 <- zxc[which(zxc$Date == "2/2/2007"),]
qwe <- rbind(asd, asd2)
dfg <- as.numeric(qwe$Global_active_power)
hist(dfg, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power", mar = c(2.1, 2.1, 2.1, 2.1))
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()