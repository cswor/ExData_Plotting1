# Exploratory Data Analysis : Week 1 Peer Assessment Assignment
# get data together
setwd("C:/Users/carl/coursera_jh_ds/Month4/Week1/ExData_Plotting1")
s <- read.csv("C:/Users/carl/coursera_jh_ds/Month4/household_power_consumption.txt",sep = ";"
              , na.strings = "?")
s1 <- s[complete.cases(s), ]
s1$DateTime <-  as.POSIXct(paste(s1$Date,s1$Time),format="%d/%m/%Y %H:%M:%S")
s3 <- dplyr::filter(s1, DateTime >= "2007-02-01", DateTime < "2007-02-03")

# plot1
#windows()
png(filename = "plot1.png", width = 480, height = 480)
hist( s3$Global_active_power, freq = TRUE, col = "red", xlab = "Global Active Power",
      main = "Global Active Power")

dev.off()

# plot2
#windows()
png(filename = "plot2.png", width = 480, height = 480)
plot(s3$Global_active_power ~ s3$DateTime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()
# plot3
#windows()
png(filename = "plot3.png", width = 480, height = 480)
plot(s3$Sub_metering_1 ~ s3$DateTime,type = "l", ylim = c(0,30), col = "black", xlab = "", ylab = "Energy Sub Metering")
lines(s3$Sub_metering_2 ~ s3$DateTime, type = "l",ylim = c(0,30), col = "red")
lines(s3$Sub_metering_3 ~ s3$DateTime, type = "l", ylim = c(0,30), col = "blue")
legend(x = "topright", legend=c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"),
       col=c("black", "red", "blue"), lty=c(1,1,1), border = FALSE)

dev.off()
# plot4
#windows()

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(s3$Global_active_power ~ s3$DateTime, type = "l", col = "black",
     main= "", xlab = "", ylab = "Global Active Power")
plot(s3$Voltage ~ s3$DateTime, type = "l", ylab = "Voltage", xlab = "datetime")
plot(s3$Sub_metering_1 ~ s3$DateTime,type = "l", ylim = c(0,30), col = "black", xlab = "", ylab = "Energy Sub Metering")
lines(s3$Sub_metering_2 ~ s3$DateTime, type = "l",ylim = c(0,30), col = "red")
lines(s3$Sub_metering_3 ~ s3$DateTime, type = "l", ylim = c(0,30), col = "blue")
legend(x = "topright", legend=c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"),
       col=c("black", "red", "blue"), lty=c(1,1,1), cex=0.8)
plot(s3$Global_reactive_power ~ s3$DateTime, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()
