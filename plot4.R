plot4 <- function() {
      # Import data from csv. Expects the csv to be in the working directory.
      HHdata <- read.csv("./household_power_consumption.txt",na.strings="?",header=TRUE,sep=";")
      HHdata$DateTime <- paste(HHdata$Date,HHdata$Time,sep=" ")
      HHdata$DateTime <- strptime(HHdata$DateTime,format="%d/%m/%Y %H:%M:%S")
      DS <- subset(HHdata,as.Date(HHdata$DateTime) > as.Date("2007-01-31"))
      DS <- subset(DS,as.Date(DS$DateTime)<as.Date("2007-02-03"))
      
      ##plot4
      png(filename = "plot4.png")
      par(mfrow=c(2,2))
      
      plot(DS$DateTime,DS$Global_active_power,type="n",ylab="Global Active Power",xlab="")
      lines(DS$DateTime,DS$Global_active_power)
      
      plot(DS$DateTime,DS$Voltage,type="n",ylab="Voltage",xlab="datetime")
      lines(DS$DateTime,DS$Voltage)
      
      plot(DS$DateTime,DS$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="")
      lines(DS$DateTime,DS$Sub_metering_1)
      lines(DS$DateTime,DS$Sub_metering_2,col="red")
      lines(DS$DateTime,DS$Sub_metering_3, col="blue")
      legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), lwd=c(2.5,2.5,2.5),col=c("black","blue","red"),bty = "n") 
      
      plot(DS$DateTime,DS$Global_reactive_power,type="n",xlab="datetime")
      lines(DS$DateTime,DS$Global_reactive_power)
      dev.off()
}