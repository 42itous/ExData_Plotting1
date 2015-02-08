# Silent treatment for you on this one.
data = read.table(file.choose(),header=TRUE,na.strings="?",sep=";")
# Just Kidding. I would never do that to you.

goodDate = (data[1]=="1/2/2007") | (data[1]=="2/2/2007")
# I may have copy-pasted my own code. I feel so ... violated.



#Do you know why I'm creating these columns?

Sub_metering_1= data[,"Sub_metering_1"][goodDate]
Sub_metering_2= data[,"Sub_metering_2"][goodDate]
Sub_metering_3= data[,"Sub_metering_3"][goodDate]

# To delete stuff, of course.



time = strptime(paste(data[,"Date"][goodDate], data[,"Time"][goodDate],sep="") ,"%d/%m/%Y%H:%M:%S")
# Not pointing fingers here, but had someone not mindlessly deleted this from the work environment in the previous exercise,
# we wouldn't have had to go through the whole date selection, colummn pasting, string- date conversion process all over again.  


#Coming to think of it, the same can be said about the data variable
rm(data)



# And the goodDate variable...
rm(goodDate)

# Gratification always trumps good sense. Sigh.

goodColors = c("black","red","blue")
# Don't, say it.



# "Plot", "lines". "Lines" and legend
#Will resume deleting stuff, in just a second
png(filename="plot3.png",width=480,height=480,units="px")


  plot(time,Sub_metering_1,col=goodColors[1],ylab="Energy sub metering",xlab="",type="l")
 
  lines(time,Sub_metering_2,col=goodColors[2])
 
  lines(time,Sub_metering_3,col=goodColors[3])

  legend("topright", lty=1, col=goodColors, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()


# :-) 

rm(list=ls())
