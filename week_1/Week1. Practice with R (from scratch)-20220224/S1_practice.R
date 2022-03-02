############################################################
#
# Session 1 - Introduction to R - let's practice
#
############################################################

############################################################
#
# R as a calculator tool
#
############################################################

#Control + L for removing the Console

2+3               # arithmetic operations
2-3
2*4
4/2
3^2               # power
log(5)            # natural logarithm (ln)
log10(10)         # logarithm base 10
log2(2)           # logarithm base 2
exp(log(4))       # exponential function
sqrt(4)           # square root 
a <- 2*5          # assign numbers/operations to variables
a

############################################################
#
# Pre-defined objects
#
############################################################
pi                # pi value
letters           # lowercase letters 
LETTERS           # capital letters
month.name        # name of the months


############################################################
#
# Object types
#
############################################################
############################################################
# Arrays/Vectors: ordered series of values of the same type --> c()
############################################################
##-- Examples
v1 <- c(32,40,61,71,39)       # ages of people (numerical vector)
v1
v2 <- 1:5                     # integers from 1 to 5 (integer vector)
v2
v3 <- c("h","m","h","m","m")  # gender of people (character vector)
v3
class(v1)                     # if we want to know the type of data
class(v2)
class(v3)

##-- Access and modification
v1[3]          # See 3rd element
v1[3] <- 62    # Modify 3rd element
v1[3]          # See 3rd element

v1[2:4]        # See elements from 2 to 4
v1[c(1,2,4)]   # see elements 1, 2, and 4







############################################################
# Matrices: series of numerical columns ordered 
# and of equal length -> matrix 
############################################################
##-- Examples
m1 <- matrix(c(10,20,30,40),nrow=2,byrow=TRUE)
m1

#cbind() and rbind() both create matrices by combining several 
#vectors of the same length. 
#cbind() combines vectors as columns, 
#while rbind() combines them as rows

length(v1)                  #length of a vector
length(v2)
m2 <- cbind(v1,v2) 
m2
m2bis <- rbind(v1,v2) 
m2bis

##-- Access and modification
m1[2,1]       # Element from row 2 and column 1       
m1[2,]        # All elements of row 2
m1[,1]        # All elements de la column 1
m1[2,1] <- 35 # Modify element from row 2 and column 1     
m1

colnames(m2)                       # See column names 
rownames(m2)                       # See row names
colnames(m2) <- c("edad","orden")  # Modify column names 
rownames(m2) <- letters[1:5]       # Modify row names 
colnames(m2)                       
rownames(m2)                       
m2

###################                                                                              #########################################
# Data.frames: series of columns of any type ordered 
# and of equal length --> data.frame
############################################################
##-- Examples
df1 <- data.frame(x=letters[1:10],y=1:10)   # Letters from 1 to 10 
                                            # and numbers from 1 to 10
df1

v3
v1
df2 <- data.frame(v3,v1)
df2

##-- Access and modification
df1$x          # Column named "x"
df1[,"x"]      # Column named "x" (alternative to previous option)
df1[,1]        # First column     (alternative to previous option)

df1[2,1]       # Element from row 2 and column 1
df1$x[2]       # Element from row 2 and column 1 (alternative to previous option)

df1[2,]        # All elements from row 2
df1[2,2]
df1[2,2] <- 35 # Modify element from row 2 and column 2
df1

#Let's put the df1$x which is a character type, as factor  
df1$x
str(df1$x)
df1$x <- as.factor(df1$x)
str(df1$x)
#Now is a factor with 10 levels

df1[3,1] <- "k" # Attention: Modify the element of row 3, column 1
#It will give a warning.Why? because "k" is not one of the current levels
df1 

df1[3,1] <- "j" # Modify the element if row 3, columna 1. Ahora si, porque "j" es un nivel del factor.
df1

############################################################
# Lists: any combination of the above elements --> list 
############################################################
##-- Examples
l1 <- list(v1,m1,df1)
l1

##-- Access & modification
l1[1]               # A bracket to simplify the list
class(l1[1])

l1[[1]]             # Double bracket to access the item
class(l1[[1]])


##-- Problem 1.1:
# 1. Create a data.frame with the following data
#     brand model consumption
#      audi     A3     6.8
# volswagen   Polo     6.8
#       bmw     X5    12.5
#   renault megane     4.7
#      fiat  punto     5.0
# 2. Modify the consumption of the fiat punto a 4.5

#Give 10 minutes
#Let's check the solutions



############################################################
#
# Helpful commands
#
############################################################
##-- Help
?mean                         # question mark to ask for help from a function
??geometric                   # double question to ask for general help 
                              #-> equivalent to help.search ("geometric")

##-- Search
df1$x
which(df1$x =='e')             #Returns the position

