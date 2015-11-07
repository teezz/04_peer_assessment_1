plot2 <- function() {
        source("getData.R")

        ## Change system local to english to get english week days
        curr_locale <- Sys.getlocale("LC_TIME")
        Sys.setlocale("LC_TIME","en_US.UTF-8")

        ## Generic method for loading source file and reading the relevant content into a data frame
        x <- get_data()

        ## Get only non NA values
        gap <- x$Global_active_power[!is.na(x$Global_active_power)]

        ## Plot chart directly to png file
        png(file="plot2.png", width=480, height=480)
        par(cex.lab= 1, cex.axis = 1)
        with(x, plot(x$Time, gap, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
 
        dev.off()

        ## Reset system locale to default
        Sys.setlocale("LC_TIME",curr_locale)
}