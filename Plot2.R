#Programmer: James Van Campen
#Class: Exploratory Data Analysis
#Assignment: 1
#Plot: 2
setwd("C:\\Users\\liberty\\Documents\\James\\Exploratory_Data_Analysis\\ExData_Plotting1")

#Download, unzip, and read into R 
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL,".\\hpc.zip")
unzip(".\\hpc.zip")
hpc <- read.table(".\\household_power_consumption.txt",header=T,sep=";",colClasses=c("character"))

#Create datetime variable and subset file
hpc$dt <- paste(hpc$Date,hpc$Time)
hpc$dt <- strptime(hpc$dt,"%d/%m/%Y %H:%M:%S")
# hpc$Date <- as.Date(hpc$Date,"%d/%m/%Y")
hpc <- hpc[as.Date(hpc$dt) > "2007-01-31" & as.Date(hpc$dt) < "2007-02-03",]

#Covert global active power to numeric class and create plot
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)

png(".\\Plot2.png")
plot(hpc$dt,hpc$Global_active_power,type="l",xlab="", ylab="Global Active Power (kilowatts)")
dev.off()






