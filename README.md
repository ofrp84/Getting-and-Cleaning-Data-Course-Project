# Getting-and-Cleaning-Data-Course-Project

This project uses data collected from the accelerometers from the Samsung Galaxy S smartphone. Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The analysis is made using the R Script: run_analysis.R

The script does the following:
- Reads the train and test data sets and merge them into one data set
- Labels the data set with descriptive variable names
- Extracts only the measurements on the mean and standard deviation for each measurement
- Assigns descriptive activity names to name the activities in the data set
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
