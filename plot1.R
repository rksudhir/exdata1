setwd("C:/Users/sudhir.kamat/Documents/0SK/CourseraR/00DataScience/04 Exploratory Data Analysis/Week1/exdata")
g <- rnorm(100000)
h <- rep(NA, 100000)
# Start the clock!
ptm <- proc.time()

## Read the data file ... as quickly as possible.
df <- read.csv("household_power_consumption.txt", sep=";", colClasses =c("character","character","numeric","numeric","numeric","numeric","numeric", "numeric", "numeric"), na.strings= c("?"))

## Extract the data that we need
df2 <- df[df$Date %in% c("1/2/2007", "2/2/2007") ,]

## Create the histogram
hist(df2$Global_active_power, main="Global Active Power",  xlab="Global Active Power (Kilowatts)", col="red")

## Save the histogram to a PNG file of specified size
dev.copy(png,'plot1.png', width = 480, height =480)
dev.off()

ptm2 <- proc.time() - ptm