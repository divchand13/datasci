# Datacamp - Introduction to Time Series Analysis

#Exploring raw time series data
# Print the Nile dataset
print(Nile)

# List the number of observations in the Nile dataset. This function is very helpful to understand length of variables
length(Nile)

# Display the first 10 elements of the Nile dataset. This can be used to see how a dataset looks/if import looks correct
head(Nile, n=10)

# Display the last 12 elements of the Nile dataset
tail(Nile, n=12)

#****************
#Basic time series plots
# Plot the Nile data
plot(Nile)

# Plot the Nile data with xlab and ylab arguments
plot(Nile, xlab = "Year", ylab = "River Volume (1e9 m^{3})")

# Plot the Nile data with xlab, ylab, main, and type arguments
plot(Nile, main= "Annual River Nile Volume at Aswan, 1871-1970", type="b", xlab= "Year", ylab="River Volume (1e9 m^{3})")

#***********************************
#Understanding time indexes

# Plot the continuous_series using continuous time indexing
par(mfrow=c(2,1))
plot(continuous_time_index,continuous_series, type = "b")

# Make a discrete time index using 1:20 
discrete_time_index <-1:20

# Now plot the continuous_series using discrete time indexing
plot(discrete_time_index,continuous_series, type = "b")

#Exploring sampling frequency
#************************************
# Plot AirPassengers
plot(AirPassengers)


# View the start and end dates of AirPassengers
start(AirPassengers)
end(AirPassengers)


# Use time(), deltat(), frequency(), and cycle() with AirPassengers 
# these functions are helpful to understand timeseries datasets better.
time(AirPassengers)
deltat(AirPassengers)
frequency(AirPassengers)
cycle(AirPassengers)

#Note:time creates the vector of times at which a time series was sampled.
#cycle gives the positions in the cycle of each observation.
#frequency returns the number of samples per unit time and deltat the time interval between observations

#**************************************
# Learning to deal with missing values
# Compute the mean of AirPassengers
mean(AirPassengers, na.rm=TRUE)

# Impute mean values to NA in AirPassengers
AirPassengers[85:96] <- mean(AirPassengers, na.rm = TRUE)

#**********************************
# Converting a data_vector to a ts object with start = 2004 and frequency = 4
time_series <- ts(data_vector, start = 2004, frequency = 4)

# Use print() and plot() to view time_series
print(time_series)
plot(time_series)


#***************************
#Plotting time series objects

# Check whether eu_stocks is a ts object
is.ts(eu_stocks)

# View the start, end, and frequency of eu_stocks
start(eu_stocks)
end(eu_stocks)
frequency(eu_stocks)

# Generate a simple plot of eu_stocks
plot(eu_stocks)

# Use ts.plot with eu_stocks
ts.plot(eu_stocks, col = 1:4, xlab = "Year", ylab = "Index Value", main = "Major European Stock Indices, 1991-1998")

# Add a legend to your ts.plot
legend("topleft", colnames(eu_stocks), lty = 1, col = 1:4, bty = "n")

#**************************
# Log Transformations to remove trends

# Log rapid_growth
linear_growth <-log(rapid_growth)

# Plot linear_growth using ts.plot()
ts.plot(linear_growth)

#*****************************
#Removing trends in level by differencing

# Generate the first difference of z
dz <- diff(z)

# Plot dz
ts.plot(dz)

# View the length of z and dz, respectively
length(z)
length(dz)

# Removing seasonal trends with seasonal differencing

# Generate a diff of x with lag = 4. Save this to dx
dx <- diff(x,lag=4)

# Plot dx
ts.plot(dx)

#*******************************
#Simulating white noise model

# Simulate a WN model with list(order = c(0, 0, 0))
white_noise <- arima.sim(model = list(order = c(0,0,0)), n = 100)

# Plot your white_noise data
ts.plot(white_noise)

# Simulate from the WN model with: mean = 100, sd = 10
white_noise_2 <- arima.sim(model = list(order = c(0,0,0)), n = 100, mean = 100, sd = 10)

# Plot your white_noise_2 data
ts.plot(white_noise_2)

# Fit the WN model to y using the arima command
arima(y,order= (c(0,0,0)))


# Calculate the sample mean and sample variance of y
mean(y)
var(y)

#**************************
# Random Walk Model

# Generate a RW model using arima.sim
random_walk <- arima.sim(model = list(order = c(0,1,0)), n = 100)