df1$y
max(df1$y)                    #Returns the maximum
min(df1$y)                    #Returns the minimum
which.max(df1$y)              #Returns the position of the maximum
which.min(df1$y)              #Returns the position of the minimum
which((df1$y>=1) & (df1$y<5))   #And 
which((df1$y<2) | (df1$y>1))    #Or

m1
t(m1)   #transpose a matrix

seq(-3,6)                  #sequence
seq(-3,6, by=2)            #sequence each 2  
seq(0,1, length=11)        #partition

rep(1,6)                   #repeat 1, 6 times       
rep(c(1,6),each=3)         #repeat 1 and 6, 3 times each
rep(seq(2,10,by=2),2)      #repeat two times the sequences from 2 to 10, each 2

##-- Programming
v1
if (v1[1]==32) print("The age of the first subject is 32")  # if --> logical condition

for (i in 1:5) print(v1[i])                                  # Loop


##-- Object management
ls()              # Objects in memory
object.size(v1)   # Size that an object occupies in memory
rm(v1)            # Remove any object in memory
rm(list=ls())     # Remove all objects in memory
ls() 


############################################################
#
# Read files (data reading)
#
############################################################
##-- from a text file

# First, to know in which working directory I'm working with
getwd()

# Put here the path where the data is, separating the folders with "/"
setwd('D:/ESEIAAT/Data_Analysis/week_1/Week1. Practice with R (from scratch)-20220224') 
getwd()
datos <- read.table('Mobiles.txt',header=TRUE,sep=";",dec=".",
                    na.strings="NA", stringsAsFactors = TRUE)

##-- Data inspection
class(datos)
str(datos)               # data structure
View(datos)              # view the data
dim(datos)               # number of rows and columns 
nrow(datos)
ncol(datos)
head(datos)              # data header (first rows)
head(datos,n=10)         # data header (first 10 rows)
tail(datos)              # data tail (last rows)
tail(datos,n=10)              # data tail (last 10 rows)
summary(datos)           # basic data descriptive 

##-- See the " " (e.g. plan type)
##-- So, there are missings not coded correctly (NA ok, but also " ")

## -- Reading is repeated
datos <- read.table('Mobiles.txt',header=TRUE,sep=";",dec=".",
                    na.strings=c("NA",""), stringsAsFactors = TRUE)
summary(datos)



########################################
#### Exploratory Data Analysis (EDA) ###
########################################


############################################################
#
# Descriptive (Univariate)
#
############################################################


############################################################
# numerical variable
############################################################
##-- Main statistics of one variable
summary(datos$Bill)                  

##-- What do the quartiles ("1st Qu.", "Median" (2nd Qu.), "3rd Qu.") represent?
n <- dim(datos)[1]                   # sample size (# rows)
sum(datos$Bill<=25.00,na.rm=TRUE)/n  # proportion of observations below 1st Qu.
sum(datos$Bill<=35.00,na.rm=TRUE)/n  # proportion of observations below 2nd Qu.
sum(datos$Bill<=60.00,na.rm=TRUE)/n  # proportion of observations below 3rd Qu.

##-- Standard deviation and IQR
sd(datos$Bill)                       # Note that it does not work (because of missings)
sd(datos$Bill,na.rm=TRUE)            # missings must be eliminated
(iqr <- IQR(datos$Bill,na.rm=TRUE))  # interquartile range: distance between Q1 and Q3

##-- Graphics
hist(datos$Bill,col="blue")
boxplot(datos$Bill,main="Facturas ($)")

##-- What do the boxplot lines represent?
abline(h=25.00,lty=2,col=1)          # 1st Qu.
abline(h=35.00,lty=2,col=2)          # 2nd Qu.
abline(h=60.00,lty=2,col=3)          # 3rd Qu.
abline(h=0,lty=2,col=4)              # Min (lower mustache)
abline(h=60.00+(1.5*iqr),lty=2,col=5)  # 1.5IQR (Top Mustache)

############################################################
# Categorical variable
############################################################
##-- Table of frequencies and proportions
table(datos$Brand)                           # Table of frequencies
prop.table(table(datos$Brand))               # Table of proportions
round(100*prop.table(table(datos$Brand)),1)  # Tabla of rounded percentages

# Alternatives: https://dabblingwithdata.wordpress.com/2017/12/20/my-favourite-r-package-for-frequency-tables/ 

##-- Bar chart
barplot(table(datos$Brand))                  

# Improved bar chart
barplot(sort(table(datos$Brand)),las=2)                  

##-- Problem 1.2
#We read the file flights.txt
setwd('/Users/dfmartinez/Dropbox/02.BCN_Jobs/01.UPC_ESEIAAT/2021-2022/02.Q2_Feb22_Jul22/AEDA/03.Labs(NotGraded)/Week1_labR')     
datos2 <- read.table('flights.txt',header=TRUE,sep="\t",dec=".",
                     na.strings="@", stringsAsFactors = TRUE)
