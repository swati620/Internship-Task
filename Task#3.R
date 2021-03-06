#K-means clustering: In this task we use iris data set to predict the optimum number of
#clusters and represent it visually using R-programming
library(ggplot2)

#Visualizing iris inbuilt data set with the help of ggplot function

View(iris)
ggplot(iris,aes(Petal.Length,Petal.Width, color= Species))+
 geom_point()


# Using the elbow method to find the optimal number of clusters
set.seed(220)
wcss = vector()      #null vector
for (i in 1:10) wcss[i] = sum(kmeans(iris[,3:4], i)$withinss)
plot(1:10,
     wcss, 
     type = 'b',                     #line and bubble
     main = paste('The Elbow Method'),
     xlab = 'Number of clusters',
     ylab = 'WCSS')


# Fitting K-Means to the dataset
set.seed(200)

kmeans = kmeans(x = iris[,3:4], centers = 3, nstart=20)
kmeans

#Viewing the table of no of clusters wrt to species

table(iris$Species, kmeans$cluster)
y_kmeans = kmeans$cluster

# Visualising the clusters
library(cluster)
clusplot(iris[,3:4],
         y_kmeans,
         lines = 0,
         shade = FALSE,
         color = TRUE,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of customers'),
         xlab = 'Annual Income',
         ylab = 'Spending Score')


#using ggplot

kmeans$cluster=as.factor(kmeans$cluster)

ggplot(iris,aes(Petal.Length,Petal.Width, color= kmeans$cluster))+ geom_point()
+geom_smooth()

     
