# Read original data set from txt
origData <- read.table("./data/household_power_consumption.txt",header=T, sep=";", stringsAsFactors = FALSE)

# Filter by date
dateRange <- c(as.Date("2007-02-01"),as.Date("2007-02-02"))
filteredData <- origData[as.Date(origData$Date, "%d/%m/%Y") %in% dateRange, ]
  ## use %Y to read 4 digit year, %y is for 2 digit year

# Combine date and time to form a new column, and convert to time format
filteredData$DateTime <- strptime(paste(filteredData$Date, filteredData$Time,sep = " "), "%d/%m/%Y %H:%M:%S")

# Draw the histogram graph
Sys.setlocale(,"C")
  ## set system environment to English

png(file = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

with(filteredData, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))
  ## top-left graph
with(filteredData, plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))
  ## top-right graph
with(filteredData, plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Engergy sub metering"))
with(filteredData, points(DateTime, Sub_metering_1, col = "black", type = "l"))
with(filteredData, points(DateTime, Sub_metering_2, col = "red", type = "l"))
with(filteredData, points(DateTime, Sub_metering_3, col = "blue", type = "l"))
legend("topright", lty=1, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.8)
  ## bottom-left graph
with(filteredData, plot(DateTime, Global_reactive_power, type = "l", xlab = "", ylab = "Global_reactive_power"))
  ## bottom-right graph
dev.off()
