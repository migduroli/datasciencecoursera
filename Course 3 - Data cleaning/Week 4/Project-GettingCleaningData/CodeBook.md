# Overview of the algorithm

The R-script `run_analysis.R` found in this folder carries out the analysis described in the couse by following the five steps indicated below:

* Merge the training and the test sets to create one data set
* Extracts only the measurements on the mean and standard deviation for each measurement
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

To do this we have used:

* `rbind()` so as to merge the data from test and train together 
* Defined the features we want to get, read from `features.txt`
* Take the activity names and IDs from `activity_labels.txt` 
* The names of the activities from the previous step to substitute the index with descriptive names
* Also, the feature names are corrected so that the final data set has the proper column names making it easier to find the right column by using $
* Generate a dataset with all the average measures called `DataAverages.txt`

# Variables involved

* `data.Train`, `data.Test`, `activities.Train`, `activities.Test`, `subjects.Train` and `subjects.Test` are variables containing the data from the downloaded folder (RAW data)
* `data.All`, `activities.All` and `subjects.All` are the variables resulting from merging test and train data sets with rbind().
* `features` contain the conversion table for the columns of the data to descriptive names. The subset of those features on the mean and standard deviation are stored in `features.Mean_Std` and their corresponding names in `features.Mean_Std.names`
* The nams of the activities are taken from `activity_labels.txt` and saved in `activityLabels` variable
* `Data.Final` contains all the data needed in a single dataset: `subjects.All, activities.All, data.All`
* `DataAverages` is the dataset generated in the step 5, containing the averages of the columns which is computed by using `ddply()`