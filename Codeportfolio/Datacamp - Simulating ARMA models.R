 # Datacamp - arima-modeling-with-r

# View a detailed description of AirPassengers
help(AirPassengers)

# Plot AirPassengers
plot(AirPassengers)

# Plot the DJIA daily closings
plot(djia$Close)

# Plot the Southern Oscillation Index
plot(soi)

# Plot globtemp and detrended globtemp
par(mfrow = c(2,1))
plot(globtemp) 
plot(diff(globtemp))

# Plot cmort and detrended cmort
par(mfrow = c(2,1))
plot(cmort)
plot(diff(cmort))

# Plot globtemp and detrended globtemp
par(mfrow = c(2,1))
plot(globtemp) 
plot(diff(globtemp))

# Plot cmort and detrended cmort
par(mfrow = c(2,1))
plot(cmort)
plot(diff(cmort))


# R provides a simple function called arima.sim() to generate data from an ARMA model.
# For example, the syntax for generating 100 observations from an MA(1) with parameter .9 is arima.sim(model = list(order = c(0, 0, 1), ma = .9 ), n = 100). 
# 
# Order = c(0, 0, 0) can be used to generate white noise.

# Generate and plot white noise
WN <- arima.sim(model = list(order = c(0, 0, 0)), n = 200)
plot(WN)


# Generate and plot an MA(1) with parameter .9 
MA <- arima.sim(model = list(order = c(0, 0, 1), ma = .9 ), n = 200)
plot(MA)


# Generate and plot an AR(2) with parameters 1.5 and -.75
AR <- arima.sim(list(order = c(2, 0, 0), ar = c(1.5,-0.75)), n=200)
plot(AR)

# Fitting an AR1 model
# ACF and PACF pairs  help identify the orders p and q of an ARMA model
  
# Generate 100 observations from the AR(1) model
x <- arima.sim(model = list(order = c(1, 0, 0), ar = .9), n = 100) 

# Plot the generated data 
plot(x)

# Plot the sample P/ACF pair
acf2(x)

# Fit an AR(1) to the data and examine the t-table
sarima(x, p=1, d=0, q=0)


# Fitting an AR2 model:
  
  # astsa is preloaded
  
  # Plot x
  plot(x)


# Plot the sample P/ACF of x
acf2(x)

# Fit an AR(2) to the data and examine the t-table
sarima(x, p=2, d=0, q=0)

#ARMA models: Understand how AR models and MA models come together in the form of ARMA models

# astsa is preloaded

# Plot x
plot(x)


# Plot the sample P/ACF of x
acf2(x)

# Fit an ARMA(2,1) to the data and examine the t-table
sarima(x,p=2, d=0, q=1)

# sarima() includes residual analysis - 
#   standardized residuals, sample acf of residuals,normal Q-Q plot,
# Q statistic p-values
  

#Fitting ARIMA model to real world data

# Plot the sample P/ACF pair of the differenced data 
acf2(diff(globtemp))

# Fit an ARIMA(1,1,1) model to globtemp
sarima(globtemp, p=1, d=1, q=1)

# Fit an ARIMA(0,1,2) model to globtemp. Which model is better?
sarima(globtemp, p=0, d=1, q=2)



#Judging by the AIC and BIC, the ARIMA(0,1,2) model performs better than the ARIMA(1,1,1) model on the globtemp data
  
# Fit ARIMA(0,1,2) to globtemp and check diagnostics  
sarima(globtemp, p=0, d=1, q=2)

# Fit ARIMA(1,1,1) to globtemp and check diagnostics
sarima(globtemp, p=1, d=1, q=1)

# Which is the better model?
"ARIMA(0,1,2)"

#sarima.for can be used for forecasting

# Plot P/ACF pair of differenced data 
acf2(diff(x))

# Fit model - check t-table and diagnostics
sarima(x, p=1, d=1, q=0)


# Forecast the data 20 time periods ahead
sarima.for(x, n.ahead = 20, p = 1, d = 1, q = 1) 
lines(y)  

# Fit an ARIMA(0,1,2) to globtemp and check the fit
sarima(globtemp, p=0, d=1, q=2)

# Forecast data 35 years into the future
sarima.for(globtemp, n.ahead=35,p=0 ,d=1, q=2 )

# ASTSA Chicken dataset - forecasting for 5 years ahead
# Fit the chicken model again and check diagnostics
sarima(chicken, 2,1,0,1,0,0,12)

# Forecast the chicken data 5 years into the future
sarima.for(chicken,2,1,0,1,0,0,12,n.ahead=60)



