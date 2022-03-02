#sum(2,3)


#plot(5,5,"h")


#install.packages("package_name")
#install.packages("Hmisc")

#library(package_name)

#First steps...................................

library(Hmisc)
v<- c(1,2)

m<- matrix(c(1,2,3,4), ncol = 2)

df <- data.frame(v1=c(1,2), v2=c("a","b"))

list_1 <- list(v, m, df)

list_2 <- list(v=v, m=m, df=df)
