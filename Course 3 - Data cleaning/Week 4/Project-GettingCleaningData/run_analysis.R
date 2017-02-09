
zipFile <- "UCI-HAR-Dataset.zip"
fileName <- "UCI HAR Dataset"

if (!file.exists(zipFile)) {
  URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(URL, zipFile)
}  

if (!file.exists(fileName)) { 
  unzip(zipFile)
}

# 1. Merge the training and the test sets to create one data set.

setwd(fileName)

data.Train <-  read.table("./train/X_train.txt")
activities.Train <-  read.table("./train/y_train.txt")
subjects.Train <- read.table("./train/subject_train.txt")

data.Test <-  read.table("./test/X_test.txt")
activities.Test <-  read.table("./test/y_test.txt")
subjects.Test <- read.table("./test/subject_test.txt")

data.All <- rbind(data.Train,data.Test)
activities.All <- rbind(activities.Train,activities.Test)
subjects.All <- rbind(subjects.Train,subjects.Test)


# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("./features.txt")
features[,2] <- as.character(features[,2])

features.Mean_Std <- grep(".*mean.*|.*std.*", features[,2])

## This is just to clean a bit the names modifying the -std()- and -meanFreq()- to Std or MeanFreq
features.Mean_Std.names <- features[features.Mean_Std ,2]
features.Mean_Std.names = gsub('-mean', 'Mean', features.Mean_Std.names)
features.Mean_Std.names = gsub('-std', 'Std', features.Mean_Std.names)
features.Mean_Std.names <- gsub('[-()]', '', features.Mean_Std.names)

## Extracting the information we want:
data.All <- data.All[,features.Mean_Std]

## We name the column with the desired feature names:
names(data.All) <- features.Mean_Std.names


# 3. Uses descriptive activity names to name the activities in the data set

activityLabels <- read.table("./activity_labels.txt")
activityLabels[,2] <- as.character(activityLabels[,2])

## We convert the original activity indices to the activity names given by their labels:
activities.All[, 1] <- activityLabels[activities.All[, 1], 2]

## Renaming the column with the right variable name:
names(activities.All) <- "Activity"

# 4. Appropriately labels the data set with descriptive variable names.

## Renaming the column with the right variable name:
names(subjects.All) <- "Subject"

## bind all the data in a single data set
Data.Final <- cbind(subjects.All, activities.All, data.All)


# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(plyr)
Ncols <- dim(Data.Final)[2]

# 3:Ncols is because the 1st and 2nd cols are Subject and Activity
Data.Averages <- ddply(Data.Final, .(Subject, Activity), function(x) colMeans(x[, 3:Ncols])) 

write.table(Data.Averages, "DataAverages.txt", row.name=FALSE)




