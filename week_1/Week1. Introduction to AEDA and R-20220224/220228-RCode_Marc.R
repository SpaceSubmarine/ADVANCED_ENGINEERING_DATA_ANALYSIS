
getwd()
setwd("D:/ESEIAAT/Data_Analysis/week_1/Week1. Introduction to AEDA and R-20220224")
gwt()

#suma normal
sum(2,3)

#plot
plot(5,5,"h")
plot(type="h", x=5, y=5)
note <- sum(2,3)
note

#?mean
#??anova

#   install.packages("Hmisc")
#call package Hmisc
library(Hmisc)

#Vector
v<-c(1,2)
v


str(v)


#Matrix
m <- matrix(c(1,2,3,4), ncol = 2)
m

#DataFrame
df <- data.frame (v1=c(1,2), v2=c("a", "b"))
df

#list
l <- list(v, m, df)
l

#asigna nombres a las listas
l<-list("vector"=v,"matrix"=m,"dataframe"=df)     #DUDA LINIA 45
l

#subsetting
l$v[1]
l$v[1]<-4
l$"vector"           #==================DUDA: SE PUEDE USAR STR PARA LLAMAR?
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


#presenta mejor los datos con formato de tabla
#Los "h" y "d" son los headers de la tabla y la siguiente fila son las cantidades
table(gender)


#ls and objects return a vector of character strings giving the names of the objects
gender
ls()


gender
length(age)


class(gender)
"character"[1]


#NAN (Not A Number) es lo mismo que NA (Not Aviable)?
Data<-NA
data<-NaN

is.na(Data)
is.na(data)

Data<-2
data<-4

Data==data
summary(l)


#   Length Class      Mode   
#v  2      -none-     numeric
#m  4      -none-     numeric
#df 2      data.frame list   

#Parece que funciona igual (puede tener alguna utilidad para no liarse?...)

summary(l$"vector")
summary(l$v)



#function to print x raised to the power y
pow <- function(x, y) { 
     result <- x^y 
     print(result) }
pow(2,3)

data<-c("a",'b')
data

#setwd("/Users/crist")
#GET WORK DIRECTORY (pues la ruta :D )
getwd()
setwd()
save(Rcode-V02.R, )