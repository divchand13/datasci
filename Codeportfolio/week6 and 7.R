
#Install package zoo and xts
install.packages("zoo")
install.packages("xts")

#Use the format argument to specify the input format of the date if it is not in the default format
my.date =as.Date("1970/1/1")
my.date
class(my.date)
as.numeric(my.date)
myDates = c("2013-12-19","2003-12-20")
as.Date(myDates)

# Using format argument to specify the input format of the date if it is not in the default format
as.Date("1/1/1970",format="%m/%d/%Y")
as.Date("January 1,1970", format="%B %d, %Y")
as.Date("01JAN70", format="%d%b%y")

#Extracting information
weekdays(my.date)

# week 7 practice
install.packages("devtools")
devtools::install_github("nickpoison/astsa")

#plotting chicken prices data
plot(astsa::chicken)

summary(fit <- lm(astsa::chicken~time(astsa::chicken), na.action=NULL))
plot(astsa::chicken, ylab="cents per pound")
abline(fit) #add the fitted line

#building a linear model for unemp data
plot(astsa::unemp)

summary(fit <- lm(astsa::unemp~time(astsa::unemp), na.action=NULL))
plot(astsa::unemp)
abline(fit) #adding the fitted line
summary(fit) #getting r squared and df
summary(aov(fit)) #getting MSE


cmort<-astsa::cmort
tempr<-astsa::tempr
part<-astsa::part

par(mfrow=c(3,1)) # plot the data
plot(cmort, main="Cardiovascular Mortality", xlab="", ylab="")
plot(tempr, main="Temperature", xlab="", ylab="")
plot(part, main="Particulates", xlab="", ylab="")


dev.new() # open a new graphic device

ts.plot(cmort,tempr,part, col=1:3) # all on same plot (not shown)

dev.new()
pairs(cbind(Mortality=cmort, Temperature=tempr, Particulates=part))
temp = tempr-mean(tempr) # center temperature
temp2 = temp^2
trend = time(cmort) # time
fit = lm(cmort~ trend + temp + temp2 + part, na.action=NULL)

summary(fit) # regression results
summary(aov(fit)) # ANOVA table (compare to next line)
summary(aov(lm(cmort~cbind(trend, temp, temp2, part)))) # Table 2.1
num = length(cmort) # sample size
AIC(fit)/num - log(2*pi) # AIC
BIC(fit)/num - log(2*pi) # BIC
(AICc = log(sum(resid(fit)^2)/num) + (num+5)/(num-5-2)) # AICc

#reducing variables in model
summary(aov(lm(cmort~cbind(trend, temp, temp2))))

#reducing variables in model
summary(aov(lm(cmort~cbind(trend, temp))))

#reducing variables in model
summary(aov(lm(cmort~cbind(trend))))

