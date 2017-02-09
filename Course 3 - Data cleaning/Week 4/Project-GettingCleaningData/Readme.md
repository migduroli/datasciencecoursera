Getting and Cleaning Data - Course Project
==========================================

The present repository contains the script and needed documentation for the project of the module "Getting and Cleaning data", which is part of the Data Science Specialization (Coursera).
    
For this project we need to download the following dataset [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Files

`CodeBook.md` describes the variables, the data, and any transformations or work that you performed to clean up the data 

`run_analysis.R` is the R-script which we need to run in ordert to perform the followin steps:

* Merge the training and the test sets to create one data set
* Extracts only the measurements on the mean and standard deviation for each measurement
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

The output after running the script is a txt file called `averages_data.txt` which contains the table of relevant data (which has been submitted)
