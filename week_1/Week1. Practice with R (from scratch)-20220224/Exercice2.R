####################################################################
# Problem 1.2
####################################################################
# 1
setwd('D:/ESEIAAT/Data_Analysis/week_1/Week1. Practice with R (from scratch)-20220224')     



#Guardamos la variable de "datos2" con el contenido del arvhivo txt asignando 
#un header
# para ello utilizamos la funcion   "read.table"  
#los separadores (funcion "sep") son TABULACIONES (\t) en R
#los decimales en este archivo txt son  puntos por ello:   dec="."

### na.strings="@" no se que es lo que hace exactamente #######################
### stringsAsFactors = TRUE         TAMPOCO ENTIENDO MUY BIEN
datos2 <- read.table('flights.txt',header=TRUE,sep="\t",dec=".",
                     na.strings="@", stringsAsFactors = TRUE)


#Mostramos los primeros registros (son 6 aunque en python creo que son 5...)
head(datos2)

###############################################################################
#You can use the argument na.rm = TRUE to exclude missing values when 
#calculating descriptive statistics in R.

#Aplicamos la STANDARD DEVIATION en "datos2" utilizando $ para referirnos a la 
#columna "air_time".... 
#pero nos saltamos todos esos valores NA (not available)
sd(datos2$air_time,na.rm=TRUE) 


#The Interquartile Range
IQR(datos2$air_time,na.rm=TRUE)

#Plot de barras 
hist(datos2$air_time)

#Un plot raro
boxplot(datos2$air_time)

#Plot que hay que mirar... parecen rangos airtime para destinos...
boxplot(datos2$air_time~datos2$dest,las=2,cex.axis=0.5)
abline(v=seq(1,100,2),col='grey',lty=2)

# 2
#Hacer una tabla con el recuento de cada origen disponible en la columna
table(datos2$origin)
carriers_table<-table(datos2$carrier)# invencion propia

#AQUI TE DA PORCENTAJES DE TABLA (MUY TOP)
prop.table(table(datos2$origin))
barplot(table(datos2$origin))


#INVENCION PROPIA======================================================
library(RColorBrewer) # libreria para colores de plots
coul <- brewer.pal(5, "Set2") # investigar mejor los colores
prop_carrier<-prop.table(table(datos2$carrier))
prop_carrier<-prop_carrier*100    #pasamos a porcentaje
prop_carrier
barplot(prop_carrier,ylab="Flights proportion in %",xlab="Carrier",col=coul)


###################DUDAS#######################################################
# DUDA                                     ACCION        COMANDO

#Que es la desviacion estandard?...........REPASAR       sd
#Que es el Interquartile Range?............Apuntes       IQR
#Mirar el blot de boxplot, el complejo.....GOOGLE o PROFE

