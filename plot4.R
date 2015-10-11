plot4 <- function() {
        ##This program assumes the input text file is in the same directory as 
        ##the plot1 program file. Otherwise we have to set the working 
        ##directory with setwd(<folder name>) command.
        
        ##Read the data from input text file.
        powerdata <- read.csv2("household_power_consumption.txt");
        
        ##select the required subset of data.
        selectedData <- powerdata[powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007", ];
        
        ##Modify the data type into characer.
        selectedData <- data.frame(lapply(selectedData, as.character), stringsAsFactors = FALSE)
        
        ##Create a new column with combined date time
        selectedData$DateTime <- paste(selectedData$Date, 
                                       selectedData$Time, sep=" ");
        
        ##Convert the new date time column into date time type
        selectedData$DateTime <- strptime(
                paste(selectedData$Date, 
                      selectedData$Time, sep=" "), "%d/%m/%Y %H:%M:%S");
        
        plot_colors <- c("black","red","blue");
        
        png(file = "plot4.png"); 
        
        par(mfrow= c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0));
        ##Set the plot png file.
        ##--------------------First Plot-----------------------------------------
        ##Modify the data type into characer.
        plot(selectedData$DateTime, selectedData$Global_active_power, 
             type="l", xlab="", ylab="Global Active Power");
        ##-----------------------------------------------------------------
        ##-------------------Second plot----------------------------------
        plot(selectedData$DateTime, selectedData$Voltage, 
             type="l", xlab="datetime", ylab="Voltage");                
        ##-----------------------------------------------------------------
        ##--------------------Third plot-----------------------------------
                
        plot(selectedData$DateTime, selectedData$Sub_metering_1,
             type="l", xlab="", ylab="Energy sub metering");
        
        lines(selectedData$DateTime, selectedData$Sub_metering_2,
              type="l", col=plot_colors[2]);
        
        lines(selectedData$DateTime, selectedData$Sub_metering_3,
              type="l", col=plot_colors[3]);
        
        legend("topright", legend = c(
                "Sub_metering_1",
                "Sub_metering_2",
                "Sub_metering_3"
                
        ), col = plot_colors, lty=c(1,1), bty = "n");
        ##-----------------------------------------------------------------
        ##------------------fourth plot-----------------------------------
        plot(selectedData$DateTime, selectedData$Global_reactive_power, 
             type="l", xlab="datetime", ylab="Global_reactive_power");       
        ##-----------------------------------------------------------------
        ##
        
        ##Shut down the png device.
        dev.off();
}