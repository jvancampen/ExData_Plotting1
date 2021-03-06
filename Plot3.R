#Programmer: James Van Campen
#Class: Exploratory Data Analysis
#Assignment: 1
#Plot: 3
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

#Covert sub_metering variables to numeric
# hpc$Global_active_power <- as.numeric(hpc$Global_active_power)
hpc$Sub_metering_1 <- as.numeric(hpc$Sub_metering_1)
hpc$Sub_metering_2 <- as.numeric(hpc$Sub_metering_2)
hpc$Sub_metering_3 <- as.numeric(hpc$Sub_metering_3)

png(".\\Plot3.png")
plot(hpc$dt,hpc$Sub_metering_1,type="l",xlab="", ylab="Energy sub metering")
lines(hpc$dt,hpc$Sub_metering_2,type="l",col="Red")
lines(hpc$dt,hpc$Sub_metering_3,type="l",col="Blue")
legend("topright",lty=1,col=c("Black","Red","Blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()



