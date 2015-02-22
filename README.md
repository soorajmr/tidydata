# Tidy Data
Coursera Data Science Tidy Data Project (Getting and Cleaning Data)

This repository contains R code to take th UCI Human Activity Recognition dataset and convert it into a smaller tidy format. Please see the file run_analysis.R for more details. This code assumes that the UCI dataset is extracted to the same directory - that is, the data is available under the directory named "UCI HAR Dataset".

## Code book for tidy data
For the details of the original dataset, please refer to http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. The output of our run_analysis script is a summary table that lists down the averages of the features that represent mean and standard deviation values of different parameters. I.e., for each subject-activity combination, the average values of various features are presented. Each row in the tidy data represents the average feature values for a particular subject doing a particular activity.

Below are the meanings of each column in the data table:

* Subjects: Unique identifier for the person who took part in the experiment
* Activities: Different physical activities that the subject did, for which the gyroscope and accelerometer readings were taken. Values possible: LAYING, SITTING, STANDING, WALKING, WALKING_UPSTAIRS and WALKING_DOWNSTAIRS
* All remaining columns: These are same as the features mentioned in the original datase. Please refer to the README.txt file in the UCI data. One difference is that for a subject-activity combination, multiple rows are combined into one, resulting in the feature values being the mean of all the feature measurements for that subject-activity combination. Also note that these values were originally normalized in the range (-1, 1).

