plot1 <- function() {
        ##This program assumes the input text file is in the same directory as 
        ##the plot1 program file. Otherwise we have to set the working 
        ##directory with setwd(<folder name>) command.
        
        ##Read the data from input text file.
        powerdata <- read.csv2("household_power_consumption.txt");
        
        ##select the required subset of data.
        selectedData <- powerdata[powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007", ];
        
        ##Modify the data type into characer.
        selectedDataChar <- data.frame(lapply(selectedData, as.character), stringsAsFactors = FALSE)
        
        ##Modify the data type into numeric.
        selectedDataNum <- sapply(selectedDataChar$Global_active_power, as.numeric);
        
        ##Set the plot png file.
        png(file = "plot1.png"); 
        
        ##Create the histogram.
        hist(selectedDataNum, main="Global Active Power", xlab="Global Active Power(kilowatts)", col="red");
        
        ##Shut down the png device.
        dev.off(which = dev.cur());
}