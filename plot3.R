plot3 <- function() {
        source("getData.R")

        ## Change system local to english to get english week days
        curr_locale <- Sys.getlocale("LC_TIME")
        Sys.setlocale("LC_TIME","en_US.UTF-8")

        ## Generic method for loading source file and reading the relevant content into a data frame
        x <- get_data()

        ## Get only non NA values
        Sub_metering_1 <- x$Sub_metering_1[!is.na(x$Sub_metering_1)]
        Sub_metering_2 <- x$Sub_metering_2[!is.na(x$Sub_metering_2)]
        Sub_metering_3 <- x$Sub_metering_3[!is.na(x$Sub_metering_3)]

        ## Plot chart directly to png file
        png(file="plot3.png", width=480, height=480)
        par(cex.lab= 1, cex.axis = 1)
        with(x, plot(x$Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
        lines(x$Time, Sub_metering_2, col="red")
        lines(x$Time, Sub_metering_3, col="blue")
        legend("topright",
                legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                lty=c(1,1), 
                # lwd=c(2,2), 
                col=c("black","red","blue"),
                cex=1
        )
        
        dev.off()

        ## Reset system locale to default
        Sys.setlocale("LC_TIME",curr_locale)
}