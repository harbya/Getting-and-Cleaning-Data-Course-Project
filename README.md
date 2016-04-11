#Getting and Cleaning Data Project

## run_analysis.R


The run_analysis.R script performs the following tasks:

* --Creates data frames with the training data.
* --Merges the training and the test sets to create one data set.
* --Extracts only the measurements on the mean and standard deviation for each measurement.
* --Uses descriptive activity names to name the activities in the data set
* --Appropriately labels the data set with descriptive variable names.
* --Creates an independent tidy data set with the average of each variable for each activity and each subject.


## The Procedure is summarised by the following steps:

* Read and load each dataset into a data.frame.
* Merges all the training datasets.
* Discard/remove unnecessary variables (variables without mean or Standard deviation metrics).
* Assign proper variable names to the remaining columns/variables.
* To the final dataset applies ddply functions to group the data by subject and activity and generates mean for the rest of the columns.
* Lastly creates a new condensed/tidy file .

