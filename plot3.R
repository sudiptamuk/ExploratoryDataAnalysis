plot3 <- function() {
        ##This program assumes the input text file is in the same directory as 
        ##the plot1 program file. Otherwise we have to set the working 
        ##directory with setwd(<folder name>) command.
        
        ##Read the data from input text file.
        powerdata <- read.csv2("household_power_consumption.txt");
        
        ##select the required subset of data.
        selectedData <- powerdata[powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007", ];
        
        ##select the required columns
        selectedColumns <- selectedData[, c("Date", 
                                            "Time", 
                                            "Global_active_power",
                                            "Sub_metering_1", 
                                            "Sub_metering_2", 
                                            "Sub_metering_3")];
        
        ##Modify the data type into characer.
        selectedColumns <- data.frame(lapply(selectedColumns, as.character), stringsAsFactors = FALSE)
        
        ##Create a new column with combined date time
        selectedColumns$DateTime <- paste(selectedColumns$Date, 
                                          selectedColumns$Time, sep=" ");
        
        ##Convert the new date time column into date time type
        selectedColumns$DateTime <- strptime(
                paste(selectedColumns$Date, 
                      selectedColumns$Time, sep=" "), "%d/%m/%Y %H:%M:%S");
        
        plot_colors <- c("black","red","blue");
        
        par(mar=c(3.2, 3.8, 0.2, 0.2));
        ##Set the plot png file.
        png(file = "plot3.png"); 

        plot(selectedColumns$DateTime, selectedColumns$Sub_metering_1,
                type="l", xlab="", ylab="Energy sub metering");
        
        lines(selectedColumns$DateTime, selectedColumns$Sub_metering_2,
              type="l", col=plot_colors[2]);
        
        lines(selectedColumns$DateTime, selectedColumns$Sub_metering_3,
              type="l", col=plot_colors[3]);
        
        legend("topright", legend = c(
                "Sub_metering_1",
                "Sub_metering_2",
                "Sub_metering_3"
                
        ), col = plot_colors, lty=c(1,1));
 
        ##Shut down the png device.
        dev.off(which = dev.cur());
}