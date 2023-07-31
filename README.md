# Decision Tree Model for Mushroom Classification

## Goal 
The goal of this project is to learn how to perform exploratory analysis and build a decision tree using R. We will be working with the "mushrooms.csv" dataset, where the task is to classify mushrooms as edible or poisonous based on various attributes. We will explore the data, preprocess it, split it into training and test sets, build a decision tree model using the "rpart" package, and evaluate its performance using a confusion matrix.

## Step 0: Install and Load Libraries

install.packages('rpart')

install.packages('caret')

install.packages('rpart.plot')

library(rpart)

library(caret)

library(rpart.plot)

## Step 1: Import the Data
We will begin by importing the "mushrooms.csv" dataset and displaying its structure using the str() function

## Step 2: Data Exploration and Preparation
1. Veil_type: From the output of str(), we find the variable "veil_type" has only one unique value, which indicates that it is a constant variable and does not provide any discriminatory power for classification. Therefore, it is not potentially useful for classification, and we can safely remove it during the data preprocessing phase.
2. Contingency Table for "Odor": To understand the significance of the predictor variable "odor," we will create a contingency table
3. Interpretation and Chi-square Test: The contingency table for "odor" shows the frequency distribution of each odor type for edible ('e') and poisonous ('p') mushrooms. To verify if "odor" is significant for detecting the class, we can perform a chi-square test

## Step 3: Building and Testing a Decision Tree Model
Building the Decision Tree Model: We will build the decision tree model using the training data set and visualize the tree using the "rpart.plot" package:

## Conclusion
In this project, we explored the "mushrooms.csv" dataset, performed data preprocessing, and built a decision tree model using R. The decision tree provided insights into the classification of edible and poisonous mushrooms based on different attributes. The confusion matrix allowed us to evaluate the overall performance of the model, providing accuracy metrics to assess its effectiveness.

