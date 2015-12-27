#create path to files
data_path <- "C:\\Users\\Ruslan\\Desktop\\coursera\\UCI HAR Dataset"
test_path <- "C:\\Users\\Ruslan\\Desktop\\coursera\\UCI HAR Dataset\\test"
train_path <- "C:\\Users\\Ruslan\\Desktop\\coursera\\UCI HAR Dataset\\train"

#import features
setwd(data_path)
features <- read.table("features.txt")

#import train datasets and assign column names from features
setwd(train_path)
x_train <- read.table("X_train.txt", col.names = features[,2])
y_train <- read.table("y_train.txt")
subj_train <- read.table("subject_train.txt")

#import test datasets and assign column names from features
setwd(test_path)
x_test <- read.table("X_test.txt", col.names = features[,2])
y_test <- read.table("y_test.txt")
subj_test <- read.table("subject_test.txt")

#bind subjects with train and test and change colname to subject
train_subj <- cbind(subj_train, x_train)
test_subj <- cbind(subj_test, x_test)
colnames(train_subj)[which(names(train_subj)=="V1")] <- "subject"
colnames(test_subj)[which(names(test_subj)=="V1")] <- "subject"

#bind activities with train and test and change colname to activity
train <- cbind(y_train, train_subj)
test <- cbind(y_test, test_subj)
colnames(train)[which(names(train)=="V1")] <- "activity"
colnames(test)[which(names(test)=="V1")] <- "activity"

#merge test and traing
test_train <- rbind(test, train)

#create a vector indicating column indexes with mean or std
#+2 is because we have two new columns on the left -> subject and activity
col_numbers <- grep("mean()|std()", features[,2])+2

#extract measurements on mean and std for each measurement
data_mean_std <- test_train[,c(1,2,col_numbers)]

# Use descriptive activity names to name the activities in the data set
data_mean_std$activity[data_mean_std$activity==1] <- "walking"
data_mean_std$activity[data_mean_std$activity==2] <- "walking_upstairs"
data_mean_std$activitdata_mean_std$activity[data_mean_std$activity==5] <- "standing"
data_mean_std$activity[data_mean_std$activity==6] <- "laying"

#make the dataset more readable
names(data_mean_std) <- gsub(names(data_mean_std), 
                             pattern = "\\.", replacement = "")
y[data_mean_std$activity==3] <- "walking_downstairs"
data_mean_std$activity[data_mean_std$activity==4] <- "sitting"

#creates independent tidy data set with the average of each variable for each activity and each subject
tidy_data <- aggregate(.~subject+activity, data=data_mean_std, mean)

#export the file with output
setwd("C:\\Users\\Ruslan\\Desktop\\coursera")
write.table(tidy_data, file = "Course_Project.txt", row.names = FALSE)
