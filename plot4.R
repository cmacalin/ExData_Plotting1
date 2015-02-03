plot4 <- function() {
  # Assume user is in desired working directory, and that 
  # data files were downloaded and unzipped
  
  # Read table
  df <- data.frame(read.table("household_power_consumption.txt", header=TRUE, sep=";"))
  
  # Subset by the desired dates
  df <- df[(df$Date == "1/2/2007" | df$Date == "2/2/2007"),]
  
  # datetime axis
  dates <- as.Date(as.character(df$Date), "%d/%m/%Y")
  days <- format(dates, "%a")
  times <- paste(dates, df$Time, sep=" ")
  complete_times <- strptime(times, format="%Y-%m-%d %H:%M:%S")
  
  # Needed data conversions to numeric
  active_power <- as.numeric(as.character(df$Global_active_power))
  voltage <- as.numeric(as.character(df$Voltage))
  Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
  Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
  Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))
  reactive_power <- as.numeric(as.character(df$Global_reactive_power))
  
  # Create .png file
  png(file="plot4.png", width=480, height=480)
  par(mfrow=c(2,2), mar=c(4.5,4.5,4.5,4.5), cex.axis=0.75, cex.lab=0.75)
  
  # Plot 1
  plot(complete_times, active_power, ylab="Global Active Power", xlab="", type="l")
  
  # Plot 2
  plot(complete_times, voltage, ylab="Voltage", xlab="datetime", type="l", ylim=c(234,246))
  
  # Plot 3
  plot(complete_times, Sub_metering_1, type="l",ylab="Energy sub metering", xlab="")
  lines(complete_times, Sub_metering_2, type="l", col="red")
  lines(complete_times, Sub_metering_3, type="l", col="blue")
  legend('topright', legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black","red","blue"), pt.cex=1, cex=.75, bty="n")
  
  # Plot 4
  plot(complete_times, reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l")
  
  dev.off()
}