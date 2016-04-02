setwd("C:/Users/sudhir.kamat/Documents/0SK/CourseraR/00DataScience/04 Exploratory Data Analysis/Week1/exdata")
g <- rnorm(100000)
h <- rep(NA, 100000)
ptm <- proc.time()
df <- read.csv("household_power_consumption.txt", sep=";", colClasses =c("character","character","numeric","numeric","numeric","numeric","numeric", "numeric", "numeric"), na.strings= c("?"))

## Extract the data that we need
df2 <- df[df$Date %in% c("1/2/2007", "2/2/2007") ,]
df2$day <- weekdays(as.Date(df2$Date))

df2$timestamp <- with(df2, { format(strptime(paste(as.character(substitute(Date)), as.character(Time)), "%d/%m/%Y %H:%M:%OS"), "%d/%m/%Y %H:%M:%OS") }) # Correct format

par(mfrow=c(2,2)) 

# First Plot
plot(x=strptime(df2$timestamp, "%d/%m/%Y %H:%M:%OS"), y=(df2$Global_active_power),  type = "l", xlab="", ylab="Global Active Power (Kilowatts)")
###----------------------------------------------------------------------------------------------------------------------------------------------

# Second Plot
plot(x=strptime(df2$timestamp, "%d/%m/%Y %H:%M:%OS"), y=(df2$Voltage),  type = "l", xlab="datetime", ylab="Voltage")

# Third Plot
plot(x=strptime(df2$timestamp, "%d/%m/%Y %H:%M:%OS"), y=df2$Sub_metering_1,type = "l", xlab="", ylab="Energy Sub Metering")  
legend = legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), lwd=c(1.5,1.5, 1.5), col=c("black","blue","red"), cex = 0.5) 
lines(strptime(df2$timestamp, "%d/%m/%Y %H:%M:%OS"), df2$Sub_metering_2,  col="red", type = "l")
lines(strptime(df2$timestamp, "%d/%m/%Y %H:%M:%OS"), df2$Sub_metering_3,  col="blue", type = "l")
###---------------------------------------------------------------------------------------------------------------------------------------------
# Fourth Plot
plot(x=strptime(df2$timestamp, "%d/%m/%Y %H:%M:%OS"), y=(df2$Global_reactive_power),  type = "l", xlab="datetime", ylab="Global_reactive_power")


dev.copy(png,'plot4.png', width = 480, height =480)
dev.off()

ptm2 <- proc.time() - ptm