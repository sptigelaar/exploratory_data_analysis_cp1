plot1 <- function() {
      # Import data from csv. Expects the csv to be in the working directory.
      HHdata <- read.csv("./household_power_consumption.txt",na.strings="?",header=TRUE,sep=";")
      HHdata$DateTime <- paste(HHdata$Date,HHdata$Time,sep=" ")
      HHdata$DateTime <- strptime(HHdata$DateTime,format="%d/%m/%Y %H:%M:%S")
      DS <- subset(HHdata,as.Date(HHdata$DateTime) > as.Date("2007-01-31"))
      DS <- subset(DS,as.Date(DS$DateTime)<as.Date("2007-02-03"))
      
      ##plot1
      par(mfrow=c(1,1))
      png(filename = "plot1.png")
      hist(DS$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")
      dev.off()     
}