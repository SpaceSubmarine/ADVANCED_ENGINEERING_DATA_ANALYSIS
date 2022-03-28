#Libraries needed
library(MASS)
library(mda)
library(klaR)

#Work Directory (change if needed)
getwd()
setwd("D:/Uni/AEDA/Exercici 1")

#Using only first ten columns and column g
phonemeshort <- read.csv("phoneme.csv", header = TRUE)[ ,c('g', 'x.1', 'x.2', 'x.3', 'x.4', 'x.5', 'x.6', 'x.7', 'x.8', 'x.9', 'x.10')]
phonemeshort

#Checking and eliminating outliers
outlierx1<-boxplot.stats(phonemeshort$x.1)$out
outlierx1rows<-which(phonemeshort$x.1 %in% c(outlierx1))
outlierx1rows
phonemeshort<- phonemeshort[-which(phonemeshort$x.1 %in% outlierx1),]

outlierx2<-boxplot.stats(phonemeshort$x.2)$out
outlierx2rows<-which(phonemeshort$x.2 %in% c(outlierx2))
outlierx2rows
phonemeshort<- phonemeshort[-which(phonemeshort$x.2 %in% outlierx2),]

outlierx3<-boxplot.stats(phonemeshort$x.3)$out
outlierx3rows<-which(phonemeshort$x.3 %in% c(outlierx3))
outlierx3rows
phonemeshort<- phonemeshort[-which(phonemeshort$x.3 %in% outlierx3),]

outlierx4<-boxplot.stats(phonemeshort$x.4)$out
outlierx4rows<-which(phonemeshort$x.4 %in% c(outlierx4))
outlierx4rows
phonemeshort<- phonemeshort[-which(phonemeshort$x.4 %in% outlierx4),]

outlierx5<-boxplot.stats(phonemeshort$x.5)$out
outlierx5rows<-which(phonemeshort$x.5 %in% c(outlierx5))
outlierx5rows
phonemeshort<- phonemeshort[-which(phonemeshort$x.5 %in% outlierx5),]

outlierx6<-boxplot.stats(phonemeshort$x.6)$out
outlierx6rows<-which(phonemeshort$x.6 %in% c(outlierx6))
outlierx6rows
phonemeshort<- phonemeshort[-which(phonemeshort$x.6 %in% outlierx6),]

outlierx7<-boxplot.stats(phonemeshort$x.7)$out
outlierx7rows<-which(phonemeshort$x.7 %in% c(outlierx7))
outlierx7rows
phonemeshort<- phonemeshort[-which(phonemeshort$x.7 %in% outlierx7),]

outlierx8<-boxplot.stats(phonemeshort$x.8)$out
outlierx8rows<-which(phonemeshort$x.8 %in% c(outlierx8))
outlierx8rows
phonemeshort<- phonemeshort[-which(phonemeshort$x.8 %in% outlierx8),]

outlierx9<-boxplot.stats(phonemeshort$x.9)$out
outlierx9rows<-which(phonemeshort$x.9 %in% c(outlierx9))
outlierx9rows
phonemeshort<- phonemeshort[-which(phonemeshort$x.9 %in% outlierx9),]

outlierx10<-boxplot.stats(phonemeshort$x.10)$out
outlierx10rows<-which(phonemeshort$x.10 %in% c(outlierx10))
outlierx10rows
phonemeshort<- phonemeshort[-which(phonemeshort$x.10 %in% outlierx10),]
phonemeshort

#Comprobation 0 outliers
outlierx1<-boxplot.stats(phonemeshort$x.1)$out
outlierx1rows<-which(phonemeshort$x.1 %in% c(outlierx1))
outlierx1rows

#Analysis and plot
phonemeLDA<-lda(g~., data=phonemeshort)
phonemeLDA
plot(phonemeLDA)
phonemeLDA.data<-cbind(phonemeshort,predict(phonemeLDA)$x)
ggplot(phonemeLDA.data, aes(LD1,LD2,LD3,LD4)) + geom_point(aes(color=g))

phonemeQDA<-qda(g~., data=phonemeshort)
phonemeQDA
plot(phonemeQDA)
phonemeQDA.data<-cbind(phonemeshort,predict(phonemeQDA)$x)
ggplot(phonemeQDA.data, aes(LD1,LD2,LD3,LD4)) + geom_point(aes(color=g))

phonemeRDA<-rda(g~., data=phonemeshort)
phonemeRDA
plot(phonemeRDA)
phonemeRDA.data<-cbind(phonemeshort,predict(phonemeRDA)$x)
ggplot(phonemeRDA.data, aes(LD1,LD2,LD3,LD4)) + geom_point(aes(color=g))

phonemeMDA<-mda(g~., data=phonemeshort)
phonemeMDA
plot(phonemeMDA)
phonemeMDA.data<-cbind(phonemeshort,predict(phonemeMDA)$x)
ggplot(phonemeMDA.data, aes(LD1,LD2,LD3,LD4)) + geom_point(aes(color=g))
