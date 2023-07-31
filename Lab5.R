#Evelyn Barragan 
#Lab 5
#Step 0
#installing libraries 
#install.packages('stats')

#Loading libraries 
library(rpart)
library(caret)
library(rpart.plot)
library(stats)

# Read the mushroom data from CSV files
mushroom <- read.csv('/Users/evelynbarragan/documents/mushrooms.csv', stringsAsFactors = FALSE)

#remove veil type
mushroom$veil_type <- NULL

#str to display structure 
str(mushroom)

#create a contingency table for each predictor variable vs. class variable (response variable)
con_table <- table(mushroom$odor, mushroom$type)
print(con_table)



#do Chi-square test 
result <- chisq.test(con_table)
print(result)

#Split the data into a training set (80%) and a test set (20%) using simple random sampling without replacement.
#set the seed 
set.seed(1234)
samples <- sample(2, nrow(mushroom), replace = T, prob=c(0.8, 0.2)) #random sampling 
training <- mushroom[samples == 1,] 
test <- mushroom[samples == 2,]

#data pre-processing for training
questionMark <- which(training$stalk_root == "?")
# calculate mode of stalk root
mode_root <- names(sort(table(training$stalk_root), decreasing = TRUE))[1]
training$stalk_root[questionMark] <- mode_root

#data pre-processing for test
questionMark <- which(test$stalk_root == "?")
# calculate mode of stalk root
mode_root <- names(sort(table(test$stalk_root), decreasing = TRUE))[1]
test$stalk_root[questionMark] <- mode_root

#decision tree using training data 
tree <- rpart(type ~ ., data = training, method = "class")
rpart.plot(tree)
#unique_values <- unique(test$stalk_root)
#print(unique_values)

#Predict using the test data
predictions <- predict(tree, newdata = test, type = "class")

# Convert "predictions" to a factor with the same levels as the "type" variable
predictions <- factor(predictions, levels = c("e", "p"))

# Convert the "type" variable in the test set to a factor with the same levels as "predictions"
test$type <- factor(test$type, levels = c("e", "p"))
#Create the confusion matrix
con_matrix <- confusionMatrix(predictions, test$type)
print(con_matrix)



