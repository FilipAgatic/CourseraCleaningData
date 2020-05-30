
# Project title: 
**MERGING AND CLEANING THE HUMAN ACTIVITY SMARTPHONE DATASET (Getting and Cleaning Data Coursera course final project)**

# Project author:
**Filip Agatić**
# The project includes the following files:
- README.md
- run_analysis.R 
- tidyMeans.txt
- CodeBook.md

# run_analysis.R instructions
A run_analysis.R script was run on the original data in order to merge the training and testing datasets into one, clean the dataset, remove and relable all columns not measures of mean and standard deviation and output a tidy dataset named 'tidyMeans.txt'.
In order to successfully run run_analysis.R you need to first install and unzip the folder UCI HAR Dataset from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. **You should run the run_analysis from the same directory as you unziped the folder with data.** The output file from the run_analysis.R script matches the included tidyMeans.txt included.   

# tidyMeans.txt 
You can read tidyMeans.txt into R using read.table("tidyMeans.txt") with default settings. More information about the variables, its values and name conventions is available in the CodeBook.md.

# CodeBook.md
Refer to CodeBook.md to learn more about the dataset, authors, variables and details on how the run_analysis script runs. 