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
col_names<-names(cars)
col_names
length(col_names)


# ############################
borrar <- c("AWD","Sports", "SUV", "Wagon", "Minivan", "Pickup", "RWD", "Retail",
            "Dealer", "CityMPG", "HighwayMPG")
cars <- cars[ , !(names(cars)%in%borrar)]



#Checking and eliminating outliers
outlierx1<-boxplot.stats(cars$Sports)$out
outlierx1rows<-which(cars$Sports %in% c(outlierx1))
outlierx1rows
cars_short<- cars[-which(cars$Sports %in% outlierx1),]


outlierx2<-boxplot.stats(cars$SUV)$out
outlierx2rows<-which(cars$SUV %in% c(outlierx2))
outlierx2rows
cars_short<- cars[-which(cars$SUV %in% outlierx2),]


outlierx3<-boxplot.stats(cars$Wagon)$out
outlierx3rows<-which(cars$Wagon %in% c(outlierx3))
outlierx3rows
cars_short<- cars[-which(cars$Wagon %in% outlierx3),]


outlierx4<-boxplot.stats(cars$Minivan)$out
outlierx4rows<-which(cars$Minivan %in% c(outlierx4))
outlierx4rows
cars_short<- cars[-which(cars$Minivan %in% outlierx4),]


outlierx5<-boxplot.stats(cars$Pickup)$out
outlierx5rows<-which(cars$Pickup %in% c(outlierx5))
outlierx5rows
cars_short<- cars[-which(cars$Pickup %in% outlierx5),]


outlierx6<-boxplot.stats(cars$AWD)$out
outlierx6rows<-which(cars$AWD %in% c(outlierx6))
outlierx6rows
cars_short<- cars[-which(cars$AWD %in% outlierx6),]


outlierx7<-boxplot.stats(cars$RWD)$out
outlierx7rows<-which(cars$RWD %in% c(outlierx7))
outlierx7rows
cars_short<- cars[-which(cars$RWD %in% outlierx7),]


outlierx8<-boxplot.stats(cars$Retail)$out
outlierx8rows<-which(cars$Retail %in% c(outlierx8))
outlierx8rows
cars_short<- cars[-which(cars$Retail %in% outlierx8),]


outlierx9<-boxplot.stats(cars$Dealer)$out
outlierx9rows<-which(cars$Dealer %in% c(outlierx9))
outlierx9rows
cars_short<- cars[-which(cars$Dealer %in% outlierx9),]


outlierx10<-boxplot.stats(cars$Engine)$out
outlierx10rows<-which(cars$Engine %in% c(outlierx10))
outlierx10rows
cars_short<- cars[-which(cars$Engine %in% outlierx10),]



outlierx11<-boxplot.stats(cars$Cylinders)$out
outlierx11rows<-which(cars$Cylinders %in% c(outlierx11))
outlierx11rows
cars_short<- cars[-which(cars$Cylinders %in% outlierx11),]


outlierx12<-boxplot.stats(cars$Horsepower)$out
outlierx12rows<-which(cars$Horsepower %in% c(outlierx12))
outlierx12rows
cars_short<- cars[-which(cars$Horsepower %in% outlierx12),]


outlierx13<-boxplot.stats(cars$CityMPG)$out
outlierx13rows<-which(cars$CityMPG %in% c(outlierx13))
outlierx13rows
cars_short<- cars[-which(cars$CityMPG %in% outlierx13),]


outlierx14<-boxplot.stats(cars$HighwayMPG)$out
outlierx14rows<-which(cars$HighwayMPG %in% c(outlierx14))
outlierx14rows
cars_short<- cars[-which(cars$HighwayMPG %in% outlierx14),]


outlierx15<-boxplot.stats(cars$Weight)$out
outlierx15rows<-which(cars$Weight %in% c(outlierx15))
outlierx15rows
cars_short<- cars[-which(cars$Weight %in% outlierx15),]


outlierx16<-boxplot.stats(cars$WheelBase)$out
outlierx16rows<-which(cars$WheelBase %in% c(outlierx16))
outlierx16rows
cars_short<- cars[-which(cars$WheelBase %in% outlierx16),]


outlierx17<-boxplot.stats(cars$Length)$out
outlierx17rows<-which(cars$Length %in% c(outlierx17))
outlierx17rows
cars_short<- cars[-which(cars$Length %in% outlierx17),]

outlierx18<-boxplot.stats(cars$Width)$out
outlierx18rows<-which(cars$Width %in% c(outlierx18))
outlierx18rows
cars_short<- cars[-which(cars$Width %in% outlierx18),]


#table
#Head in a table
cars_short %>%
  kbl(caption = "Title") %>%
  kable_classic(full_width = F, html_font = "Cambria")

cars_short %>% slice(c(1:5)) %>% 
  kbl() %>%
  kable_classic(full_width = F, html_font = "Cambria")

cars_short %>% slice(c(1:20)) %>%
  kbl(caption = "Cars Head") %>%
  kable_classic(full_width = F, html_font = "Cambria")

#Correlation Matrix (need help)
Horsepower <- which(colnames(cars_short) == "Horsepower")





#No funciona!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#
# Partition using the number of cylinders
set.seed(100)
ind <- createDataPartition(cars_short$Cylinders,p=0.80,list = F)
train <- cars_short[ind,]
test <- cars_short[-ind,]

dim(train)

# #DATA EXPLORATORY PLOT
library(psych)
pairs.panels(train[,-5],gap=0,bg=c("red","blue","yellow")[train$cars_short],
             pch=21)



##############PCA using princomp#######################
#Ordenando por la columna 'privileges'
cars_ordered <- cars_short[order(cars_short$Horsepower, decreasing=TRUE), ]
cars_ordered%>%slice(c(1:20)) %>%
  kbl(caption = "Top 20 cars with the most Hoorsepower") %>%
  kable_classic(full_width = F, html_font = "Cambria")




#################NOT WORKING
# cars_def <- cars_short[, -Retail, -Dealer, -CityMPG, -HighwayMPG,]
# cars_def %>%
#   kbl(caption = "Provisional Title") %>%
#   kable_classic(full_width = F, html_font = "Cambria")
# 
# str(cars_short)
# 
# cars_pca <- princomp(cars_def, cor=TRUE)
# a1 <- cars_pca$Horsepower[,1]
# a1


#write.csv(Your DataFrame,"Path to export the DataFrame\\File Name.csv", row.names = FALSE)
write.csv(cars_short,"D:/ESEIAAT/Data_Analysis/EXCERCICE-1\\Cars_short.csv", row.names = FALSE)

borrar <- c("Name")
cars_short <- cars_short[ , !(names(cars_short)%in%borrar)]

cars_pca <- princomp(cars_short, cor=TRUE)
