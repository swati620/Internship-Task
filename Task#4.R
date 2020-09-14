#creating decision tree clasifier for Iris data set.
#Plotting the decision tree usingtwo different functions.
#(plot and fancyRpartplot)
# install if necessary
#install.packages('rpart')
#install.packages('rattle')
#install.packages("party")
# load libraries

library("party")
library("rpart")
library("rattle")

#Decision tree using ctree function
iris_ctree <- ctree(Species ~ Sepal.Length + Sepal.Width 
                    + Petal.Length + Petal.Width, data=iris)
print(iris_ctree)
plot(iris_ctree)
plot(iris_ctree, type="simple")

#Decision tree using rpart function
rpart <- rpart(Species ~ ., data=iris, method="class",)
rpart

# plot decision tree
fancyRpartPlot(rpart, main="Iris")

