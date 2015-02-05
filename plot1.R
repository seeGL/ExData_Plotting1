# Coursera - Exploratory Data Analysis course
# Course project 1
#
# Author: seeGL
# Date:  2015-02-13


##Read the data
library(data.table)
#read the input file and grep for regex containing the date range or the word Date (to include header)
data <- fread('grep -E "^((1|2)/2/2007|Date)" household_power_consumption.txt',
              header = TRUE,
              sep = ';',
              na.strings = c("?", "NA"),
              colClasses = c("character",
                             "character",
                             "numeric",
                             "numeric",
                             "numeric",
                             "numeric",
                             "numeric",
                             "numeric",
                             "numeric"
              ),
              data.table = FALSE    #create data.frame not data.table
)
#add dateTime field for nice graph displays
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")


##plot the graph
par(cex = 0.75)    # set text size to smaller
hist(data$Global_active_power,
     col="red",
     breaks = 15,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency"
)

##save the graph to .png file
dev.copy(png, filename="ExData_Plotting1/plot1.png", width=480, height=480)
dev.off()