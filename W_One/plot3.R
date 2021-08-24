library(dplyr)
library(lubridate)
rm(list = ls())

# 1. LOADING DATA
setwd("*")  # * =  set the working directory on the folder which the set was downloaded
House_Con <- read.csv2('./household_power_consumption.txt')

House_Con$Date                  <- dmy(House_Con$Date)
House_Con_20170201 <- subset(House_Con, Date >= "2007-02-01" & Date <= "2007-02-02")

House_Con_20170201$Date_Time <- paste0(House_Con_20170201$Date," ",House_Con_20170201$Time)
House_Con_20170201$Date_Time <- ymd_hms(House_Con_20170201$Date_Time)

House_Con_20170201$Global_active_power   <- as.numeric(House_Con_20170201$Global_active_power   )
House_Con_20170201$Global_reactive_power <- as.numeric(House_Con_20170201$Global_reactive_power )
House_Con_20170201$Voltage               <- as.numeric(House_Con_20170201$Voltage               )
House_Con_20170201$Global_intensity      <- as.numeric(House_Con_20170201$Global_intensity      )
House_Con_20170201$Sub_metering_1        <- as.numeric(House_Con_20170201$Sub_metering_1        )
House_Con_20170201$Sub_metering_2        <- as.numeric(House_Con_20170201$Sub_metering_2        )
House_Con_20170201$Sub_metering_3        <- as.numeric(House_Con_20170201$Sub_metering_3        )

# Plot 3

png("plot3.png", width=480, height=480)
with(House_Con_20170201, 
     plot(Date_Time, 
          Sub_metering_1, 
          type = 'l',
          ylab = "Energy sub netering",
          xlab = " "))
with(House_Con_20170201, 
     points(Date_Time, 
            Sub_metering_2, 
            type = 'l', 
            xlab = " ",
            col = "red"))
with(House_Con_20170201, 
     points(Date_Time, 
            Sub_metering_3, 
            type = 'l', 
            xlab = " ",
            col = "blue"))
legend("topright",lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
