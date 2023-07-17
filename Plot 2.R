data= read.table("household_power_consumption.txt", sep= ";", skip= 1)
# the variables had to be separated
# also, skipping the first row because it contains actual variable names

names(data)= c("Date", "Time", "Global_active_power", "Global_reactive_power",
               "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
               "Sub_metering_3")


str(data)

data$Global_active_power= as.numeric(data$Global_active_power)

data4plots= filter(data, data$Date== "1/7/2007" | data$Date== "2/7/2007")

library(lubridate)

data4plots$date.time= dmy_hms(paste(data4plots$Date, data4plots$Time))

plot2= plot(data4plots$date.time, data4plots$Global_active_power, type= "l",
            xlab= "", ylab= "Global active power(kilowatts)")


dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
detach(data)

# srp 01= first of july; srp 02= second of july; srp 03= third of july
