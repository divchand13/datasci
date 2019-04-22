
#Week 12 - Forecasting
#title: " Time Series Cowpertwait Chapter 6.6 and 6.7 ARMA Models"

#exploring the arima.sim function
set.seed(1)
x<-arima.sim(n=10000, list(ar=-0.6,ma=0.5))
coef(arima(x, order=c(1,0,1)))

#************************************
#Exchange rate series

# Comparing fitted ma(1), ar(1),arma(1,1) models for their AIC
x.ma <-arima(Z.ts, order=c(0,0,1))
x.ar <-arima(Z.ts, order= c(1,0,0))
x.arma <-arima(Z.ts,order = c(1,0,1))
AIC(x.ma)

AIC(x.ar)


AIC(x.arma)

# The ARMA(1,1) model provides the best fit
arima(x=Z.ts, order=c(1,0,1))
acf(resid(x.arma))

# Quiz Qn 4 based on chocolate time series
choc.ts<- ts(cbe[,1] ,start=1958, freq=12)

#checking choc dataset
summary(choc.ts)

#using forecast package
install.packages("forecast")
library(forecast)

c<-naive(choc.ts)
plot(choc.ts)
class(choc.ts)

#creating autoplot of residuals
autoplot(choc.ts, series ="Data") +autolayer(fitted(c), series="Fitted")
autoplot(residuals(c))
  checkresiduals(c)

  # Question 8 from quiz
frequency(choc.ts)
training <-window(choc.ts,end=1980)
test<-window(choc.ts,start=1981)
plot(training)
plot(test)
training

training <-window(choc.ts,end=c(1980,12))
plot(training)

test<-window(choc.ts,start=c(1981,1))
plot(test)


#reading more about function naive
?naive
(
fc <- naive(training, h=10)
autoplot(fc) + autolayer(test, series="Test data"))

accuracy(fc, test)

