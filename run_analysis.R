#Step 1: Merging the training and the test sets to create one data set.
#Step 1.1  Reading the training tables:
train_X <- read.table("./UCI HAR Dataset/train/X_train.txt")
train_Y <- read.table("./UCI HAR Dataset/train/y_train.txt")
train_Subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#Step 1.2 Reading testing tables:
test_X <- read.table("./UCI HAR Dataset/test/X_test.txt")
test_Y <- read.table("./UCI HAR Dataset/test/y_test.txt")
test_Subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")

#Step 1.3 Reading feature vector and assigning column names:
features <- read.table('./UCI HAR Dataset/features.txt')
# features.txt has 561 variables corresponding to 561 variables in X (test and train)
# assigning column names for X
colnames(test_X) <- features[,2] 
colnames(train_X) <- features[,2] 

#Step 1.4 Reading activity labels and assigning column names
#Six activities (1 - WALKING, 2 - WALKING_UPSTAIRS, 3 - WALKING_DOWNSTAIRS, 4 - SITTING, 5 - STANDING, 6 - LAYING)
activity_labels = read.table('./UCI HAR Dataset/activity_labels.txt')
# in this table column 1 is the activity class, column 2 is the name of activity
colnames(activity_labels) <- c('activity_class','activity_name')
# Y (test, train) corresponds to activity column 1, i.e. the activity class
# assigning column names for Y
colnames(test_Y) <- "activity_class"
colnames(train_Y) <-"activity_class"

#Step 1.5 Assigning column names for Subject (identifies the subject who performed the activity)
colnames(train_Subject) <- "subject"
colnames(test_Subject) <- "subject"

#Step 1.6 Merge test and training datasets
train <- cbind(train_Y, train_Subject, train_X)
test<- cbind(test_Y, test_Subject, test_X)
merged_data <- rbind(train, test)

# Step 2: Extract only the measurements on the mean and standard deviation for each measurement.
# Note: Activity and Subject information must also be part of this subset (required later)

MeanStdSubset <- merged_data[,c("activity_class","subject",colnames(merged_data)[grep("mean|std",colnames(merged_data))])]

# Step 3: Use descriptive activity names to name the activities in the data set

ts <- merge(MeanStdSubset, activity_labels, by='activity_class', all.x=TRUE)

# Step 4: Appropriately label the data set with descriptive variable names.
# Since the variable names are preserved from the main dataset and they are already descriptive, nothing additional is done

# Step 5: Make second tidy data set and write in txt file
# Step 5.1: Get the mean data

TidyDataSet <- aggregate(. ~subject + activity_class, ts, mean)
TidyDataSet <- TidyDataSet[order(TidyDataSet$subject, TidyDataSet$activity_class),]

# Step 5.2 Write second tidy data set
write.table(TidyDataSet, "./SecondTidyDataSet.txt", row.name=FALSE)

