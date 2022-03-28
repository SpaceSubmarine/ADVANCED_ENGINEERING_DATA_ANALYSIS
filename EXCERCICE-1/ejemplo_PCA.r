## CLEAN ##
rm(list = ls())


## Libraries ##
library(dplyr)
library(kableExtra)
library(HSAUR3)


## Data Attachment ##
data(heptathlon) #where we obtaint this data??? from a library?
## Dimension Check
dim(heptathlon)


## Printing the table ##
heptathlon %>%
  kbl(caption = "Heptathlon results in 1988 Olympics held in Seoul") %>%
  kable_classic(full_width = F, html_font = "Cambria")


## Let's check a couple of people two see their results. ##
heptathlon[c(14,25),]


## Using dplyr we can use "slice" with select rows, and kbl ##
heptathlon %>% slice(c(14,25)) %>% 
  kbl() %>%
  kable_classic(full_width = F, html_font = "Cambria")



## You can observe that the scores of the different events 
## do not have the same direction, i.e., hurdles, run200m, and run800m. 
## Those three events the lower value the better. However, the other events 
## have a different direction (the more, the better).

## Thus, we change the direction of the hurdles, run200m, and run800m to 
## have all seven events in the same direction

heptathlon$hurdles <- with(heptathlon, max(hurdles)-hurdles)
heptathlon$run200m <- with(heptathlon, max(run200m)-run200m)
heptathlon$run800m <- with(heptathlon, max(run800m)-run800m)



#And print it again:
heptathlon %>% slice(c(14,25)) %>% 
  kbl() %>%
  kable_classic(full_width = F, html_font = "Cambria")



########################################################################### 
##  PLOT  ##
#Now we have all events in the same direction and all are numeric variables. 
#Therefore, we can graph scatter plots in pairs.
score <- which(colnames(heptathlon) == "score")
plot(heptathlon[, -score])



#and the correlation matrix (as all attributes are numeric)
round(cor(heptathlon[,-score]), 2) %>% 
  kbl() %>%
  kable_classic(full_width = F, html_font = "Cambria")


#Using the packages ggplot2 and GGally, we can do all last two things in one
library(ggplot2)
library(GGally)

ggpairs(heptathlon[, -score])


#What can you observe in the scatter plot?
heptathlon %>%
  kbl(caption = "Heptathlon results in 1988 Olympics held in Seoul") %>%
  kable_classic(full_width = F, html_font = "Cambria")



###################REMOVING ZERO################################
#Laura (PNG) (last row) is the outlier (values 0 in hurdles and run800m). 
#Check also the left-skewed tails in the density plots.

#We can deal with it, but let's remove it.
heptathlon <- heptathlon[-grep("PNG", rownames(heptathlon)), ]

#Note: the "grep" command searches for matches to argument "PNG" within each 
#element of a character vector "rownames(heptathlon)".

#And now check the scatter plots and correlation matrix again:
ggpairs(heptathlon[, -score])
