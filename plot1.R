
# file.choose() lets one select the file path at runtime. It also lets me cleverly hide from you any inappropriate name I
# may have given to my data directory.
data <- read.table(file.choose(),header=TRUE,na.strings="?",sep=";")

goodDate = (data[1]=="1/2/2007") | (data[1]=="2/2/2007")
# Why "good" Date? I ran out of adjectives, alright! Don't judge me!


data[,"Global_active_power"] = as.numeric(data[,"Global_active_power"])


# Time for Planning and plotting
png(filename="plot1.png",width=480,height=480,units="px")
hist(data["Global_active_power"][goodDate],col="red",xlab="Global Active Power(kilowatts)",ylab="Frequency",main="Global Active Power")
dev.off()
# It's alive! Muhuhahahaha

# Psst. Lemme show you something
rm(list= ls())
# I deleted stuff *_*