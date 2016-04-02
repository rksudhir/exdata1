setwd("C:/Users/sudhir.kamat/Documents/0SK/CourseraR/00DataScience/04 Exploratory Data Analysis/Week1/exdata")
g <- rnorm(100000)
h <- rep(NA, 100000)
ptm <- proc.time()
df <- read.csv("household_power_consumption.txt", sep=";", colClasses =c("character","character","numeric","numeric","numeric","numeric","numeric", "numeric", "numeric"), na.strings= c("?"))

## Extract the data that we need
df2 <- df[df$Date %in% c("1/2/2007", "2/2/2007") ,]
df2$day <- weekdays(as.Date(df2$Date))


df2$timestamp <- with(df2, { format(strptime(paste(as.character(substitute(Date)), as.character(Time)), "%d/%m/%Y %H:%M:%OS"), "%d/%m/%Y %H:%M:%OS") }) # Correct format

plot(x=strptime(df2$timestamp, "%d/%m/%Y %H:%M:%OS"), y=(df2$Global_active_power),  type = "l", xlab="", ylab="Global Active Power (Kilowatts)")


dev.copy(png,'plot2.png', width = 480, height =480)
dev.off()

ptm2 <- proc.time() - ptm