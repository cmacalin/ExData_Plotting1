plot1 <- function() {
  # Assume user is in desired working directory, and that 
  # data files were downloaded and unzipped
  
  # Read table
  df <- data.frame(read.table("household_power_consumption.txt", header=TRUE, sep=";"))
  
  # Subset by the desired dates
  df <- df[(df$Date == "1/2/2007" | df$Date == "2/2/2007"),]
  
  # Convert desired value to numeric
  df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
  power <- df$Global_active_power
  
  # Create .png file
  png(file="plot1.png", width=480, height=480)
  par(mar=c(4.5,4.5,2,4), cex.main=0.85)
  hist(power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power", ylim=c(0,1200))
  axis(side=1, at=seq(0, 6, 2), labels=seq(0, 6, 2))
  axis(side=2, at=seq(0, 1200, 200))
  dev.off()
}