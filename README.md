#Course Project

##Load Data
##Merge
##Extract columns with mean and SD
##Export the datased in txt file

####Load Data
Create paths to directories of the files to be used
Import features
Import train datasets and assign column names from features
Import test datasets and assign column names from features
Bind subjects with train and test and change colname to subject
Bind activities with train and test and change colname to activity

####Merge
Merge test and training datasets into one dataset

####Extract columns with meand and SD
First create a vector indicating column indexes with mean or SD
Using column indexes extract measurements on mean and std for each measurement into a new dataset
Use descriptive activity names to name the activities in the dataset
Make the dataset more readable

####Export the datased in txt file
Create independent tidy data set with the average of each variable for each activity and each subject
Export the file with output into "Course_Project.txt" with row.names = FALSE
