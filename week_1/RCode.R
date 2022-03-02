sum(2,3)
plot(5,5,"h")
plot(type="h", x=5, y=5)
note <- sum(2,3)
note

?mean
??anova
#this is a sum
sum(2,3)
install.packages("Hmisc")
library(Hmisc)
v<-c(1,2)
v
str(v)
m <- matrix(c(1,2,3,4), ncol = 2)
m
df <- data.frame (v1=c(1,2), v2=c("a", "b"))
df
l <- list(v, m, df)
l
l<-list(v=v,m=m,df=df)
l
l$v[1]
l$v[1]<-4
l$v
l$v<-c(2,3)
l$v
m[1,2]
m[1,2]<-5
m[1,2]
v[2]
v[2]<-3
v[2]
df[1,2]
df[1,2]<-"z"
df
?median
help.search("histogram")
#Creating a numerical vector and calculating its mean
age <- c(20,21,20,22,23,20,25,26,20,21)
age.mean <- mean(age)
age.mean
#Creating a character vector and making the frequency table
gender <- c("h","h","h","h","h","h","h","d","d","d")
table(gender)
gender
ls()
gender
length(age)
[class(gender)
[1] "character"
Data<-NA
data<-NaN
is.na(Data)
is.na(data)
Data<-2
data<-4
Data==data
summary(l)
   Length Class      Mode   
v  2      -none-     numeric
m  4      -none-     numeric
df 2      data.frame list   
summary(l$v)
 
#function to print x raised to the power y
pow <- function(x, y) { 
     result <- x^y 
     print(result) }
pow(2,3)

data<-c("a",'b')
data

#setwd("/Users/crist")
getwd()
