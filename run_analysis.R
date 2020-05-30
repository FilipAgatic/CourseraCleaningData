#' Getting and cleaning data final project: 
#' run_analysis script requires the training and test data from an adress: 
#' https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#' The script:
#' 1) merges the training and testing data into one script
#' 2) extracts only the measurements on the mean and standard deviation for each
#' measurement 
#' 3) uses descriptive activity names to name the activities in the data set
#' 4) labels the data with appropriate descriptive variables
#' 5) creates a second, independent tidy data set with the average of each 
#' variable of activity and each subject called 'tidyMeans.txt'.

#' remove all variables currently in the global environment 
rm(list = ls(all = TRUE))
#' load packages 
library(dplyr)
library(stringr)
library(tidyr)
#' ckeck whether the data folder is present in the directory if it is, change the 
#' directory into it 
ifelse(dir.exists("UCI HAR Dataset"), setwd("UCI HAR Dataset"),
       warning(paste("Current working directory does not contain the folder", 
                     "with data. Move to the directory which contains UCI HAR",
                     "Dataset.")))
#' info files
features <- read.table("features.txt")
ActivityLabels <- read.table("activity_labels.txt")
#' training files
trainSubjects <- read.table("train/subject_train.txt")
trainingSet <- read.table("train/X_train.txt")
trainActivity <- read.table("train/y_train.txt")
#' testing files
testSubjects <- read.table("test/subject_test.txt")
testingSet <- read.table("test/X_test.txt")
testActivity <- read.table("test/y_test.txt")


#' add features as column names to both sets and remove the upper cases
names(trainingSet) <- tolower(features$V2)
names(testingSet) <- names(trainingSet)

#' remove any non-required columns: 
#' we remove duplicate columns and columns not containing mean or std. 
trainingSet <- trainingSet[,!duplicated(names(trainingSet))] %>% 
      select(contains("mean()"), contains("std()"))

testingSet <- testingSet[,!duplicated(names(testingSet))] %>% 
      select(contains("mean()"), contains("std()"))

#' mark the datasets with train or test label 
trainingSet$setlabel <- "training"
testingSet$setlabel <- "testing"
#' change the labels for activity from numbers to descriptions and put the 
#' extra columns to datasets
f1 <- function(x) x <- ActivityLabels$V2[as.numeric(as.character(x))]
trainingSet$activity <- sapply(trainActivity, f1)
testingSet$activity <- sapply(testActivity, f1)
#' add subjects info
trainingSet$subjects <- trainSubjects$V1
testingSet$subjects <- testSubjects$V1
#' merge them 
data <- rbind(trainingSet,testingSet, make.row.names = FALSE)
#' increase readability of the variables:
delimeters <- c("body", "gravity", "acc", "gyro", "jerk", "mag")
relabel <- function(x) {
      # replacing minus with underscore
      x <- gsub("-","_", x)
      # getting rid of the brackets
      x <- gsub("[()]", "", x)
      # separate the descriptive elements
      for (del in delimeters) {
            x <- gsub(del, paste("_", del, sep = ""), x)
      }
      return(x) 
}

#' group the data by activity and subjects. 
bySub_byAct <- group_by(data,activity,subjects) %>% 
      summarise_at(vars(-group_cols(),-setlabel), mean)
      
#' output the file with mean values by subject, by activity. 
write.table(bySub_byAct,"tidyMeans.txt")




