###############################################################
#                                                             #
#      E X P L O R A T O R Y   D A T A   A N A L Y S I S      #
#                                                             #
#        Part-4, Data Science Specialization, Coursera        #
#                                                             #
#            W E E K   O N E   A S S I G N M E N T            #
#                                                             #
#                        solution by                          #
#                                                             #
#                 B H A S K A R   K A M B L E                 #
#                                                             #
###############################################################

plot2 <- function() {

###############################################################
#       P A R T   O N E: getting and cleaning the data        #
#-------------------------------------------------------------#
# The data provides measurements of electric power consumption# 
# with a one-minute sampling rate over a period of almost     #
# four years. The data for only two days: 1st and             #
# 2nd Feb 2007 are required                                   #
###############################################################
#                                                             #
#                                                             #
# data.table is useful for reading large data files.          #
# I have checked that the two dates 01/02/2007 and 02/02/2007 are
# contained entirely within rows 65000 to 70000 of the data...#
# Hence for faster reading let's just read this subset first  #
# instead of the entire data. In the next step we will extract#
# the exact subset for the two given days from this.          #
#                                                             #
library(data.table)                                           #
ini_data <- fread("household_power_consumption.txt",nrows=5000,sep=';',skip=65000,colClasses = c("character","character","character","character","character","character","character","character", "character"))
ini_data <- as.data.frame(ini_data) # convert to data frame   #
#                                                             #
# The 1st column (V1) is the days. Extract the exact subset   #
# so that the date is either 1/2/2007 or 2/2/2007:            #
fin_data <- subset(ini_data,(V1=="1/2/2007")|(V1=="2/2/2007"))#
#                                                             #
# Give proper names to the columns:                           #
names(fin_data) <-c("Date","Time","Global_active_power","Global_reactive_power",
"Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#                                                             #
###############################################################



###############################################################
#               P A R T   T W O: creating plot2.png           #
#-------------------------------------------------------------#
png("plot2.png",width=480,height=480)                         #
xval <- c(1:2880)                                             # no. of rows in fin_data
ticks <- c(1,1440,2880)                                       #
plot(xval,as.numeric(fin_data$Global_active_power),type="l",axes=FALSE,ann=FALSE)
axis(side=1,at=ticks,labels=c("Thu","Fri","Sat"))             #
axis(side=2)                                                  #
title(ylab="Global Active Power (kilowatts)")                 #
box(which="plot",lty="solid")                                 #
dev.off()                                                     #
###############################################################

}
