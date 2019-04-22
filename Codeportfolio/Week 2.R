# Chapter 1 Time Series Cowpertwait - week 2
#*********************************************************************

#Creating a function for factorial
Fact<-function(n) if (n==1) 1 else n*Fact(n-1)

#using this function now to calculate factorial of 5
Fact(5)
#note: Important lesson here - R is case sensitive

#***************************************************************************************88
## 1.4 Plots, trends and seasonal variations

data("AirPassengers")
AP <- AirPassengers
AP

# Checking the class of AP
class(AP)

#ts here refers to time series - exploring the time series further by using below commands

start(AP)
# Data starts in 1949 Jan

end(AP)
# Data ends in 1960 dec

frequency(AP)
summary(AP)

#Plotting the series, naming the Y axis

plot(AP , ylab="Passengers (1000's)")


# aggregate helps to get yearly view
#boxplot is used to view summary of each season
#layout helps to see both these in a single window

layout(1:2)
plot(aggregate(AP))
boxplot(AP ~ cycle(AP))

# From this, increasing trend can be observed, more people traveled from June-Sept

#********************************************************************************

#Maine unemployment data - importing

www<-"C:/Users/divya/Downloads/bookwebfiles_Cowpertwait, Metcalfe/Maine.dat"
Maine.month <- read.table(www, header=TRUE)

attach(Maine.month)
class(Maine.month)
#the dataset is a dataframe

#Converting to time series object
Maine.month.ts <- ts(Maine.month$unemploy, start= c(1996,1) , frequency = 12)

#aggregating data based on average of each year

Maine.annual.ts <- aggregate(Maine.month.ts)/12

#Plotting data

layout(1:2)
plot(Maine.month.ts, ylab="unemployed (%)")
plot(Maine.annual.ts, ylab="unemployed (%)")

#Time Series Analysis
#Using the window function by specifying start/end points
Maine.Feb <-window(Maine.month.ts, start=c(1996,2) ,freq=TRUE)
Maine.Aug <-window(Maine.month.ts, start=c(1996,8)
,frequency=TRUE)

Feb.ratio <- mean(Maine.Feb)/mean(Maine.month.ts)
Aug.ratio <-mean(Maine.Aug)/mean(Maine.month.ts)
Feb.ratio
Aug.ratio

#This indicates that unemployment in higher in Feb by 22% and lower in Aug by 18%

t <- seq(from = 1, to = 100, by = 1) + 10 + rnorm(100, sd = 7)
t_Series<-ts (t,start = 2004, frequency=4)
plot(t_Series)
#ylab can be used to rename the Y axis appropriately

 #***************************************************************************************88
## Multiple Time Series - 3 i.e Chocolate, Beer, Electricity
cbe <- read.table("cbe.dat", header = TRUE)
head(cbe)

#Create a time series for each column:

Elec.ts <- ts(cbe[, 3], start = 1958, freq = 12)
Beer.ts <- ts(cbe[, 2], start = 1958, freq = 12)
Choc.ts <- ts(cbe[, 1], start = 1958, freq = 12)

#Plot all three series
plot(cbind(Elec.ts, Beer.ts, Choc.ts))

#Use intersect function and create plot

AP.elec <- ts.intersect(AP, Elec.ts)
AP <- AP.elec[,1]
Elec <- AP.elec[,2]
layout(1:3) 

plot(AP, main = "", ylab = "Air passengers / 1000's") 
plot(Elec, main = "", ylab = "Electricity production / MkWh")
plot(as.vector(AP), as.vector(Elec), xlab = "Air passengers / 1000's", ylab = "Electricity production / MWh")
abline(reg = lm(Elec ~ AP))

cor(AP,Elec)
# Correlation is found to be high between the two series 
#howeve correlation does not imply causing


#**************************************
#Quarterly Exchange Rate

www<-"C:/Users/divya/Downloads/pounds_nz.dat"
Z <- read.table(www, header=TRUE)

Z[1:4, ]

Z.ts <- ts(Z, st=1991, fr=4)

plot(Z.ts, xlab= "time/years", ylab="Quarterly exchange rate in $NZ/pound")

#analyzing series using window function
Z.92.96 <-window(Z.ts, start = c(1992, 1),end=c(1996, 1))
Z.96.98 <-window(Z.ts, start= c(1996, 1), end = c(1998,1))

layout(1:2)
plot(Z.92.96, ylab= "Exchange rate in NZ$/pound", xlab="Time (years)")
plot(Z.96.98, ylab= "Exchange rate in NZ$/pound", xlab="Time (years)")

# from plots a downward trend is observed till 1996 and an upward trend from 96 to 98