# Coursera Getting and Cleaning Data Course Project

This repository hosts the R code and codebook files for the course "Getting and Cleaning data"

## Files

Readme.md: This file. 
CodeBook.md: describes the variables, the data, and any transformations or work that was performed to clean up the data 
run_analysis.R: contains the code to perform the cleaning and generating the second tidy data set.
SecondTidyDataSet.txt: Independent tidy data set with the average of each variable for each activity and 
each subject. The SecondTidyDataSet is generated from the main data set (only the measurements 
on the mean and standard deviation for each measurement are extracted)

# How the script works
The R code "run_analysis.R" performs the 5 following steps (as required in the assignment). The step numbers are commented in the code. 
##Step 1: Merging the training and the test sets to create one data set.
Step 1.1 Reading the training tables.
Step 1.2 Reading testing tables
Step 1.3 Reading feature vector and assigning column names
Step 1.4 Reading activity labels and assigning column names
Step 1.5 Assigning column names for Subject (identifies the subject who performed the activity)
Step 1.6 Merging test and training datasets
##Step 2: Extracting only the measurements on the mean and standard deviation for each measurement.
##Step 3: Using descriptive activity names to name the activities in the data set
##Step 4: Labeling the data set appropriately, with descriptive variable names.
##Step 5: Making second tidy data set and writing in txt file
Step 5.1: Getting the mean data with the average of each variable for each activity and each subject.
Step 5.2: Writing the second tidy data set to the file SecondTidyDataSet.txt