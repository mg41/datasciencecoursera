pollutantmean <- function(directory, pollutant, id = 1:332) {
    openfile <-function(directory, monitor) {
            if (monitor < 10) {
                c(directory, "/00", monitor, ".csv")
            }
            else if (monitor < 100) {
                c(directory, "/0", monitor, ".csv")
            }
            else {
                c(directory, "/", monitor, ".csv")
            }
    }
    
    pollutantData <- vector("numeric")
    for(monitor in id) {
        filename <- paste(openfile(directory, monitor), collapse="")
        monitorData <- read.csv(filename)
        pollutantData <- c(pollutantData, monitorData[[pollutant]])
    }
    pollutantReadings <- pollutantData[!is.na(pollutantData)]
    mean(pollutantReadings)
}