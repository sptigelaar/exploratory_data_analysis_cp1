plot2 <- function() {
      # Import data from csv. Expects the csv to be in the working directory.
      HHdata <- read.csv("./household_power_consumption.txt",na.strings="?",header=TRUE,sep=";")
      HHdata$DateTime <- paste(HHdata$Date,HHdata$Time,sep=" ")
      HHdata$DateTime <- strptime(HHdata$DateTime,format="%d/%m/%Y %H:%M:%S")
      DS <- subset(HHdata,as.Date(HHdata$DateTime) > as.Date("2007-01-31"))
      DS <- subset(DS,as.Date(DS$DateTime)<as.Date("2007-02-03"))
      
      ##plot2
      par(mfrow=c(1,1))
      png(filename = "plot2.png")
      plot(DS$DateTime,DS$Global_active_power,type="n",ylab="Global Active Power (kilowatts)",xlab="")
      lines(DS$DateTime,DS$Global_active_power)
      dev.off()     
}