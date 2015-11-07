

plot1 <- function() {
        source("getData.R")

        ## Generic method for loading source file and reading the relevant content into a data frame
        x <- get_data()

        ## Get only non NA values
        gap <- x$Global_active_power[!is.na(x$Global_active_power)]

        ## Plot chart directly to png file
        png(file="plot1.png", width=480, height=480)
        hist(gap, main = "Global Activity Power", col = "red", xlab = "Global Activity Power (kilowatts)", cex.lab=1, cex.axis = 1, cex.main = 1)
        
        dev.off()
}