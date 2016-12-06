##
## exploratory-data-analysis - Course Project Requirements
##
## 
## For each plot you should
## 
## 1) Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
## 2) Name each of the plot files as plot1.png, plot2.png, etc.
## 3) Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot, i.e. code in plot1.R constructs the plot1.png plot.
## 4) Your code file should include code for reading the data so that the plot can be fully reproduced.
## 5) You must also include the code that creates the PNG file.
## 6) Add the PNG file and R code file to the top-level folder of your git repository (no need for separate sub-folders)
## 7) When you are finished with the assignment, push your git repository to GitHub so that the GitHub version of your repository is up to date.
##
## There should be four PNG files and four R code files, a total of eight files in the top-level folder of the repo.
## 

## Prior to running the program, I have:
## 1) downloaded the file https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## 2) extracted the contents of the zip file (it is a file named household_power_consumption.txt)
## 3) set my R session's working directory to that folder


## load data from file in the working directory
HPC<-read.delim("household_power_consumption.txt",header=TRUE,sep=";")

## I'm only setting the Date2 for now as 'll have fewer rows to update later once I use this one to filter the graphing data set
HPC$Date2 <- as.Date(HPC$Date,"%d/%m/%Y")

## create a smaller list from which to generate the graphs, getting only those for 2007/02/01 and 2007/02/02
HPC2<-subset(HPC,Date2 == "2007-02-01" | Date2 == "2007-02-02")

## create a numeric column -required by hist()- from the factor Global_active_power
HPC2$GAP2 <- as.numeric(as.character(HPC2$Global_active_power))


## Set up the multiple plot frame
par(mfrow = c(2, 2)) # , mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0), lwd = 4)

##
## Panel (1,1) line chart , x-axis label = "Global Active Power (kilowatts)", y-axis label = "Frequency", color is red, 
##

## create a single sortable value to ensure date AND time are used to properly plot the data
HPC2$DateTime <- strptime(paste(as.character(HPC2$Date2), as.character(HPC2$Time)),  "%Y-%m-%d %H:%M:%S")

## plot the data
with(HPC2,plot(DateTime, as.numeric(as.character(HPC2$Global_active_power)), main="", xlab = "", ylab = "Global Active Power (kilowatts)", type = "b", lwd = 1, pch = ".", cex.lab=0.75, cex.axis=0.75))


##
## Panel (1,2) - plot, x-axis values = days of week, x-axis label = "datetime", y-axis label = "Voltage"
##

with(HPC2,plot(DateTime, as.numeric(as.character(HPC2$Voltage)), main="", xlab = "datetime", ylab = "Voltage", type = "b", pch = ".", cex.lab=0.75, cex.axis=0.75))

##
## Panel (2,1) - 3 value plot, x-axis values = days of week, y-axis label = "Energy sub metering"
##

## plot the data
with(HPC2,plot(DateTime, as.numeric(as.character(Sub_metering_1)), main="", xlab = "", ylab = "Energy sub metering", type = "b", pch = ".", cex.lab=0.75, cex.axis=0.75))
with(HPC2,lines(DateTime, as.numeric(as.character(Sub_metering_2)), col = "red"))
with(HPC2,lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", lty=c(1,1,1), lwd=c(1,1,1), col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


##
## Panel (2,2) - plot, x-axis values = days of week, x-axis label = "datetime", y-axis label = "Global_reactive_power"
##

with(HPC2,plot(DateTime, as.numeric(as.character(HPC2$Global_reactive_power)), main="", xlab = "datetime", ylab = "Global_reactive_power", type = "b", pch = ".")) # , cex.lab=0.75, cex.axis=0.75))

## write it out to the PNG device (file)
dev.copy(png, file = "plot4.png",width=480,height=480)
dev.off()
