#Chapter 2 - Week5 Time Series Cowpertwait 


#Learning about correlograms
#Importing data
data("AirPassengers")
AP<-AirPassengers

#seasonally adjusting and removing trend with 'decompose' function

AP.decom <-decompose(AP, "multiplicative")
plot(ts(AP.decom$random[7:138]))
acf(AP.decom$random[7:138])

sd(AP[7:138])
sd(AP[7:138] - AP.decom$trend[7:138])

#The reduction in standard deviation from above steps shows that seasonal adjustment has
#been very effective

#*****************************************
#Question 4 from weekly quiz 
#Checking the mean, std dev and covariance of variables in the given dataset

mean(varnish$y)
sd(varnish$y)
cov(varnish$x,varnish$y)

plot(guesswhat$x,guesswhat$y)
cor(guesswhat$x,guesswhat$y)

#Question 7 from weekly quiz
#Using cbe dataset to plot chocolate product time series

ts.plot(cbind(trend, trend*seasonal), lty=1:2)

plot(decompose(choc.ts))
choc.decom <- decompose(choc.ts, type= "additive")
plot(choc.decom)
trend <- choc.decom$trend
seasonal <- choc.decom$seasonal
ts.plot(cbind(trend, trend+seasonal), lty=1:2)

elec.ts <- ts(cbe[, 3], start=1958, freq=12)
plot(cbind(elec.ts,choc.ts))

trend <- choc.decom$trend
seasonal <-choc.decom$seasonal
ts.plot(cbind(trend,trend*seasonal), lty=1:2)

choc.decom <- decompose(choc.ts, type= "additive")
plot(choc.decom)

#Question 8 from weekly quiz - Extracting trend and seasonal effect from chocolate ts
#creating chocolate time series

choc.ts <- ts(cbe[, 1], start=1958, freq=12)

# Decomposing time series and plotting it

choc.decom <- decompose(choc.ts, type= "multiplicative")

plot(choc.decom)

# Extracting trend and seasonal effects

trend <- choc.decom$trend
seasonal <- choc.decom$seasonal

# Superimposing trend and seasonal effect in one plot
ts.plot(cbind(trend, trend*seasonal), lty=1:2)

acf(choc.decom$random)
summary(choc.decom)
data(choc.ts)
data(cbe$choc)
summary(cbe$choc)
acf(choc.decom$random[7:138])
sd(cbe$choc[7:138])
sd(cbe$choc[7:390])
sd(cbe$choc[7])
sd(cbe$choc)

summary(AirPassengers)

acf(choc.decom$random[7:390])
acf(choc.decom$random[7])
