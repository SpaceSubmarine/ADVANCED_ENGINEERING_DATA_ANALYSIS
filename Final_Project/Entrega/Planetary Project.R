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
library(dplyr)
library(cluster)
library(ggplot2)
library(factoextra)
library(NbClust)
library(mclust)

## Work Directory (change if needed)
getwd()
setwd("D:/ESEIAAT/Data_Analysis/Final_Project")
plantetary_df <- read.csv("PS_2022.03.25_12.15.35.csv")


# Here we only want specific data, therefore we need to remove the excess.
data_del <- c("default_flag","pl_radj", "pl_bmassj", "pl_bmassprov", "pl_insol",
              "ttv_flag", "pl_insol", "st_teff",
              "st_rad", "st_mass", "st_met",
               "st_logg", "sy_vmag", "sy_kmag", "sy_gaiamag")

planetary_short_df <- plantetary_df[ , !(names(plantetary_df)%in%data_del)]

## here we delete rows with empty or NA values (tidyr library)

drop_na_df <- planetary_short_df
drop_na_df[drop_na_df == ""] <- NA
drop_na_df <- drop_na_df %>% drop_na(pl_name)
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

pl_clean_df<-drop_na_df

################################################################################
#Outliers






################################################################################
#class of "plantetary_df$default_flag"
class(pl_clean_df$pl_controv_flag)

################################################################################
#we need to convert this column to a binary 

pl_clean_df$pl_controv_flag = as.logical(pl_clean_df$pl_controv_flag)
pl_clean_df_2<-pl_clean_df

#Remove outliers
#Some are not checked because the outliers are interesting (like the Controversial flag) 
#or because thy cannot be outliers (like discovery center)

#outlierx2<-boxplot.stats(pl_clean_df_2$sy_snum)$out
#outlierx2rows<-which(pl_clean_df_2$sy_snum %in% c(outlierx2))
#outlierx2rows
#pl_clean_df_2<- pl_clean_df_2[-which(pl_clean_df_2$sy_snum %in% outlierx2),]

#outlierx3<-boxplot.stats(pl_clean_df_2$sy_pnum)$out
#outlierx3rows<-which(pl_clean_df_2$sy_pnum %in% c(outlierx3))
#outlierx3rows
#pl_clean_df_2<- pl_clean_df_2[-which(pl_clean_df_2$sy_pnum %in% outlierx3),]

#outlierx4<-boxplot.stats(pl_clean_df_2$discoverymethod)$out
#outlierx4rows<-which(pl_clean_df_2$discoverymethod %in% c(outlierx4))
#outlierx4rows
#pl_clean_df_2<- pl_clean_df_2[-which(pl_clean_df_2$discoverymethod %in% outlierx4),]

#outlierx5<-boxplot.stats(pl_clean_df_2$disc_year)$out
#outlierx5rows<-which(pl_clean_df_2$disc_year %in% c(outlierx5))
#outlierx5rows
#pl_clean_df_2<- pl_clean_df_2[-which(pl_clean_df_2$disc_year %in% outlierx5),]

#outlierx6<-boxplot.stats(pl_clean_df_2$disc_facility)$out
#outlierx6rows<-which(pl_clean_df_2$disc_facility %in% c(outlierx6))
#outlierx6rows
#pl_clean_df_2<- pl_clean_df_2[-which(pl_clean_df_2$disc_facility %in% outlierx6),]

#outlierx7<-boxplot.stats(pl_clean_df_2$pl_controv_flag)$out
#outlierx7rows<-which(pl_clean_df_2$pl_controv_flag %in% c(outlierx7))
#outlierx7rows
#pl_clean_df_2<- pl_clean_df_2[-which(pl_clean_df_2$pl_controv_flag %in% outlierx7),]

outlierx8<-boxplot.stats(pl_clean_df_2$pl_orbper)$out
outlierx8rows<-which(pl_clean_df_2$pl_orbper %in% c(outlierx8))
outlierx8rows
pl_clean_df_2<- pl_clean_df_2[-which(pl_clean_df_2$pl_orbper %in% outlierx8),]

