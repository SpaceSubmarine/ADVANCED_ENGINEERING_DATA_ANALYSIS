library(rpart)
library(mlbench)
library(ggplot2)
library(caret)
library(caTools)
library(rpart)
library(randomForest)

#Work Directory (change if needed)
getwd()
setwd("D:/ESEIAAT/Data_Analysis/EXERCICE-2")
data("Ionosphere")
#Obtained the data from the mlbench package
dataset <- Ionosphere

#Elimination of outliers through plotbox check, the first one and last one
#are binary and qualitative so we don't use plotbox and the second one 
#is all 0s so we erase it
summary(dataset)
datasetclean <- subset(dataset, select = -c(V2))

outlierx3<-boxplot.stats(datasetclean$V3)$out
outlierx3rows<-which(datasetclean$V3 %in% c(outlierx3))
outlierx3rows
datasetclean_short<- dataset[-which(datasetclean$V3 %in% outlierx3),]

outlierx4<-boxplot.stats(datasetclean$V4)$out
outlierx4rows<-which(datasetclean$V4 %in% c(outlierx4))
outlierx4rows
dataset_short<- dataset[-which(datasetclean$V4 %in% outlierx4),]

outlierx5<-boxplot.stats(datasetclean$V5)$out
outlierx5rows<-which(datasetclean$V5 %in% c(outlierx5))
outlierx5rows
dataset_short<- dataset[-which(datasetclean$V5 %in% outlierx5),]

outlierx6<-boxplot.stats(datasetclean$V6)$out
outlierx6rows<-which(datasetclean$V6 %in% c(outlierx6))
outlierx6rows
dataset_short<- dataset[-which(datasetclean$V6 %in% outlierx6),]

outlierx7<-boxplot.stats(dataset$V7)$out
outlierx7rows<-which(dataset$V7 %in% c(outlierx7))
outlierx7rows
dataset_short<- dataset[-which(dataset$V7 %in% outlierx7),]

outlierx8<-boxplot.stats(dataset$V8)$out
outlierx8rows<-which(dataset$V8 %in% c(outlierx8))
outlierx8rows
dataset_short<- dataset[-which(dataset$V8 %in% outlierx8),]

outlierx9<-boxplot.stats(dataset$V9)$out
outlierx9rows<-which(dataset$V9 %in% c(outlierx9))
outlierx9rows
dataset_short<- dataset[-which(dataset$V9 %in% outlierx9),]

outlierx10<-boxplot.stats(dataset$V10)$out
outlierx10rows<-which(dataset$V10 %in% c(outlierx10))
outlierx10rows
dataset_short<- dataset[-which(dataset$V10 %in% outlierx10),]

outlierx11<-boxplot.stats(dataset$V11)$out
outlierx11rows<-which(dataset$V11 %in% c(outlierx11))
outlierx11rows
dataset_short<- dataset[-which(dataset$V11 %in% outlierx11),]

outlierx12<-boxplot.stats(dataset$V12)$out
outlierx12rows<-which(dataset$V12 %in% c(outlierx12))
outlierx12rows
dataset_short<- dataset[-which(dataset$V12 %in% outlierx12),]

outlierx13<-boxplot.stats(dataset$V13)$out
outlierx13rows<-which(dataset$V13 %in% c(outlierx13))
outlierx13rows
dataset_short<- dataset[-which(dataset$V13 %in% outlierx13),]

outlierx14<-boxplot.stats(dataset$V14)$out
outlierx14rows<-which(dataset$V14 %in% c(outlierx14))
outlierx14rows
dataset_short<- dataset[-which(dataset$V14 %in% outlierx14),]

outlierx15<-boxplot.stats(dataset$V15)$out
outlierx15rows<-which(dataset$V15 %in% c(outlierx15))
outlierx15rows
dataset_short<- dataset[-which(dataset$V15 %in% outlierx15),]

outlierx16<-boxplot.stats(dataset$V16)$out
outlierx16rows<-which(dataset$V16 %in% c(outlierx16))
outlierx16rows
dataset_short<- dataset[-which(dataset$V16 %in% outlierx16),]

outlierx17<-boxplot.stats(dataset$V17)$out
outlierx17rows<-which(dataset$V17 %in% c(outlierx17))
outlierx17rows
dataset_short<- dataset[-which(dataset$V17 %in% outlierx17),]

outlierx18<-boxplot.stats(dataset$V18)$out
outlierx18rows<-which(dataset$V18 %in% c(outlierx18))
outlierx18rows
dataset_short<- dataset[-which(dataset$V18 %in% outlierx18),]

outlierx19<-boxplot.stats(dataset$V19)$out
outlierx19rows<-which(dataset$V19 %in% c(outlierx19))
outlierx19rows
dataset_short<- dataset[-which(dataset$V19 %in% outlierx19),]

outlierx20<-boxplot.stats(dataset$V20)$out
outlierx20rows<-which(dataset$V20 %in% c(outlierx20))
outlierx20rows
dataset_short<- dataset[-which(dataset$V20 %in% outlierx20),]

outlierx21<-boxplot.stats(dataset$V21)$out
outlierx21rows<-which(dataset$V21 %in% c(outlierx21))
outlierx21rows
dataset_short<- dataset[-which(dataset$V21 %in% outlierx21),]

