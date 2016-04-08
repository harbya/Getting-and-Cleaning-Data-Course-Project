###############################################################
## Step1 : Merges the training and the test sets to create one data set 
#################################################################
library(data.table)  ### loads the data.table library
library(dplyr)       ### load the dplyr package so I can use select and other features

setwd("D:\\R\\data\\getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset") ## sets working directory

xTrain = read.table("train\\X_train.txt")
yTrain = read.table("train\\y_train.txt")
subject_Train = read.table("train\\subject_train.txt")


xTest = read.table("test\\X_test.txt")
yTest = read.table("test\\y_test.txt")
subject_Test = read.table("test\\subject_test.txt")
	
xData = rbind(xTrain, xTest)                            ## Merges the datasets using rbind                   
yData = rbind(yTrain, yTest)							## Merges the datasets using rbind
subject_Data = rbind(subject_Train, subject_Test)		## Merges the datasets using rbind

###############################################################
## Step2 : Extracts only the measurements on the mean and standard deviation for each measurement.
###############################################################

features = read.table("features.txt")
mean_std_features <- grep("-(mean|std)\\(\\)", features[, 2])   ## get a list of columns with %mean% or %std% in their names 
xData <- xData[, mean_std_features]                             ## remove unnecesary columns 
names(xData) <- features[mean_std_features, 2]  		        ## reasign proper columns names

#######################################################################
## Step3 : Uses descriptive activity names to name the activities in the data set
#######################################################################

activities <- read.table("activity_labels.txt")
yData[, 1] <- activities[yData[, 1], 2]                        ##assign proper activity names
names(yData) <- "activity"                                     ##assign activity as a variable name

#######################################################################
# Step 4
# Appropriately label the data set with descriptive variable names
###############################################################################

names(subject_Data) <- "subject"         	   	   ## reasign proper columns name
final_Data <- cbind(xData, yData, subject_Data)    ## merge all the files into one file

#######################################################################
# Step 5 : From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
###############################################################################

averages <- ddply(final_Data,c("subject","activity"), function(x) colMeans(x[, 1:66]))  ## ddply groups the data by subject and activity and generates mean for the rest of the columns.
write.table(averages, "averages.txt", row.name=FALSE)