head(datos2)
# 1. Make the descriptive of the variable flight time (air_time) 
#    of the data set flights.txt
# 2. Make the descriptive of the categorical variable origin (origin) 
#    of the data set flights.txt

############################################################
#
# Descriptive (Bivariate)
#
############################################################

############################################################
# Numerical vs. Numerical
############################################################
##-- Correlation: linear relationship between variables (between -1 and 1)
cor(datos$Age,datos$Bill,use="complete.obs")    # alternative 1
with(datos,cor(Age,Bill,use="complete.obs"))    # alternative 2

##-- Bivariate graph (make "?par" to see parameters)
plot(datos$Age,datos$Bill)
plot(datos$Age,datos$Bill,xlab="Edad",ylab="Factura",
     main="Relacion de Edad y Gasto")
plot(Bill~Age,datos,xlab="Edad",ylab="Factura",
     main="Relacion de Edad y Gasto",
     col=4,pch=19,cex=0.8,las=1)  
#col - color
#pch - type of symbil: http://www.sthda.com/english/wiki/r-plot-pch-symbols-the-different-point-shapes-available-in-r
#las – a numeric value indicating the orientation of the tick mark labels 
#cex - number indicating the amount by which plotting text and symbols should be scaled relative to the default. 1=default, 1.5 is 50% larger, 0.5 is 50% smaller, etc. 

############################################################
# Numerical vs Categorical
############################################################
##-- Stratified numerical descriptive:: tapply

# Overall descriptive of variable Bill
summary(datos$Bill)  

# Descriptive of variable Bill, stratified by plan (PlanType)
tapply(datos$Bill,datos$PlanType,summary) 

# Standard deviation of variable Bill, stratified by plan (PlanType)
tapply(datos$Bill,datos$PlanType,sd,na.rm=TRUE) 

##-- Stratified Boxplot 
boxplot(datos$Bill~datos$PlanType)

############################################################
# Categorical vs. Categorical
############################################################
##-- Categorical vs categorical descriptive: table y prop.table
with(datos,table(PlanType,PrimaryUse))               # Frequencies
with(datos,prop.table(table(PlanType,PrimaryUse)))   # Overall proportions
with(datos,prop.table(table(PlanType,PrimaryUse),1)) # Row proportions
with(datos,prop.table(table(PlanType,PrimaryUse),2)) # Column proportions

##-- Barplot & mosaic plot
with(datos,barplot(table(PrimaryUse,PlanType),col=1:3),
     legend=TRUE,args.legend=list(x='topleft'))
mosaicplot(PlanType~PrimaryUse,datos,col=1:3,main="Use according to contract use")


##-- Problem 1.3
# 1. Make the description of the arrival delay according to the 
# departure delay. Calculate the correlation and make the bivariate 
#diagram. 
#
# 2. Make the description of the delay in arrival according 
# to the month of the year
# Make the summary of the delay according to the month 
#and the stratified boxplot
# Create a subset of data2 called data2.delay for those flights 
# with late arrival
# Redo the previous description
#
#
# 3. Make the description of the arrival time according 
#to the departure time (hour) as if it were a categorical variable
#
# Create a new variable within data2 that is a categorization 
# of the hour variable in 3 categories: [0-8], [9-16], [17-24]
# Repeat the previous description 
#(see the help for the ?cut instruction)


####################
#### Regression ####  (not seen in class)
####################

# R code of Session 3 - Regression and Statistical Tests


# Bicycle demand data

# The Capital Bikeshare bike share rental data contains information 
# about bike rental in Washington D.C. spanning two years 
# from January 1, 2011 to December 19, 2012. 
# Weather statistics for the corresponding date and time are attached 
# to the data set.
# The resulting data (after cleaninf the data) set that we will use 
# contains 9573 observations 
# and 11 variables. 
# Once the original data is loaded, we will proceed to prepare it 
# for analysis

#We read and explore the data set
bike <- read.csv("bikes.csv")
dim(bike)
head(bike)
tail(bike)
str(bike)


# Description of the data set
# We can see a summary of the data, using the summary function 

summary(bike)
#There are not missings


#Histogram of response variable
hist(bike$count) #It seems normal. Although linear regression don't need normality, only in the residuals

#Let's check We can check the existing linear correlations 
#between the variables in the database:
library(corrplot)

bike.select <- data.frame(bike$season, bike$month, bike$weekday, bike$hour, as.integer(bike$isweekday),
                          as.integer(bike$isholiday), as.integer(bike$weather), bike$temperature,
                          bike$humidity, bike$windspeed, bike$count)
names(bike.select) <- c("season", "month", "weekday", "hour", "isweekday", 
                        "isholiday", "weathertype", "temperature", "humidity",
                        "windspeed", "count")
