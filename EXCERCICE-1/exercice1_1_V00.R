## Principal Components Analysis (PCA)
rm(list = ls())

library(dplyr)
library(kableExtra)
library(HSAUR3)
library(caret)

#Data File cars.csv
#Marc work Directory (yo can change it)
setwd('D:/ESEIAAT/Data_Analysis/EXCERCICE-1')   
cars <- read.csv("cars2004.csv")

######################### CLASS OF EACH COLUMN ##########################
Name_class<-class(cars$Name)
Sports_class<-class(cars$Sports)
SUV_class<-class(cars$SUV)
Wagon_class<-class(cars$Wagon)
Minivan_class<-class(cars$Minivan)
Pickup_class<-class(cars$Pickup)
AWD_class<-class(cars$AWD)
RWD_class<-class(cars$RWD)
Retail_class<-class(cars$Retail)
Dealer_class<-class(cars$Dealer)
Engine_class<-class(cars$Engine)
Cylinders_class<-class(cars$Cylinders)
Horsepower_class<-class(cars$Horsepower)
CityMPG_class<-class(cars$CityMPG)
HighwayMPG_class<-class(cars$HighwayMPG)
Weight_class<-class(cars$Weight)
WheelBase_class<-class(cars$WheelBase)
Length_class<-class(cars$Length)
Width_class<-class(cars$Width)

#Vector of the class of each row
col_class<-c(Name_class, Sports_class, SUV_class, 
             Wagon_class, Wagon_class, Minivan_class, 
             Pickup_class, AWD_class, RWD_class, Retail_class,
             Dealer_class, Engine_class, Cylinders_class, 
             Horsepower_class, CityMPG_class, HighwayMPG_class, 
             Weight_class, WheelBase_class, Length_class, Width_class)


#################### Data visualization #################################
#we can see that the first column is a "character" class
#we also see that this first column is not a variable 
#we have only 19 variables
length(col_class)
col_class
#summary(cars)

#data(cars)
dim(cars)

#table
#Head in a table
cars %>%
  kbl(caption = "Title") %>%
  kable_classic(full_width = F, html_font = "Cambria")

cars %>% slice(c(1:5)) %>% 
  kbl() %>%
  kable_classic(full_width = F, html_font = "Cambria")

cars %>% slice(c(1:5)) %>%
  kbl(caption = "Cars Head") %>%
  kable_classic(full_width = F, html_font = "Cambria")

#Correlation Matrix (need help)
Horsepower <- which(colnames(cars) == "Horsepower")





#No funciona!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#
#Data Partition using the number of cylinders
# set.seed(100)
# ind <- createDataPartition(cars$Cylinders,p=0.80,list = F)
# train <- cars[ind,]
# test <- cars[-ind,]

# dim(train)

# #DATA EXPLORATORY PLOT
# library(psych)
# pairs.panels(train[,-5],gap=0,bg=c("red","blue","yellow")[train$cars],
#              pch=21)




