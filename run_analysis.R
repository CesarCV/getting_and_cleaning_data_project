#######################################################################################
####################  Getting and Cleaning Data Course Project ########################
#######################################################################################

## César Carrera


##### Libraries used
library(dplyr)
library(data.table)
library(tidyr)


##### Folder & file download

#Working directory
maindir <- getwd()

#Data download
filename <- paste0(maindir, "Coursera_DS3_Final.zip")
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, filename, method="curl")
unzip(filename, overwrite = TRUE)

#Reading files
db_features <- tbl_df(read.table("UCI HAR Dataset/features.txt"))
db_activities <- tbl_df(read.table("UCI HAR Dataset/activity_labels.txt"))
db_subject_test <- tbl_df(read.table("UCI HAR Dataset/test/subject_test.txt"))
db_x_test <- tbl_df(read.table("UCI HAR Dataset/test/X_test.txt"))
db_y_test <- tbl_df(read.table("UCI HAR Dataset/test/y_test.txt"))
db_subject_train <- tbl_df(read.table("UCI HAR Dataset/train/subject_train.txt"))
db_x_train <- tbl_df(read.table("UCI HAR Dataset/train/X_train.txt"))
db_y_train <- tbl_df(read.table("UCI HAR Dataset/train/y_train.txt"))


##### PART 1: Consolidation of databases #####
# 1. Merges the training and the test sets to create one data set. 

#Exploratory analysis
db_features #Contains 561 features
db_activities #Code and description for the 6 activities
db_subject_test #Contains the id for the 9 subjects selected for test
db_x_test #Contains the test results for the 561 features (2,947 rows)
db_y_test # Training labels
db_subject_train #Contains the id for the 21 subjects selected for train
db_x_train #Contains the test results for the 561 features (7,352 rows)
db_y_train #Test labels

#Column names: chage of columnes names for easy readability
db_features <- db_features %>% rename(feature_id = V1, feature_desc = V2 )
db_activities <- db_activities %>% rename(activity_id = V1, activity_desc = V2 )
db_subject_test <- db_subject_test %>% rename(subject_id = V1)
db_y_test <- db_y_test %>% rename(activity_id = V1)
db_subject_train <- db_subject_train %>% rename(subject_id = V1)
db_y_train <- db_y_train %>% rename(activity_id = V1)

colnames(db_x_test) <- db_features$feature_desc
colnames(db_x_train) <- db_features$feature_desc


#Adding the subject id and labels to the test and train sets

db_test <- cbind(db_subject_test, db_y_test, db_x_test)
str(db_test)

db_train <- cbind(db_subject_train, db_y_train, db_x_train)
str(db_train)

#Consolidate database
db_test_train <- rbind(db_test, db_train)
str(db_test_train)

#Removing intermediate databases
rm(db_features, db_subject_test, db_x_test, db_y_test, db_subject_train, db_x_train, db_y_train, db_test, db_train)


##### Part 2: Variables of interest #####
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

column.names <- colnames(db_test_train) #column names 
columns_mean_std <- grep("std\\(\\)|mean\\(\\)|subject_id|activity_id", column.names, value=TRUE) #Finding column names of interest
db_mean_sd <- subset(db_test_train, select = columns_mean_std) #Subseting the database

##### Part 3: Labels for activities #####
# 3. Uses descriptive activity names to name the activities in the data set

level_labels <- toString(db_activities[['activity_desc']])

db_mean_sd[['activity_id']] <- factor(db_mean_sd[, "activity_id"], levels = db_activities[['activity_id']], labels = db_activities[['activity_desc']])


##### Part 4: Cleaning variable names  ######
#4. Appropriately labels the data set with descriptive variable names.

#Cleaning variable names
names(db_mean_sd)<-gsub("Acc", "Accelerometer_", names(db_mean_sd))
names(db_mean_sd)<-gsub("Gyro", "Gyroscope_", names(db_mean_sd))
names(db_mean_sd)<-gsub("BodyBody", "Body_", names(db_mean_sd))
names(db_mean_sd)<-gsub("Mag", "Magnitude_", names(db_mean_sd))
names(db_mean_sd)<-gsub("^t", "Time_", names(db_mean_sd))
names(db_mean_sd)<-gsub("^f", "Freq_", names(db_mean_sd))
names(db_mean_sd)<-gsub("tBody", "TimeBody_", names(db_mean_sd))
names(db_mean_sd)<-gsub("-mean()", "Mean", names(db_mean_sd), ignore.case = TRUE)
names(db_mean_sd)<-gsub("-std()", "STD", names(db_mean_sd), ignore.case = TRUE)
names(db_mean_sd)<-gsub("-freq()", "Freq_", names(db_mean_sd), ignore.case = TRUE)
names(db_mean_sd)<-gsub("angle", "Angle_", names(db_mean_sd))
names(db_mean_sd)<-gsub("gravity", "Gravity_", names(db_mean_sd))

str(db_mean_sd)

write.table(db_mean_sd, "db_mean_sd.txt", row.name=FALSE)

##### PART 5: Avarages of each variable #####
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


db_avarages <- db_mean_sd %>%
    group_by(subject_id, activity_id) %>%
    summarise_all(mean)
    

write.table(db_avarages, "db_avarages.txt", row.name=FALSE)