M<-cor(bike.select)
corrplot(M, method="ellipse")
#Display the correlation coefficient 
corrplot(M, method="number")

#As you can see: month and season are 
#very correlated (0.97)
# and isweekend and weekday too (-0.71)
#To avoid multicollinearity, we don't include 
#both in the linear regression
#We will include only month and weekday

#But before we forgot, let's put the binary and 
#categorical variables as factor
bike$season <- as.factor(bike$season)
bike$weathertype <- as.factor(bike$weathertype)
bike$isholiday  <- as.factor(bike$isholiday)
bike$isweekday  <- as.factor(bike$isweekday)
str(bike)
summary(bike)
# Modelling (75 training + 25 testing)
#If the objective is prediction,
#it is convenient to divide the sample 
#into 2 parts: 75% of the data will be used 
#to fit a model and the remaining 25% 
#to check the predictive capacity 
#of the fitted model.


set.seed(1) # to get always the same sample
library(caret)
trainIndex <- createDataPartition(bike$count, p = .75, list=FALSE) #list=FALSE is to not to get a list and just an array
bike.train <- bike[trainIndex,]
bike.test  <- bike[-trainIndex,]

nrow(bike.train)
nrow(bike.test)
(nrow(bike.train) + nrow(bike.test)) == nrow(bike) #Must be TRUE

#We propose a possible regression model using the *lm* function:

#Fitting the model  (season and isweekend no included to avoid multicolinearity)
bike.lm <- lm(data = bike.train, 
              count ~ month + weekday + hour + temperature 
              + humidity + windspeed + weathertype)
summary(bike.lm) # show results

library(report)
report(bike.lm)

#We note that there is one variables 
#that is not significant at 0.05: *windspeed*. 

#The *step* function allows us to obtain the model 
#with the significant variables, 
#discarding those that are not:

bike.lm.step <- step(bike.lm)
summary(bike.lm.step) # show results
#windspeed disappear
report(bike.lm.step)

coefficients(bike.lm.step) # model coefficients
confint(bike.lm.step, level=0.95) # CIs for model parameters 

#Anova is useful to compare models (The models have to be nested). 
#For example, this model has less covariates than the 
#original one
bike.lm.2 <- step(lm(data = bike.train, 
                     count ~ month + weekday + hour + temperature + humidity))
anova(bike.lm.step,bike.lm.2)
report(bike.lm.2)

#the p-value says that there are differences between both models
#and the bike.lm.step model (Model 2) is the best 
#because has less RSS (residual sum of squares)

#Diagnostic Plots
#Diagnostic plots provide checks for heteroscedasticity, 
#normality, and influential observations.

#par(mfrow=c(2,2))  # optional 4 graphs/page 
#par(mar=c(3,3,3,3)) #If you get an error "Error in plot.new() : figure margins too large"
plot(bike.lm.step)
#par(mfrow=c(1,1)) 
#The top 2 graphs are to check 
#if residual are similar to normal: they are good.
#the left-bottom graph: we don't use it
#the right-bottom graph: to see outliers

#To know more: https://www.statmethods.net/stats/regression.html

#We can compare, using the 25% test set, 
#the number of rents in this test set (in black) 
#with the prediction of that number (in red) 
#that results from the fitted model:

#Let's predict 
predictions.test <- predict(bike.lm.step, newdata = bike.test)
head(cbind(predictions.test,bike.test$count))

#Difficult to see, better plot it
plot(bike.test$count, main = "Linear Model", ylab = "Test Set Rental Count", pch = 20)
points(predictions.test, col = "red", pch = 20)


###### Logistic regression (glm command)
## binary variable: isweekday
table(bike.train$isweekday)

bike.glm <- step(glm(data = bike.train, 
                     isweekday ~ count + month + weekday + hour + temperature 
                     + humidity + windspeed + weathertype,
                     family="binomial"))
summary(bike.glm)
report(bike.glm)

#And we would the same diagnostics, prediction,etc


#Using the library "performance" to compare performances among models
library(performance)

bike.lm.1 <- lm(data = bike.train, 
                count ~ month + weekday + hour + temperature 
                + humidity + windspeed + weathertype)
bike.lm.2 <- lm(data = bike.train, 
                count ~ month + weekday + hour + temperature 
                + humidity)

bike.lm.3 <- lm(data = bike.train, 
                count ~ month + weekday + hour + temperature)

model_performance(bike.lm.1)
compare_performance(bike.lm.1,bike.lm.2,bike.lm.3)



####Exercise 1.4 
library(ISLR)
?Auto
data(Auto)
str(Auto)
summary(Auto)

# i. Plot mpg vs. horsepower. What do you see?
# ii. Fit a simple linear regression model where the response variable is mpg 
#and the independent variable is horsepower. What is the parameter value of
#the variable horsepower?




