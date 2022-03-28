##  EXERCICE1 ##

#We read and explore the data set
setwd('D:/ESEIAAT/Data_Analysis/EXCERCICE-1')   
cars <- read.csv("cars2004.csv")
dim(cars)
#head(cars)
#tail(cars)
#str(cars) 



# Description of the data set
# We can see a summary of the data, using the summary function 
##De aqui podemos sacar: Min, 1st, median, mean, 3rd, max y Nas de cada Columna
summary(cars) 

#Head in a table
cars %>% slice(c(1:5)) %>% 
  kbl() %>%
  kable_classic(full_width = F, html_font = "Cambria")

# As we can se the columns 2-8 are mostly empty with zeros and the las 2 have some NA
#We need to clean the data to get better plots!

#We can deal with it, but let's remove it.
cars <- cars[-grep("Sports", colnames(cars)), ]
cars <- cars[-grep("SUV", colnames(cars)), ]
cars <- cars[-grep("Wagon", colnames(cars)), ]
#NO FUNCIONA

########################################################################### 
##  PLOT  ##
#Now we have all events in the same direction and all are numeric variables. 
#Therefore, we can graph scatter plots in pairs.
Horsepower <- which(colnames(cars) == "Horsepower")
plot(cars[, -Horsepower])

#and the correlation matrix (as all attributes are numeric)
round(cor(cars[,-Horsepower]), 2) %>% 
  kbl() %>%
  kable_classic(full_width = F, html_font = "Cambria")








################################################################################
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
                          cars$Length, cars$Width)
names(cars.select) <- c("Sports", "SUV", "Wagon", "Minivan", "Pickup", 
                        "AWD", "RWD", "Retail", "Dealer",
                        "Engine", "Cylinders", "Horsepower", "CityMPG",
                        "HighwayMPG", "Weight", "WheelBase", "Lenght",
                        "Width")
################################################################################

M<-cor(cars.select)
corrplot(M, method="ellipse")
#Display the correlation coefficient 
corrplot(M, method="number")

#There are missings



