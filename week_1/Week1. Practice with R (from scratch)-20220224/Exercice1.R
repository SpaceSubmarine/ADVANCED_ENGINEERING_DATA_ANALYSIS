##-- Problem 1.1:
# 1. Create a data.frame with the following data
#     brand model consumption
#      audi     A3     6.8
# volswagen   Polo     6.8
#       bmw     X5    12.5
#   renault megane     4.7
#      fiat  punto     5.0
# 2. Modify the consumption of the fiat punto a 4.5

#DATA FRAME CREATION
df_car <- data.frame(brand=c("audi","volswagen","bmw","renault","fiat"),
                   model=c("A3","Polo","X5","megane","punto"),
                  consumption=c(6.8,6.8,12.5,4.7,5.0))

#DATA FRAME MODFICIATION (CONSUMPTION IS IN THE 5th ROW)
df_car$consumption[5] <- 4.5
df_car