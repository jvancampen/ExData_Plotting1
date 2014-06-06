#Programmer: James Van Campen
#Class: Exploratory Data Analysis
#Assignment: 1
#Plot: 1
setwd("C:\\Users\\liberty\\Documents\\James\\Exploratory_Data_Analysis")

#Download, unzip, and read into R 
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL,".\\hpc.zip")
unzip(".\\hpc.zip")
hpc <- read.table(".\\household_power_consumption.txt",header=T,sep=";",colClasses=c("character"))

#Covert dates to date class and subset data
hpc$Date <- as.Date(hpc$Date,"%d/%m/%Y")
hpc <- hpc[hpc$Date > "2007-01-31" & hpc$Date < "2007-02-03",]

#Covert global active power to numeric class and create histogram
setwd("C:\\Users\\liberty\\Documents\\James\\Exploratory_Data_Analysis\\ExData_Plotting1")
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)

png(".\\Plot1.png")
hist(hpc$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", col="Red")
dev.off()

