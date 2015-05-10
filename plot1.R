# Read original data set from txt
origData <- read.table("./data/household_power_consumption.txt",header=T, sep=";", stringsAsFactors = FALSE)

# Filter by date
dateRange <- c(as.Date("2007-02-01"),as.Date("2007-02-02"))
filteredData <- origData[as.Date(origData$Date, "%d/%m/%Y") %in% dateRange, ]
    ## use %Y to read 4 digit year, %y is for 2 digit year

# Draw the histogram graph
png(file = "plot1.png", width = 480, height = 480)
hist(as.double(filteredData$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
