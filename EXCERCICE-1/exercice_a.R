##  EXERCICE1 ##

#We read and explore the data set
setwd('D:/ESEIAAT/Data_Analysis/EXCERCICE-1')   
cars <- read.csv("cars2004.csv")
#dim(cars)
#head(cars)
#tail(cars)
#str(cars) 



# Description of the data set
# We can see a summary of the data, using the summary function 
##De aqui podemos sacar: Min, 1st, median, mean, 3rd, max y Nas de cada Columna
summary(cars) 


#Histogram of response variable
hist(cars$Horsepower)


#Let's check We can check the existing linear correlations 
#between the variables in the database:
library(corrplot)

cars.select <- data.frame(cars$Sports, cars$SUV, cars$Wagon, cars$Minivan,
                          cars$Pickup, cars$AWD,
                          cars$RWD, cars$Retail,
                          cars$Dealer, cars$Engine, cars$Cylinders,
                          cars$Horsepower, cars$CityMPG, cars$HighwayMPG,
                          cars$Weight, cars$WheelBase,
                          cars$Length, cars$Width,)
names(cars.select) <- c("Sports", "SUV", "Wagon", "Minivan", "Pickup", 
                        "AWD", "RWD", "Retail", "Dealer",
                        "Engine", "Cylinders", "Horsepower", "CityMPG",
                        "HighwayMPG", "Weight", "WheelBase", "Lenght",
                        "Width")
