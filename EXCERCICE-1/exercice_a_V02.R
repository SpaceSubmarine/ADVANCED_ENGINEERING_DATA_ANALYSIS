library(datasets)
data("iris")
str(iris)

#The data set has 150 observations and 5 variables. First four variables are 
#numeric while the last variable is factor with 3 levels.

#Looking at the summary of the data set.
summary(iris)


#From the summary statistics, the numeric variables have different values and 
#scale. It's always good to normalize them .The factor variable has equal values 
#in each level.

### DATA PARTITION ###
library(caret)
set.seed(100)    #???????? para que sirve????
ind <- createDataPartition(iris$Species,p = 0.80,list = F)
train <- iris [ind,]
test <- iris[-ind,]

dim(train)

