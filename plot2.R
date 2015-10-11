plot2 <- function() {
        ##This program assumes the input text file is in the same directory as 
        ##the plot1 program file. Otherwise we have to set the working 
        ##directory with setwd(<folder name>) command.
        
        ##Read the data from input text file.
        powerdata <- read.csv2("household_power_consumption.txt");
        
        ##select the required subset of data.
        selectedData <- powerdata[powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007", ];
        
        ##select the required columns
        selectedColumns <- selectedData[, c("Date", "Time", "Global_active_power")];
             
        ##Modify the data type into characer.
        selectedColumns <- data.frame(lapply(selectedColumns, as.character), stringsAsFactors = FALSE)
        
        ##Create a new column with combined date time
        selectedColumns$DateTime <- paste(selectedColumns$Date, 
                                          selectedColumns$Time, sep=" ");
        
        ##Convert the new date time column into date time type
        selectedColumns$DateTime <- strptime(
                paste(selectedColumns$Date, 
                selectedColumns$Time, sep=" "), "%d/%m/%Y %H:%M:%S");
        
        ##Set the plot png file.
        png(file = "plot2.png"); 
        
        ##plot the graph
        plot(selectedColumns$DateTime, selectedColumns$Global_active_power, 
             type="l", xlab="", ylab="Global Active Power (kilowatts)")
        
        ##Shut down the png device.
        dev.off(which = dev.cur());
}