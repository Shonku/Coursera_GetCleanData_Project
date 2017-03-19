## Source data
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone for
Human Activity Recognition. Full description is available at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


## About R script - run_analysis.R

The R code "run_analysis.R" performs the 5 following steps (as required in the assignment). The step numbers are commented in the code. 
(Note: README.md file in the repository (same as this CodeBook) lists details to run the code.) 

* Step 1: Merging the training and the test sets to create one data set.
	* Step 1.1 Reading the training tables.
	* Step 1.2 Reading testing tables
	* Step 1.3 Reading feature vector and assigning column names. ote: features.txt has 561 variables corresponding to 561 variables in X (test and train)
	* Step 1.4 Reading activity labels and assigning column names
 Note: Six activities are (1 - WALKING, 2 - WALKING_UPSTAIRS, 3 - WALKING_DOWNSTAIRS, 4 - SITTING, 5 - STANDING, 6 - LAYING)
 The numbers above indicate the activity class. In the activity table column 1 is the activity class, column 2 is the name of activity
 Y (test, train) corresponds to activity column 1, i.e. the activity class
	* Step 1.5 Assigning column names for Subject (identifies the subject who performed the activity)
	* Step 1.6 Merging test and training datasets

* Step 2: Extracting only the measurements on the mean and standard deviation for each measurement.
  Note: Activity and Subject information is also made part of this subset (since required later in step 5)

* Step 3: Using descriptive activity names to name the activities in the data set
* Step 4: Labeling the data set appropriately, with descriptive variable names.
Note: Since the variable names are preserved from the main dataset and they are already descriptive and follows a naming scheme, 
nothing additional is done in steps 3 and 4. Activity names description is merged in step 5, before the output second tidy data file is saved

* Step 5: Making second tidy data set and writing in txt file
	* Step 5.1: Getting the mean data with the average of each variable for each activity and each subject.
Also the description of the activity is added to make it part of the file
	* Step 5.2: Writing the second tidy data set to the file SecondTidyDataSet.txt

## Variables in main dataset
Detailed description of variables for the main dataset is present in the file "features_info.txt". Summary is presented below.
The feature vector obtained from the accelerometer and gyroscope 3-axial raw signals has 561 features. The features include:
* Raw signals (time domain) after initial filtering: tBodyAcc,tGravityAcc, tBodyGyro
* The derivatives of raw signals (time domain): tBodyAccJerk, tBodyGyroJerk
   Note: Each of above 5 signals have 3 components XYZ (so in 15 signals in total)
* The magnitudes of the above 5 signals (computed from the 3 XYZ components, used together): tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag
* The frequency domain representation for 5 signals: fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag
From the above signals, the final set of feature variables were estimated based on statistical operations on signals. The operations are
detailed in "features_info.txt"
* Five additional vectors obtained by averaging the signals in a signal window sample: gravityMean,tBodyAccMean,tBodyAccJerkMean,tBodyGyroMean,tBodyGyroJerkMean


## Mapping of tables from source data to code variables
* X_train.txt -> train_X 
* y_train.txt -> train_Y 
* subject_train.txt -> train_Subject 
* X_test.txt -> test_X 
* y_test.txt -> test_Y 
* subject_test.txt -> test_Subject 
* features.txt -> features 
* activity_labels.txt -> activity_labels

## Variables in "test", "train"  and merged data
In step 1.6 (See above), the test and train datasets are obtained. Each have a total of 563 variables - 561 from the main dataset (features)
and two from the Acitivity Class and Subject ID. The merged data (test and train) has the same 563 variables. 

## Variables in the second tidy data
The second tidy data is obtained from the merged test and train data, by filtering for keywords "mean" and "std" while also including
"activity_class" and "subject" and then adding the activity name (descriptive) in step 3. 

Before averaging each variable for each activity and each subject, following are the 81 variables in the second tidy data, in-order, mean and std keywords are grouped where available. Note XYZ implies
3 variables, as in the main data set

  subject   activity_class    
  tBodyAcc-mean()-XYZ  tBodyAcc-std()-XYZ   
  tGravityAcc-mean()-XYZ   tGravityAcc-std()-XYZ   
  tBodyAccJerk-mean()-XYZ   tBodyAccJerk-std()-XYZ 
  tBodyGyro-mean()-XYZ   tBodyGyro-std()-XYZ
  tBodyGyroJerk-mean()-XYZ   tBodyGyroJerk-std()-XYZ
  tBodyAccMag-mean()  tBodyAccMag-std()              
  tGravityAccMag-mean()   tGravityAccMag-std()          
  tBodyAccJerkMag-mean()    tBodyAccJerkMag-std()          
  tBodyGyroMag-mean()   tBodyGyroMag-std()            
  tBodyGyroJerkMag-mean()   tBodyGyroJerkMag-std()         
  fBodyAcc-mean()-XYZ  fBodyAcc-std()-XYZ
  fBodyAcc-meanFreq()-XYZ 
  fBodyAccJerk-mean()-XYZ   fBodyAccJerk-std()-XYZ
  fBodyAccJerk-meanFreq()-XYZ
  fBodyGyro-mean()-XYZ   fBodyGyro-std()-XYZ
  fBodyGyro-meanFreq()-XYZ
  fBodyAccMag-mean()   fBodyAccMag-std()              
  fBodyAccMag-meanFreq()         
  fBodyBodyAccJerkMag-mean()  fBodyBodyAccJerkMag-std()      
  fBodyBodyAccJerkMag-meanFreq() 
  fBodyBodyGyroMag-mean()       fBodyBodyGyroMag-std()         
  fBodyBodyGyroMag-meanFreq()    
  fBodyBodyGyroJerkMag-mean()   fBodyBodyGyroJerkMag-std()     
  fBodyBodyGyroJerkMag-meanFreq()
  activity_name  

 Since there are 30 subjects and 6 classes of activity, after averaging we get 180 observations of mean - so the second tidy data set
 has 180 rows and 82 columns. Column variables are as above. Note that the last column (82nd; merged from activity_labels) is 
 character data (name of actvity), rest are numbers. 