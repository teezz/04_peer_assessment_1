plot4 <- function() {
        source("getData.R")

        ## Change system local to english to get english week days
        curr_locale <- Sys.getlocale("LC_TIME")
        Sys.setlocale("LC_TIME","en_US.UTF-8")

        ## Generic method for loading source file and reading the relevant content into a data frame
        x <- get_data()

        ## Get only non NA values
        gap <- x$Global_active_power[!is.na(x$Global_active_power)]
        voltage <- x$Voltage[!is.na(x$Voltage)]
        grp <- x$Global_reactive_power[!is.na(x$Global_reactive_power)]
        Sub_metering_1 <- x$Sub_metering_1[!is.na(x$Sub_metering_1)]
        Sub_metering_2 <- x$Sub_metering_2[!is.na(x$Sub_metering_2)]
        Sub_metering_3 <- x$Sub_metering_3[!is.na(x$Sub_metering_3)]


        ## Plot charts directly to png file
        png(file="plot4.png", width=480, height=480)
        par(mfrow = c(2, 2), mar = c(5, 4, 3.3, 2), oma = c(0, 0, 0, 0), cex.lab= 1, cex.axis = 1)
        with(x, {
                plot(x$Time, gap, type = "l", xlab = "", ylab = "Global Active Power")
                plot(x$Time, voltage, type = "l", xlab = "datetime", ylab = "Voltage")
                plot(x$Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
                        lines(x$Time, Sub_metering_2, col="red")
                        lines(x$Time, Sub_metering_3, col="blue")
                        legend("topright",
                                legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                                bty = "n",
                                lty=c(1,1),
                                col=c("black","red","blue"),
                                cex=1
                        )
                plot(x$Time, grp, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
        })

        dev.off()

        ## Reset system locale to default
        Sys.setlocale("LC_TIME",curr_locale)
}