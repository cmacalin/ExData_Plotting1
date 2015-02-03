plot2 <- function() {
    # Assume user is in desired working directory, and that 
    # data files were downloaded and unzipped
    
    # Read table
    df <- data.frame(read.table("household_power_consumption.txt", header=TRUE, sep=";"))
    
    # Subset by the desired dates
    df <- df[(df$Date == "1/2/2007" | df$Date == "2/2/2007"),]

    # Convert values
    power <- as.numeric(as.character(df$Global_active_power))
    dates <- as.Date(as.character(df$Date), "%d/%m/%Y")
    days <- format(dates, "%a")
    times <- paste(dates, df$Time, sep=" ")
    complete_times <- strptime(times, format="%Y-%m-%d %H:%M:%S")
    
    # Create .png file
    png(file="plot2.png", width=480, height=480)
    plot(complete_times, power, type="l",ylab="Global Active Power (kilowatts)", xlab="")
    dev.off()
}