outlierx9<-boxplot.stats(pl_clean_df_2$pl_orbsmax)$out
outlierx9rows<-which(pl_clean_df_2$pl_orbsmax %in% c(outlierx9))
outlierx9rows
pl_clean_df_2<- pl_clean_df_2[-which(pl_clean_df_2$pl_orbsmax %in% outlierx9),]

#No outliers in here
outlierx10<-boxplot.stats(pl_clean_df_2$pl_rade)$out
outlierx10rows<-which(pl_clean_df_2$pl_rade %in% c(outlierx10))
outlierx10rows
#pl_clean_df_2<- pl_clean_df_2[-which(pl_clean_df_2$pl_rade %in% outlierx10),]

outlierx11<-boxplot.stats(pl_clean_df_2$pl_bmasse)$out
outlierx11rows<-which(pl_clean_df_2$pl_bmasse %in% c(outlierx11))
outlierx11rows
pl_clean_df_2<- pl_clean_df_2[-which(pl_clean_df_2$pl_bmasse %in% outlierx11),]

outlierx12<-boxplot.stats(pl_clean_df_2$pl_orbeccen)$out
outlierx12rows<-which(pl_clean_df_2$pl_orbeccen %in% c(outlierx12))
outlierx12rows
pl_clean_df_2<- pl_clean_df_2[-which(pl_clean_df_2$pl_orbeccen %in% outlierx12),]

outlierx13<-boxplot.stats(pl_clean_df_2$pl_eqt)$out
outlierx13rows<-which(pl_clean_df_2$pl_eqt %in% c(outlierx13))
outlierx13rows
pl_clean_df_2<- pl_clean_df_2[-which(pl_clean_df_2$pl_eqt %in% outlierx13),]

#outlierx14<-boxplot.stats(pl_clean_df_2$st_spectype)$out
#outlierx14rows<-which(pl_clean_df_2$st_spectype %in% c(outlierx14))
#outlierx14rows
#pl_clean_df_2<- pl_clean_df_2[-which(pl_clean_df_2$st_spectype %in% outlierx14),]

outlierx15<-boxplot.stats(pl_clean_df_2$sy_dist)$out
outlierx15rows<-which(pl_clean_df_2$sy_dist %in% c(outlierx15))
outlierx15rows
pl_clean_df_2<- pl_clean_df_2[-which(pl_clean_df_2$sy_dist %in% outlierx15),]

#Scaling for clustering
pl_clean_df_2_scaled <- pl_clean_df_2
pl_clean_df_2_scaling <- pl_clean_df_2
pl_clean_df_2_noscaling <- pl_clean_df_2
pl_clean_df_2_scaling <- pl_clean_df_2[c(2,3,5,8,9,10,11,12,13,15)]
pl_clean_df_2_noscaling <- pl_clean_df_2[c(1,4,6,7,14)]

pl_clean_df_2_scaled <- scale(pl_clean_df_2_scaling)
pl_clean_df_2_scaled<- cbind.data.frame(pl_clean_df_2_noscaling, pl_clean_df_2_scaling)

#Model based clustering
pl_clean_df_2_scaled_Mcluster <- Mclust(pl_clean_df_2_scaled)
summary(pl_clean_df_2_scaled_Mcluster)
plot(pl_clean_df_2_scaled_Mcluster)

#PAM looking for 9 clusters because model based clustering points to 9 clusters being the
#best choice
pl_clean_df_2_scaled_PAM <- pam(pl_clean_df_2_scaled, 9)
summary(pl_clean_df_2_scaled_PAM)
plot(pl_clean_df_2_scaled_PAM, which.plots=2, main="")
plotPAMcluster <- cbind(pl_clean_df_2, Cluster = pl_clean_df_2_scaled_PAM$clustering)
plot(plotPAMcluster)
