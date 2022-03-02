####################################################################
# Problem 1.1
####################################################################
# 1
df11 <- data.frame(brand=c("audi","volswagen","bmw","renault","fiat"),
                   model=c("A3","Polo","X5","megane","punto"),
                   consumption=c(6.8,6.8,12.5,4.7,5.0))
df11
# 2
df11$consumption[5] <- 4.5
#df11[5,3] Alternative
df11


####################################################################
# Problem 1.2
####################################################################
# 1
setwd('/Users/dfmartinez/Dropbox/02.BCN_Jobs/01.UPC_ESEIAAT/2021-2022/02.Q2_Feb22_Jul22/AEDA/03.Labs(NotGraded)/Week1_labR')     
datos2 <- read.table('flights.txt',header=TRUE,sep="\t",dec=".",
                     na.strings="@", stringsAsFactors = TRUE)
head(datos2)
sd(datos2$air_time,na.rm=TRUE)
IQR(datos2$air_time,na.rm=TRUE)
hist(datos2$air_time)
boxplot(datos2$air_time)
boxplot(datos2$air_time~datos2$dest,las=2,cex.axis=0.5)
abline(v=seq(1,100,2),col='grey',lty=2)

# 2
table(datos2$origin)
prop.table(table(datos2$origin))
barplot(table(datos2$origin))


####################################################################
# Problem 1.3
####################################################################
# 1
with(datos2,cor(dep_delay,arr_delay, use="complete.obs"))
plot(arr_delay~dep_delay,datos2,pch=19,col=rgb(1,0,0,0.05,max=1),
     xlab="Retraso salida",ylab="Retraso llegada",main="Retrasos en los vuelos")

# 2
with(datos2,tapply(arr_delay,month,summary))
boxplot(arr_delay~month,datos2)

datos2.delay <- subset(datos2,arr_delay>0)  
with(datos2.delay,tapply(arr_delay,month,summary))
boxplot(arr_delay~month,datos2.delay,log="y")


# 3 
with(datos2,table(hour,origin))
with(datos2,prop.table(table(hour,origin),1))
mosaicplot(origin~hour,datos2,col=1:24)

datos2$time.slot <- cut(datos2$hour,c(0,8,16,24),include.lowest = TRUE)
with(datos2,table(time.slot,origin))
with(datos2,prop.table(table(time.slot,origin),2))
mosaicplot(origin~time.slot,datos2,col=1:24)


####################################################################
# Problem 1.4
####################################################################
#i.# i. Plot mpg vs. horsepower. What do you see?
plot(mpg~horsepower, data=Auto)
#negative relationship the more horsepower the les mpg

# ii. Fit a simple linear regression model where the response variable is mpg 
#and the independent variable is horsepower. What is the parameter value of
#the variable horsepower? and its interpretation?
library(report)
lm.fit = step(lm(mpg ~ horsepower, data=Auto))
summary(lm.fit)
report(lm.fit)
#Yes, there is a relationship between horsepower and mpg
#as determined by testing the null hypothesis of all
#regression coefficients equal to zero.
#Since the F-statistic is far larger than 1 and the p-value
#of the t-statistic is close to zero we can reject the null
#hypothesis and state there is a statistically
#significant relationship between horsepower and mpg.

#To calculate the residual error relative to the response
#we use the mean of the response and the RSE.
#The mean of mpg is 23.4459. The RSE of the lm.fit was 4.906
#which indicates a percentage error of 20.9248%. The
#R^2 of the lm.fit was about 0.60549, meaning 60.49%
#of the variance in mpg is explained by horsepower.

#The relationship between mpg and horsepower is negative.
#The more horsepower an automobile has the linear
#regression indicates the less mpg fuel efficiency
#the automobile will have.


