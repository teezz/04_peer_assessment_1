# 04 - Peer Assessment 1
Peer Assessment for course 04: Exploratory Data Analysis

This assignment uses data from the UC Irvine Machine Learning Repository, a popular repository for machine learning datasets. In particular, it uses the “Individual household electric power consumption Data Set” which is available on the web site:

Dataset: Electric power consumption [20Mb] (https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip)

Description: Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.

The following descriptions of the 9 variables in the dataset are taken from the UCI web site:

1. **Date**: Date in format dd/mm/yyyy
2. **Time**: time in format hh:mm:ss
3. **Global_active_power**: household global minute-averaged active power (in kilowatt)
4. **Global_reactive_power**: household global minute-averaged reactive power (in kilowatt)
5. **Voltage**: minute-averaged voltage (in volt)
6. **Global_intensity**: household global minute-averaged current intensity (in ampere)
7. **Sub_metering_1**: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
8. **Sub_metering_2**: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
9. **Sub_metering_3**: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.

## Content
The repository contains files for loading and generating four different plots as well as their plot output in the png files.
All R files have additional explanations to explain the steps. Every plot output is saved directly into a png file with a width of 480 pixels and a height of 480 pixels.

## Usage
### getData.R
Function for all plot files to load, read and prepare the data. The file is included as source in all plot files and is called from there.


### plot1.R
Function for plotting the Global Activity Power and its frequency in a bar chart.

### plot2.R
Function for plotting the Global Activity Power and its gradiant on 2007-02-01 and 2007-02-02. The labels on the axis show the limits of the times (weekdays) being plotted.

### plot3.R
Function for plotting the Energy sub metering 1, 2 and 3 and its gradiant on 2007-02-01 and 2007-02-02. The labels on the axis show the limits of the times (weekdays) being plotted.

### plot4.R
The function combines four plots in one, arranged in two rows and two columns.
In row one: plot1 and a plot of the Voltages and its gradiant on 2007-02-01 and 2007-02-02.
In row two: plot3 and a plot of the Global reactive power and its gradiant on 2007-02-01 and 2007-02-02.