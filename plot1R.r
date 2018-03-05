
##Set working directory and read data into data frame
setwd("~/exdata_data_household_power_consumption")
power.data<-read.csv("~/exdata_data_household_power_consumption/household_power_consumption.txt", sep=";", 
                     header=TRUE, stringsAsFactors = FALSE, na.strings="?")

##Reformat date and time values
power.data$Date<-as.Date(power.data$Date,format="%d/%m/%Y", na.strings="?")
power.data$datetime <- strptime(paste(power.data$Date, power.data$Time), "%Y-%m-%d %H:%M:%S")

##Subset on based on dates of interest
power.data <- subset(power.data, subset =(Date=="2007-02-01"|Date == "2007-02-02"))


##Create plot1 and save it to file
attach(power.data)
hist(power.data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png", height = 480, width = 480)

detach(power.data)
dev.off()

