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
png(file = "plot2.png", width = 480, height = 480)
with(filteredData, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()
