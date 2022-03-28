install.packages("rpart")
install.packages("mlbench")
library(rpart)
library(mlbench)


res <- data("Ionosphere")
print(res)

#(num.elems <- nrow(spam7))
#(train.num.elems <- round(0.8 * num.elems,0)) #80% training, 20% test
# (test.num.elems <- num.elems-train.num.elems)
# train.index <- sort(sample(x=1:num.elems,size=train.num.elems, 
#replace=FALSE))