# Plot random_walk
ts.plot(random_walk)

# Calculate the first difference series
random_walk_diff <- diff(random_walk)

# Plot random_walk_diff
ts.plot(random_walk_diff)

#*************************
#Random walk model with drift
# Generate a RW model with a drift uing arima.sim
rw_drift <- arima.sim(model = list(order = c(0,1,0)), n = 100, mean = 1)

# Plot rw_drift
ts.plot(rw_drift)

# Calculate the first difference series
rw_drift_diff <- diff(rw_drift)

# Plot rw_drift_diff
ts.plot(rw_drift_diff)


#Estimating the random walk model

# Difference your random_walk data
rw_diff <- diff(random_walk)

# Plot rw_diff
ts.plot(rw_diff)

# Now fit the WN model to the differenced data
model_wn <-arima(rw_diff, order = c(0,0,0))

# Store the value of the estimated time trend (intercept)
int_wn=model_wn$coef


# Plot the original random_walk data
ts.plot(random_walk)

# Use abline(0, ...) to add time trend to the figure
abline(0, int_wn)

#********************************
#Convariance and correlation functions


# Use cov() with DAX_logreturns and FTSE_logreturns
cov(DAX_logreturns, FTSE_logreturns)

# Use cov() with logreturns
cov(logreturns)

# Use cor() with DAX_logreturns and FTSE_logreturns
cor(DAX_logreturns, FTSE_logreturns)

# Use cor() with logreturns
cor(logreturns)

#**************************************
#Calculating autocorrelations using acf function and manually
# Define x_t0 as x[-1]
x_t0 <- x[-1]

# Define x_t1 as x[-n]
x_t1 <- x[-n]

# Confirm that x_t0 and x_t1 are (x[t], x[t-1]) pairs  
head(cbind(x_t0, x_t1))

# Plot x_t0 and x_t1
plot(x_t0, x_t1)

# View the correlation between x_t0 and x_t1
cor(x_t0, x_t1)

# Use acf with x
acf(x, lag.max = 1, plot = FALSE)

# Confirm that difference factor is (n-1)/n
cor(x_t1, x_t0) * (n-1)/n

#***************************************
#Autoregressive model simulation
# Simulate an AR model with 0.5 slope
x <- arima.sim(model = list(ar = 0.5), n = 100)

# Simulate an AR model with 0.9 slope
y <- arima.sim(model = list( ar = 0.9), n=100)

# Simulate an AR model with -0.75 slope
z <- arima.sim(model = list( ar = -0.75), n=100)

# Plot your simulated data
plot.ts(cbind(x, y, z))

#**********************************************
#Forecasting from an estimated AR model

# Fit an AR model to Nile
AR_fit <-arima(Nile, order  = c(1,0,0))
print(AR_fit)

# Use predict() to make a 1-step forecast
predict_AR <- predict(AR_fit, n.ahead=1)

# Obtain the 1-step forecast using $pred[1]
predict_AR$pred[1]

# Use predict to make 1-step through 10-step forecasts
predict(AR_fit, n.ahead = 10)

# Run to plot the Nile series plus the forecast and 95% prediction intervals
ts.plot(Nile, xlim = c(1871, 1980))
AR_forecast <- predict(AR_fit, n.ahead = 10)$pred
AR_forecast_se <- predict(AR_fit, n.ahead = 10)$se
points(AR_forecast, type = "l", col = 2)
points(AR_forecast - 2*AR_forecast_se, type = "l", col = 2, lty = 2)
points(AR_forecast + 2*AR_forecast_se, type = "l", col = 2, lty = 2)

#to make predictions for several periods beyond  last observations n.ahead argument is used in predict() command. 

#***************************
#Simple MA model
# Generate MA model with slope 0.5
x <- arima.sim(model = list(ma = 0.5), n = 100)

# Generate MA model with slope 0.9
y <- arima.sim(model = list(ma = 0.9), n = 100)

# Generate MA model with slope -0.5
z <- arima.sim(model = list(ma = -0.5), n = 100)

# Plot all three models together
plot.ts(cbind(x, y, z))

#*********************
#Comparing AR and MA models

#All factors being equal,
#a model that produces a lower AIC or BIC than another model is considered a better fit

# Find correlation between AR_fit and MA_fit
cor(AR_fit, MA_fit)

# Find AIC of AR
AIC(AR)

# Find AIC of MA
AIC(AR)

# Find BIC of AR
BIC(AR)
