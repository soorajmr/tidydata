###################################################################################################
# This file is part of Coursera JHU "Getting and Cleaning Data" course project
# Implemented by Sooraj Raveendran in 2015
# Details of the project are available at https://class.coursera.org/getdata-011
#
# The code here uses UCI "Human Activity Recognition" data. Some cleanup and summarizing
# operation is done on this data to make it a shorter, tidy dataset.
#
# The data was downloaded from 
#          https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#
###################################################################################################

library(plyr)

# Read all data
train_data <- read.table(file="UCI HAR Dataset/train/X_train.txt", header=FALSE)
train_activities <- read.table(file="UCI HAR Dataset/train/y_train.txt", header=FALSE)
test_data <- read.table(file="UCI HAR Dataset/test/X_test.txt", header=FALSE)
test_activities <- read.table(file="UCI HAR Dataset/test/y_test.txt", header=FALSE)
train_subjects <- read.table(file="UCI HAR Dataset/train/subject_train.txt", header=FALSE)
test_subjects <- read.table(file="UCI HAR Dataset/test/subject_test.txt", header=FALSE)
activity_labels <- read.table(file="UCI HAR Dataset/activity_labels.txt", header=FALSE)
features <- read.table(file="UCI HAR Dataset/features.txt", header=FALSE)

# Combine training and test datasets into one
data <- rbind(train_data, test_data)
activities <- rbind(train_activities, test_activities)
subjects <- rbind(train_subjects, test_subjects)

# Extract a smaller subset of features by selecting only  mean and std dev from the features list.
# To avoid meanFreq() etc. coming in, match the paranthesis as well
features_small <- features[ grepl("mean\\(|std\\(", features$V2), ]
data <- data[features_small$V1]
names(data) <- features_small$V2

# replace the activy numbers by names
activities[,1] <- sapply(activities[,1], function(i) {activity_labels[i,]$V2})

# Mege activities and subjects lists to the main data frame
data <- cbind(activities, data)
colnames(data)[1] <- "Activities"
data <- cbind(subjects, data)
colnames(data)[1] <- "Subjects"

# Now create a smaller tidy dataset grouping the rows by subject and activity. 
# For each subject-activity combination, take the average of all observations
# along each column
tidy_data <- ddply(data, .(Subjects, Activities), numcolwise(mean))

# Write the tidy dataset into a file
write.table(tidy_data, file = "tidy_data.txt", row.name=FALSE)

