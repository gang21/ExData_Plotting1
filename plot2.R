#read data
data <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )

# Create column in table with date and time merged together
FullTimeDate <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data <- cbind(data, FullTimeDate)

# change column classes
data$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
data$Time <- format(powerdata$Time, format="%H:%M:%S")
data$Global_active_power <- as.numeric(powerdata$Global_active_power)
data$Global_reactive_power <- as.numeric(powerdata$Global_reactive_power)
data$Voltage <- as.numeric(powerdata$Voltage)
data$Global_intensity <- as.numeric(powerdata$Global_intensity)
data$Sub_metering_1 <- as.numeric(powerdata$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(powerdata$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(powerdata$Sub_metering_3)

# subset data
subsetdata <- subset(powerdata, Date == "2007-02-01" | Date =="2007-02-02")

#make a plot and save as a png
png("plot2.png", width=480, height=480)
with(subsetdata, plot(FullTimeDate, Global_active_power, type="l", xlab="Day", ylab="Global Active Power (kilowatts)"))
dev.off()