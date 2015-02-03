plot3 <- function() {
  # Assume user is in desired working directory, and that 
  # data files were downloaded and unzipped
  
  # Read table
  df <- data.frame(read.table("household_power_consumption.txt", header=TRUE, sep=";"))
  
  # Subset by the desired dates
  df <- df[(df$Date == "1/2/2007" | df$Date == "2/2/2007"),]
  
  # Convert values
  dates <- as.Date(as.character(df$Date), "%d/%m/%Y")
  days <- format(dates, "%a")
  times <- paste(dates, df$Time, sep=" ")
  complete_times <- strptime(times, format="%Y-%m-%d %H:%M:%S")
  
  Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
  Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
  Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))
  
  # Create .png file
  png(file="plot3.png", width=480, height=480)
  par(mar=c(4.5,4.5,2,7),cex.axis=0.75, cex.lab=0.75)
  plot(complete_times, Sub_metering_1, type="l",ylab="Energy sub metering", xlab="")
  lines(complete_times, Sub_metering_2, type="l", col="red")
  lines(complete_times, Sub_metering_3, type="l", col="blue")
  legend('topright', legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black","red","blue"), pt.cex=1, cex=.75)
  dev.off()
}