outlierx22<-boxplot.stats(dataset$V22)$out
outlierx22rows<-which(dataset$V22 %in% c(outlierx22))
outlierx22rows
dataset_short<- dataset[-which(dataset$V22 %in% outlierx22),]

outlierx23<-boxplot.stats(dataset$V23)$out
outlierx23rows<-which(dataset$V23 %in% c(outlierx23))
outlierx23rows
dataset_short<- dataset[-which(dataset$V23 %in% outlierx23),]

outlierx24<-boxplot.stats(dataset$V24)$out
outlierx24rows<-which(dataset$V24 %in% c(outlierx24))
outlierx24rows
dataset_short<- dataset[-which(dataset$V24 %in% outlierx24),]

outlierx25<-boxplot.stats(dataset$V25)$out
outlierx25rows<-which(dataset$V25 %in% c(outlierx25))
outlierx25rows
dataset_short<- dataset[-which(dataset$V25 %in% outlierx25),]

outlierx26<-boxplot.stats(dataset$V26)$out
outlierx26rows<-which(dataset$V26 %in% c(outlierx26))
outlierx26rows
dataset_short<- dataset[-which(dataset$V26 %in% outlierx26),]

outlierx27<-boxplot.stats(dataset$V27)$out
outlierx27rows<-which(dataset$V27 %in% c(outlierx27))
outlierx27rows
dataset_short<- dataset[-which(dataset$V27 %in% outlierx27),]

outlierx28<-boxplot.stats(dataset$V28)$out
outlierx28rows<-which(dataset$V28 %in% c(outlierx28))
outlierx28rows
dataset_short<- dataset[-which(dataset$V28 %in% outlierx28),]

outlierx29<-boxplot.stats(dataset$V29)$out
outlierx29rows<-which(dataset$V29 %in% c(outlierx29))
outlierx29rows
dataset_short<- dataset[-which(dataset$V29 %in% outlierx29),]

outlierx30<-boxplot.stats(dataset$V30)$out
outlierx30rows<-which(dataset$V30 %in% c(outlierx30))
outlierx30rows
dataset_short<- dataset[-which(dataset$V30 %in% outlierx30),]

outlierx31<-boxplot.stats(dataset$V31)$out
outlierx31rows<-which(dataset$V31 %in% c(outlierx31))
outlierx31rows
dataset_short<- dataset[-which(dataset$V31 %in% outlierx31),]

outlierx32<-boxplot.stats(dataset$V32)$out
outlierx32rows<-which(dataset$V32 %in% c(outlierx32))
outlierx32rows
dataset_short<- dataset[-which(dataset$V32 %in% outlierx32),]

outlierx33<-boxplot.stats(dataset$V33)$out
outlierx33rows<-which(dataset$V33 %in% c(outlierx33))
outlierx33rows
dataset_short<- dataset[-which(dataset$V33 %in% outlierx33),]

outlierx34<-boxplot.stats(dataset$V34)$out
outlierx34rows<-which(dataset$V34 %in% c(outlierx34))
outlierx34rows
dataset_short<- dataset[-which(dataset$V34 %in% outlierx34),]

dataset_short

#Partition for training and test purposes
set.seed(100)
dataset_short_split<-dataset_short
dataset_short_split$spl <- c(FALSE)
dataset_short_split$spl=sample.split(dataset_short_split$spl,SplitRatio=0.8)
train=subset(dataset_short_split, dataset_short_split$spl==TRUE)
test=subset(dataset_short_split, dataset_short_split$spl==FALSE)

#Classification tree
train2<-train
train2 <- subset(train, select = -c(spl))

train2.rpart <- rpart(formula= Class ~ ., method = "class", data=train2)
plot(train2.rpart, uniform = FALSE, margin = 0.1)
text(train2.rpart,cex=0.5, use.n=TRUE)

train2.rpart

#One standard deviation rule and pruning
printcp(train2.rpart)

xerrorcut<- 0.27027+(1*0.057686)
xerrorcut

prunedtrain2<-train2.rpart
prunedtrain2<-prune(prunedtrain2, cp=0.01)
plot(prunedtrain2, uniform = FALSE, margin = 0.1)
text(prunedtrain2,cex=0.5, use.n=TRUE)

#Prediction and accuracy
predicted <- round(predict(train2.rpart,test),4)*100
predicted.vs.real <- cbind(predicted, test$Class)
predicted.vs.real

predictedaccuracy <- predict(train2.rpart, type = "class")
table(predictedaccuracy)
confusiontabletree<-table(predictedaccuracy, train2$Class)
confusiontabletree
accuracy<-sum(diag(confusiontabletree)) / sum(confusiontabletree)
accuracy

test2 <- subset(test, select = -c(spl))
test2.rpart <- rpart(formula= Class ~ ., method = "class", data=test2)
test2.rpart
plot(test2.rpart, uniform = FALSE, margin = 0.1)
text(test2.rpart,cex=0.5, use.n=TRUE)

predictedaccuracytest <- predict(test2.rpart, type = "class")
table(predictedaccuracytest)
confusiontabletreetest<-table(predictedaccuracytest, test2$Class)
confusiontabletreetest
accuracytest<-sum(diag(confusiontabletreetest)) / sum(confusiontabletreetest)
accuracytest

#Random Forest
train2.rf<-randomForest(Class~., data=train2)
train2.rf

test2.rf<-randomForest(Class~., data=test2)
test2.rf

plot(train2.rf, uniform = FALSE, margin = 0.1)

