## The function temporary loads the source file, unzips it, and reading the relevant data into a data frame
## for further processing in the plot scrips

get_data <- function() {
        library(stringr)

        ## Calculate file size in GB
        filesizeGb <- ((2075259 * 9 * 8)/2^20)/1000
        ## And check if file is to big for local RAM
        try(if(filesizeGb > 2) stop("file size is too large"))
        
        ## Download zip file as temporary file and unzip it
        fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        temp <- tempfile()
        download.file(fileUrl, method = "curl", temp)
        datafile <- unz(temp, "household_power_consumption.txt")
        
        ## Read lines only and get start and linecount
        lines <- readLines(datafile)
        start <- grep("^1/2/2007", lines) ## Adding '^' is important, otherwise also dates with eg. 11 will be collected, '01' will not work
        end <- grep("^2/2/2007", lines)
        linecount <- length(start) + length(end) - 1

        ## Read column names for later assignment
        columnnames <- readLines(datafile, n=1)
        columnnames <- strsplit(columnnames, ";")

        x <- read.csv(datafile, header = TRUE, sep = ";", stringsAsFactors = FALSE, skip = start[1]-1, nrows = linecount, na.strings=c("?","NA"))

        unlink(temp)

        ## Assign column names to data frame        
        colnames(x) <- unlist(columnnames)

        ## convert data and time
        x$Time <- strptime(paste(x$Date, x$Time),format="%d/%m/%Y %H:%M:%S") ## Paste the two character columns first
        x$Date <- as.Date(x$Date, format = "%d/%m/%Y")

        x
}