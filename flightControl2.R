# Diego Diaz
# some data analysis

# imported all of the data from 2008 data set
# of the ASA Data Expo 2009
myDF <- read.csv("C://Users/Diego/Documents/R/2008.csv")

# Here are the first 6 flights
head(myDF)
# and the last 6 flights
tail(myDF)

# In particular, here are airports that were the 
# origins of the first 6 flights
head(myDF$Origin)
# and the airports that were the origins of the last 6 flights
tail(myDF$Origin)

# Here are the destination airports of the
# first and last 6 flights, respectively.
head(myDF$Dest)
tail(myDF$Dest)

# Here is the information about the first 6 flights that
# had IND as the origin
head(myDF$Origin == "IND")

sum(myDF$Origin == "IND")
# FALSE values converted to 0's
# TRUE values converted to 1's
# sum just adds up the total,
# which yields the number of flights departing from Indy in 2008
# There were 42750 such flights,
# which had IND as the origin

# Similarly, we had 42732 flights with IND as the destination
sum(myDF$Dest == "IND")

# Created a smaller data frame with *only* the flights
# in which IND is the origin city
MyIndyOrigins <- subset(myDF, myDF$Origin == "IND")

# Similarly we made a data frame with the flights
# for which IND is the destination city
IndianapolisDestinations <- subset(myDF, myDF$Dest == "IND")

# Here are the first 6 flights of each of those new data frames.
head(MyIndyOrigins)
head(IndianapolisDestinations)

# How many flights had IND as the origin city
# during each month of the year
table(MyIndyOrigins$Month)
# Now we can plot that data easily
plot(table(MyIndyOrigins$Month))

# Similarly for the flight for which IND was the destination
table(IndianapolisDestinations$Month)
plot(table(IndianapolisDestinations$Month))

# Again, here are the first 6 flights for which IND is the origin
head(MyIndyOrigins)

sum(MyIndyOrigins$DepTime < 600)
# this is the number of flights that departed before 6 AM
# again, sum up TRUE's and FALSE's as 1's and 0's resp.
?sum
sum(MyIndyOrigins$DepTime < 600, na.rm=TRUE)
# similarly, flights that departed before 12 noon, 6 PM, 12 midnight
sum(MyIndyOrigins$DepTime < 1200, na.rm=TRUE)
sum(MyIndyOrigins$DepTime < 1800, na.rm=TRUE)
sum(MyIndyOrigins$DepTime < 2400, na.rm=TRUE)

# Note to ourselves: the na.rm means to remove any values that
# were not known, i.e., that were appearing as "NA"

# Altogether we had 42011 flights departing by midnight
# and 739 flights that had NA for the departure time.
sum(is.na(MyIndyOrigins$DepTime))
42011 + 739

# Build a table that shows how many cities are the origin
# for the flights throughout 2008
table(myDF$Origin)
# Sort the results, and see that Atlanta is most often used
# as a city of origin for flights
sort(table(myDF$Origin))

# here are some sample departure times
head(myDF$DepTime)
# we might want to break them up into these categories
seq(0, 2400, by=100)
# Enumerates the number of flights that departed within
# each hour range during the course of the day
table(cut(myDF$DepTime, breaks=seq(0, 2400, by=100)))
# Here is the corresponding plot
# and we will improve the way the x-axis looks later
plot(table(cut(myDF$DepTime, breaks=seq(0, 2400, by=100))))

# Make a table of all the origin-to-destination pairs
# then sort the table, and find which are the most popular
# such pairs, by examining only the tail
# Here are the most popular 20 such pairs.
tail(sort(table(paste(myDF$Origin, "to", myDF$Dest))), 20)



# Quiz 3. 
# Question 1
# In 2008, how many flights departed from O'Hare Airport (ORD)?
sum(myDF$Origin == "ORD")

# Question 2
# In 2008, how many flights arrived at O'Hare Airport (ORD)?
sum(myDF$Dest == "ORD")

# Question 3
# How many flights in the data set departed from the Indianapolis Airport (IND) and arrived at the O'Hare Airport (ORD)?
sum((myDF$Origin == "IND") & (myDF$Dest == "ORD"))


# Quiz 5
# Question 1
# How many flights arrived at LAX in 2008?
MySubDataset <- subset(myDF, myDF$Dest == "LAX")
dim(MySubDataset)

# Question 2
# How many flights departed from ATL and landed at LAX in 2008?
MySubDataset <- subset(myDF, myDF$Origin == "ATL" & myDF$Dest == "LAX")
dim(MySubDataset)

# Question 3
# Among the flights from ATL to LAX in 2008, how many departed before 12 noon?
MySubDataset <- subset(myDF, myDF$Origin == "ATL" & myDF$Dest == "LAX")
sum(MySubDataset$DepTime < 1200, na.rm=TRUE)


# Quiz 6
# How many origin-to-destination paths were only flown one time (each) in 2008? (285)
sum(table(paste(myDF$Origin, "to", myDF$Dest)) == 1)




