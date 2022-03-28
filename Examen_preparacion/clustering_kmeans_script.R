#https://www.youtube.com/watch?v=7AFuL-1Q8eg&t=2s

#Remove previous Data/Plots
rm(list = ls())
dev.off()

library(tidyverse)
library(cluster)
library(factoextra)
library(NbClust)

df <- USArrests

#normalizar las funciones
df <- scale(df)

#para saber si el dataframe es susceptible a un cluster analisis usamos get_dist
m.distance <- get_dist(df, method="euclidean")
fviz_dist(m.distance, gradient = list(low="blue", mid = "white", high="red"))

#las zonas se ven clusterizables


#estimar el número de clústers (lo complicado)
#Elbow, silhouette o gasp_stat method

#aqui tecnicamente observaremos que el mejor es donde hay mayor variancia 
#en el "codo" de la grafica

fviz_nbclust(df,kmeans, method = "wss") # este nos dice que es el 2 o 4... no muy claro
fviz_nbclust(df,kmeans, method = "silhouette")
#el metodo de la silueta nos indica en este caso dos clusters
fviz_nbclust(df,kmeans, method = "gap_stat")
#gap_stat tambien nos indica que hay 2 clusters 

#aunque son las formas mas tipicas, suele ser mejor utilizar mas metodos 
#para elegir el numero de clústers


################################################################################
#funcion que calcula 30 tipos de clusstering:

#Calculo del numero de clusters
resnumclust <- NbClust(df, distance = "euclidean", min.nc = 2, max.nc = 10,
                       method = "kmeans", index = "alllong")


#visualizacion del numero optimo de clusters en base a los diferentes modelos
fviz_nbclust(resnumclust)


#creamos una lista donde se ven en que clúster ha quedado cada estado de USA
k2 <- kmeans(df, centers = 2, nstart =25)
k2 #sale que el cluster 1 es el mas peligroso
str(k2)


#plotear los clusters
fviz_cluster(k2, data = df)
#lot de cluster con elipse euclidea y centroide
fviz_cluster(k2, data = df, ellipse.type = "euclid", repel = TRUE,star.plot = TRUE)
fviz_cluster(k2, data = df, ellipse.type = "norm")
fviz_cluster(k2, data = df, ellipse.type = "norm", palette = "Set2")



#Cluster Dendogram (diagrama en arbol)
res2<- hcut(df, k = 2, stand = TRUE)
fviz_dend(res2, tect =TRUE, cex = 0.5,
          k_colors =c("red", "blue"))  
  

#lo mismo pero en k=4
res2<- hcut(df, k = 4, stand = TRUE)
fviz_dend(res2, tect =TRUE, cex = 0.5,
          k_colors =c("red", "blue"))  
  
  
  
#pasar los clusters al DF inicial para trabajar con ellos
df<- USArrests
df
df$clus<-as.factor(k2$cluster) #añadimos los clusters del k2 en el df
df

#enfatizamos que df, no es una matriz sino un dataframe
df<-USArrests
df<-scale(df)
df<-as.data.frame(df)
df$clus<-as.factor(k2$cluster) 

#La variable cluster se va a declarar como un factor
#esto nos interesa para que no cambie
df$clus<-factor(df$clus)
data_long<- gather(df, caracteristica, valor, Murder:Rape, factor_key = TRUE)
data_long

ggplot(data_long, aes(factor(x = caracteristica), y = valor, group=clus, 
                      colour = clus))+
  stat_summary(fun =mean, geom = "pointrange", size =1)+
  stat_summary(geom="line")

#geom_point((aes(shape=clus)))
  
  
  