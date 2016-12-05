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


#library(data.table)
#library(dplyr)

## Plot #1 - histogram, x-axis label = "Global Active Power (kilowatts)", y-axis label = "Frequency", color is red, 

HPC<-read.delim("household_power_consumption.txt",header=TRUE,sep=";")

HPC$Date2 <- as.Date(HPC$Date,"%d/%m/%Y")

HPC2<-subset(HPC,Date2 == "2007-02-01" | Date2 == "2007-02-02")


HPC2$GAP2 <- as.numeric(as.character(HPC2$Global_active_power))

hist(HPC2$GAP2,col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)" )

## I was using copy.
png(file="plot1.png",width=480,height=480)
hist(HPC2$GAP2,col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)" )

dev.off()

