## Advanced Engineering Data Analysis FINAL PROJECT 
## PLANETARY SYSTEMS DATA ANALYSIS

#Authors: 
# Marc Monclús Montalvez    Master's Degree in Space and Aeronautical Engineering
# Raúl García Gómez         Master's Degree in Industrial Engineering

#Professor:
# Daniel Fernandez Martinez

################################################################################
##### LEGEND
# This file was produced by the NASA Exoplanet Archive  http://exoplanetarchive.ipac.caltech.edu
# Fri Mar 25 12:15:35 2022
#
# See also: https://exoplanetarchive.ipac.caltech.edu/cgi-bin/TblView/nph-tblView?app=ExoTbls&config=PS
#
# User preference: *
#
# CONSTRAINT:  where (default_flag = 1)
# CONSTRAINT:  order by pl_rade desc
#
# COLUMN pl_name:        Planet Name
# COLUMN sy_snum:        Number of Stars
# COLUMN sy_pnum:        Number of Planets
# COLUMN discoverymethod: Discovery Method
# COLUMN disc_year:      Discovery Year
# COLUMN disc_facility:  Discovery Facility
# COLUMN pl_controv_flag: Controversial Flag
# COLUMN pl_orbper:      Orbital Period [days]
# COLUMN pl_orbsmax:     Orbit Semi-Major Axis [au])
# COLUMN pl_rade:        Planet Radius [Earth Radius]
# COLUMN pl_bmasse:      Planet Mass or Mass*sin(i) [Earth Mass]
# COLUMN pl_orbeccen:    Eccentricity
# COLUMN pl_eqt:         Equilibrium Temperature [K]
# COLUMN st_spectype:    Spectral Type
# COLUMN sy_dist:        Distance [parsec]

################################################################################

## Cleaning Data
rm(list = ls())

#Library - Packages import
library(tidyr)
library(mlbench)
library(ggplot2)
library(caret)
library(caTools)
library(rpart)

## Work Directory (change if needed)
getwd()
setwd("D:/ESEIAAT/Data_Analysis/Final_Project")
plantetary_df <- read.csv("PS_2022.03.25_12.15.35.csv")


# Here we only want specific data, therefore we need to reemove the exces.
data_del <- c("default_flag","pl_radj", "pl_bmassj", "pl_bmassprov", "pl_insol",
              "ttv_flag", "pl_insol", "st_teff",
              "st_rad", "st_mass", "st_met",
               "st_logg", "sy_vmag", "sy_kmag", "sy_gaiamag")

planetary_short_df <- plantetary_df[ , !(names(plantetary_df)%in%data_del)]

## here we delet rows with NA values (tidyr library)

drop_na_df <- planetary_short_df %>% drop_na(pl_name)
drop_na_df <- drop_na_df %>% drop_na(sy_snum)
drop_na_df <- drop_na_df %>% drop_na(sy_pnum)
drop_na_df <- drop_na_df %>% drop_na(discoverymethod)
drop_na_df <- drop_na_df %>% drop_na(disc_year)
drop_na_df <- drop_na_df %>% drop_na(disc_facility)
drop_na_df <- drop_na_df %>% drop_na(pl_controv_flag)
drop_na_df <- drop_na_df %>% drop_na(pl_orbper)
drop_na_df <- drop_na_df %>% drop_na(pl_orbsmax)
drop_na_df <- drop_na_df %>% drop_na(pl_rade)
drop_na_df <- drop_na_df %>% drop_na(pl_bmasse)
drop_na_df <- drop_na_df %>% drop_na(pl_orbeccen)
drop_na_df <- drop_na_df %>% drop_na(pl_eqt)
drop_na_df <- drop_na_df %>% drop_na(st_spectype)
drop_na_df <- drop_na_df %>% drop_na(sy_dist)

###Other methods that can be used:
#planetary_short2_df<-planetary_short1_df[complete.cases(planetary_short1_df$pl_orbper),]
#planetary_short_df[!is.na(planetary_short_df$pl_orbper)]


#after removing NA's we get a dataframe of 466 rows from 5005 observations

#drop_na_df

#OUTLIERS 9 numerical variables 

outlierx1<-boxplot.stats(drop_na_df$pl_orbper)$out
outlierx1rows<-which(drop_na_df$pl_orbper %in% c(outlierx1))
outlierx1rows
pl_clean_df<- drop_na_df[-which(drop_na_df$pl_orbper %in% outlierx1),]


outlierx2<-boxplot.stats(drop_na_df$pl_orbsmax)$out
outlierx2rows<-which(drop_na_df$pl_orbsmax %in% c(outlierx2))
outlierx2rows
pl_clean_df<- drop_na_df[-which(drop_na_df$pl_orbsmax %in% outlierx2),]


outlierx3<-boxplot.stats(drop_na_df$pl_rade)$out
outlierx3rows<-which(drop_na_df$pl_rade %in% c(outlierx3))
outlierx3rows
pl_clean_df<- drop_na_df[-which(drop_na_df$pl_rade %in% outlierx3),]


outlierx4<-boxplot.stats(drop_na_df$pl_bmasse)$out
outlierx4rows<-which(drop_na_df$pl_bmasse %in% c(outlierx4))
outlierx4rows
pl_clean_df<- drop_na_df[-which(drop_na_df$pl_bmasse %in% outlierx4),]


outlierx5<-boxplot.stats(drop_na_df$pl_orbeccen)$out
outlierx5rows<-which(drop_na_df$pl_orbeccen %in% c(outlierx5))
outlierx5rows
pl_clean_df<- drop_na_df[-which(drop_na_df$pl_orbeccen %in% outlierx5),]


outlierx6<-boxplot.stats(drop_na_df$pl_eqt)$out
outlierx6rows<-which(drop_na_df$pl_eqt %in% c(outlierx6))
outlierx6rows
pl_clean_df<- drop_na_df[-which(drop_na_df$pl_eqt %in% outlierx6),]


outlierx7<-boxplot.stats(drop_na_df$sy_dist)$out
outlierx7rows<-which(drop_na_df$sy_dist %in% c(outlierx7))
outlierx7rows
pl_clean_df<- drop_na_df[-which(drop_na_df$sy_dist %in% outlierx7),]


outlierx8<-boxplot.stats(drop_na_df$sy_snum)$out
outlierx8rows<-which(drop_na_df$sy_snum %in% c(outlierx8))
outlierx8rows
pl_clean_df<- drop_na_df[-which(drop_na_df$sy_snum %in% outlierx8),]


outlierx9<-boxplot.stats(drop_na_df$sy_pnum)$out
outlierx9rows<-which(drop_na_df$sy_pnum %in% c(outlierx9))
outlierx9rows
pl_clean_df<- drop_na_df[-which(drop_na_df$sy_pnum %in% outlierx9),]



#Partition for training and test purposes
set.seed(100)
dataset_short_split<-pl_clean_df
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

## sale error aqui












################################################################################
#class of "plantetary_df$default_flag"

class(plantetary_df$default_flag)

#No se hacerlo (Marc)
################################################################################
#we need to convert this column to a binary 
# bool_flag<-c(plantetary_df$default_flag)
# bool_flag
# 
# 
# 
# 
# 
# for(i in 1:nrow){
#   if(bool_flag[i]==1){
#     bool_flag[i]<-TRUE
#   } else {
#     bool_flag[i]<-FALSE
#   }
# 
# }
# 
# length(bool_flag)
