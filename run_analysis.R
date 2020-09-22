# Peer-graded Assignment: Getting and Cleaning Data Course Project

setwd("/Users/otyfrank/documents/Getting & Cleaning Data/Course Project/UCI HAR Dataset")

# reading train data
x_train <- read.table("./train/X_train.txt",sep="")
y_train <- read.table("./train/Y_train.txt",sep="")
s_train <- read.table("./train/subject_train.txt",sep="")

# reading test data
x_test <- read.table("./test/X_test.txt",sep="")
y_test <- read.table("./test/Y_test.txt",sep="")
s_test <- read.table("./test/subject_test.txt",sep="")

# merging train and test data into one data set
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
s_data <- rbind(s_train, s_test)
Data <- cbind(s_data, y_data, x_data)

# naming columns
features <- read.table("./features.txt",sep="")
colnames(Data) <- c("Subject", "Activity", as.character(features[,2]))

# extracting columns with mean and standard deviation values 
cols <- grep("std\\(\\)|mean\\(\\)",as.character(features[,2]))
Data_filtered <- Data[, cols] 

# assigning descriptive activity names
activity <- read.table("./activity_labels.txt",sep="")
Data$Activity <- factor(Data$Activity, levels = activity[,1], labels = activity[,2])

# creating tidy data set with the average of each variable for each activity and each subject
library(reshape2)
Data_02 <- melt(Data, id = c("Subject", "Activity"))
Data_tidy <- dcast(Data_02, Subject + Activity ~ variable, mean)

# writing tidy data set
write.table(Data_tidy, "./Data_tidy.txt", row.names = FALSE)
