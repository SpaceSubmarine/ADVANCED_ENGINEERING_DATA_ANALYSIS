#https://www.youtube.com/watch?v=XDzs3AgI024&list=PLN3jIazaJLCOZYugaFNzzSWgsz3_JLLQ4&index=8

#Remove previous Data/Plots
rm(list = ls())
dev.off()

#library
library(readxl)
library(stats)
library(textshape)

#database:
#https://github.com/cosmoduende/r-marvel-vs-dc
df<- read_excel('D:/ESEIAAT/Data_Analysis/Examen/recursos_PCA/r-marvel-vs-dc-main/dataset_shdb\\charactersStats.xlsx')
View(df)


############################################################################

respca<-prcomp(df, scale =TRUE) 
#obtendremos un error teniendo la base de datos asi, sin filtrar

#deben ser variables numericas y algunos superheroes duplicados
#toca limpiar la base de datos

#eliminamos nombres duplicados
df<-df[!duplicated(df$Name),]
#convertimos la columna nombres como ID
df<-textshape::column_to_rownames(df, loc = 1) #en la primera columna

#Nos cargamos la columna alignment "character" y total (porque si...)
df<-subset(df, select = -c(Alignment, Total))
#ahora tenemos la base de datos limpia



############################################################################

#prcomp() Forma rapida de implementar PCA sobre una matriz de datos
respca<-prcomp(df, scale=TRUE)
names(respca)
#svde=desviation, center=centroids

head(respca$sdev)
head(respca$rotation)[,1:5] # [1:5] limita el PC a PC5
head(respca$center)
head(respca$scale)
head(respca$x)

summary(respca)


#comprobemos la importancia del componente 1
#esto se lo pasamos a la base de datos original y nos cargamos Alignmentxx<-respca$x
xx<-as.data.frame(xx)
df$PC1<-xx$PC1
df$PC2<-xx$PC2


#df<-subset(df, select = -c(Alignement))