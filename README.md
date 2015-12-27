getting_and_cleaning_data_cproject

#create path to files

#import features

#import train datasets and assign column names from features

#import test datasets and assign column names from features
subj_test <- read.table("subject_test.txt")

#bind subjects with train and test and change colname to subject

#bind activities with train and test and change colname to activity

#merge test and traing

#create a vector indicating column indexes with mean or std
#+2 is because we have two new columns on the left -> subject and activity

extract measurements on mean and std for each measurement

Use descriptive activity names to name the activities in the data set

make the dataset more readable

creates independent tidy data set with the average of each variable for each activity and each subject

export the file with output
