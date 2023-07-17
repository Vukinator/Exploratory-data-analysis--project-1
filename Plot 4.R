library(tidyverse)

data= read.table("household_power_consumption.txt", sep= ";", skip= 1)

names(data)= c("Date", "Time", "Global_active_power", "Global_reactive_power",
               "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
               "Sub_metering_3")

par(mfcol = c(2, 2), mar = c(4, 4, 3, 2))

with(data4plots, {
  plot(date.time,
       Global_active_power, 
       type = "l",
       ylab = "Global Active Power",
       xlab = "")
  plot(date.time,
       Sub_metering_1, 
       type = "l",
       ylab = "Energy sub metering",
       xlab = "")
  lines(date.time,
        Sub_metering_2, 
        type = "l",
        col = "red")
  lines(date.time,
        Sub_metering_3, 
        type = "l",
        col = "blue")
  legend("topright", 
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         col = c("black", "red", "blue"),
         lty = c(1, 1, 1),
         bty = "n")
  plot(date.time,
       Voltage, 
       type = "l",
       ylab = "Voltage")
  plot(date.time,
       Global_reactive_power, 
       type = "l")
})

dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()