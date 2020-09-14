#simple linear regression: In this regression task we will predict the percentage of
#marks that a student is expected to score based upon the
#number of hours they studied.
library(readr)
#Importing data through url

print("Importing data set through url")
Data_Set <- read_csv("https://raw.githubusercontent.com/AdiPersonalWorks/Random/master/student_scores%20-%20student_scores.csv")
View(Data_Set)

plot(Data_Set$Hours,Data_Set$Scores,
     main='Hours studies vs. Score',
     xlab = 'Hours',ylab = 'Scores',
     col='blue')


#Splitting the data set into training and test set 

library(caTools)
set.seed(123)
print("Splitting the data into training and test set with split ratio 2:3")
split = sample.split(Data_Set$Hours, SplitRatio = 2/3)
training_set = subset(Data_Set, split == TRUE)
View(training_set)
test_set = subset(Data_Set, split == FALSE)
View(test_set)


#Calculating the linear regression on training set
#where Scores is dependent variable(y)
#and No of hourse studied is independent variable(x)


print("Fitting Simple Linear Regression to the Training set")
regressor = lm(formula = Scores~Hours,
               data = training_set)
summary(regressor)

#Now predicting the results of linear regression applied on training set

print("Predicting the Test set results")
y_pred = predict(regressor, newdata = test_set)

#Calculating the Scores if student studies 9.25hrs

a<- data.frame(Hours=9.25)
result<- predict(regressor,a)
print(paste("Score for  9.25 hrs is",result))

# Visualising the Training set results 
# geom-geometric aes-aesthetic parameter
library(ggplot2)
ggplot() +   #scatered plot
  geom_point(aes(x = training_set$Hours, y = training_set$Scores),
             colour = 'red') +
  geom_line(aes(x = training_set$Hours, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +    #bestfit 
  ggtitle('Scores vs Hours (Training set)') +
  xlab('No of hours studied') +
  ylab('Score')


# Visualising the Test set results
library(ggplot2)
ggplot() +
  geom_point(aes(x = test_set$Hours, y = test_set$Scores),
             colour = 'red') +
  geom_line(aes(x = training_set$Hours, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Scores vs Hours Test set)') +
  xlab('No of hours studied') +
  ylab('Score')

