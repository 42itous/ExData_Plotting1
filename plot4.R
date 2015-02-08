
# What do you do when ghosts of old pieces of code come back to haunt you?
# That's right, copy-paste from yourself!


#Same as previous exercise
data = read.table(file.choose(),header=TRUE,na.strings="?",sep=";")
goodDate = (data[1]=="1/2/2007") | (data[1]=="2/2/2007")


#Same as previous exercise <- I copied this comment as well!!
Sub_metering_1= data[,"Sub_metering_1"][goodDate]
Sub_metering_2= data[,"Sub_metering_2"][goodDate]
Sub_metering_3= data[,"Sub_metering_3"][goodDate]

Global_active_power = as.numeric(data[,"Global_active_power"][goodDate]) #old

Voltage = as.numeric(data[,"Voltage"][goodDate]) #New

Global_reactive_power = as.numeric(data[,"Global_reactive_power"][goodDate]) #New


time = strptime(paste(data[,"Date"][goodDate], data[,"Time"][goodDate],sep="") ,"%d/%m/%Y%H:%M:%S") #old

#Some Variables above have been named such that labelling may later be avoided



rm(data)
rm(goodDate)
goodColors = c("black","red","blue")


png(filename="plot4.png",width=480,height=480,units="px")

    par(mfrow=c(2,2)) #This statement is probably all there is to this exercise. Makes separate (consecutive) plots coexist...

    plot(time,Global_active_power,col="black",ylab="Global Active Power",xlab="",type="l") #Slight Variations in the labelling
    
    plot(time,Voltage,col="black",xlab="datetime",type="l") #New Function

    plot(time,Sub_metering_1,col=goodColors[1],ylab="Energy sub metering",xlab="",type="l")
 
    lines(time,Sub_metering_2,col=goodColors[2])
 
    lines(time,Sub_metering_3,col=goodColors[3])
    
    #various properties had to be changed for the legend so that it shrinks appropriately, doesn't have a border and does not overlap anything
    legend("topright", lty=1, col=goodColors, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),box.col = "transparent", bg="transparent",cex=1)   
    

    plot(time,Global_reactive_power,col="black",xlab="datetime",type="l") #the underscores have been "intentionally" left in the labelling. YOLO!

dev.off()

#One last time, eh?
rm(list=ls())
