
# I don't usually like giving the user much freedom, but I guess letting him/her/monkey
# choose the file is less painful than actually figuring out how to upload it!
data = read.table(file.choose(),header=TRUE,na.strings="?",sep=";")
goodDate = (data[1]=="1/2/2007") | (data[1]=="2/2/2007")



# Date and Time Columns (for valid dates) shall now be pasted as strings and converted to date time format.

time = strptime(paste(data[,"Date"][goodDate], data[,"Time"][goodDate],sep="") ,"%d/%m/%Y%H:%M:%S")

# Why in a single line? Coz I like savin those lines for ma precious comments, 'course!




# Y axis parameter for valid dates shall now be converted to a numeric format
globalActPr= as.numeric(data[,"Global_active_power"][goodDate])


# Ever felt bad about duplicate data? 
rm(data)

# How about redundant data?
rm(goodDate)

# Therapeutic. Isn't it?


png(filename="plot2.png",width=480,height=480,units="px")
plot(time,globalActPr,col="black",ylab="Global Active Power(kilowatts)",xlab="",type="l")
dev.off()

#Deleting can be morbidly fun
rm(list=ls())

#Just like the swirl guru says, Leave nothing behind but pngs... or was it toe nails??