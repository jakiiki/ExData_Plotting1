
##Set working directory and read data into data frame
setwd("~/exdata_data_household_power_consumption")
power.data<-read.csv("~/exdata_data_household_power_consumption/household_power_consumption.txt", sep=";", 
                     header=TRUE, stringsAsFactors = FALSE, na.strings="?")

##Reformat date and time values
power.data$Date<-as.Date(power.data$Date,format="%d/%m/%Y", na.strings="?")
power.data$datetime <- strptime(paste(power.data$Date, power.data$Time), "%Y-%m-%d %H:%M:%S")

power.data$datetime <- as.POSIXct(power.data$datetime)
power.data$Global_active_power<-as.numeric(power.data$Global_active_power)

##Subset on based on dates of interest
power.data <- subset(power.data, subset =(Date=="2007-02-01"|Date == "2007-02-02"))


##Create plot2 and save it to file
attach(power.data)

plot(power.data$datetime, power.data$Global_active_power, type="l",
ylab = "Global Active Power (kilowatts)", xlab = "")

dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
detach(power.data)
