Getting and Cleaning Data - Course Project Codebook

The script run_analysis.r download the data of from the accelerometers from the Samsung Galaxy S smartphone, from the following link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Datasets

The datasets contaings on link are the following:
* features.txt ->  Contains 561 features (id and descriptions)
* activity_labels.txt -> Code and description for the 6 activities
* subject_test.txt -> Contains the id for the 9 subjects selected for test
* X_test.txt -> Contains the test results for the 561 features (2,947 rows)
* y_test.txt -> Training labels
* subject_train.txt -> Contains the id for the 21 subjects selected for train
* X_train.txt -> Contains the test results for the 561 features (7,352 rows)
* y_train.txt -> Test labels

## Modifications

The modifications for datasets to get the require tidy datasets are the following:
* Consolidation of databases: Load of datasets to memory, change variable names, merge of datasets.
* Variables of interest: Subset the variables that contains the meand and standard deviation, and the relevant id.
* Labels for activities: Convert activity ids to factor variable with labels
* Cleaning variable names: Use more descriptive variable names
* Avarages of each variable: Summarise all the variables by subject and activity using the mean function.

## Final variables

* subject_id
* activity_id
* Time_BodyAccelerometer_Mean()-X
* Time_BodyAccelerometer_Mean()-Y
* Time_BodyAccelerometer_Mean()-Z
* Time_BodyAccelerometer_STD()-X
* Time_BodyAccelerometer_STD()-Y
* Time_BodyAccelerometer_STD()-Z
* Time_GravityAccelerometer_Mean()-X
* Time_GravityAccelerometer_Mean()-Y
* Time_GravityAccelerometer_Mean()-Z
* Time_GravityAccelerometer_STD()-X
* Time_GravityAccelerometer_STD()-Y
* Time_GravityAccelerometer_STD()-Z
* Time_BodyAccelerometer_JerkMean()-X
* Time_BodyAccelerometer_JerkMean()-Y
* Time_BodyAccelerometer_JerkMean()-Z
* Time_BodyAccelerometer_JerkSTD()-X
* Time_BodyAccelerometer_JerkSTD()-Y
* Time_BodyAccelerometer_JerkSTD()-Z
* Time_BodyGyroscope_Mean()-X
* Time_BodyGyroscope_Mean()-Y
* Time_BodyGyroscope_Mean()-Z
* Time_BodyGyroscope_STD()-X
* Time_BodyGyroscope_STD()-Y
* Time_BodyGyroscope_STD()-Z
* Time_BodyGyroscope_JerkMean()-X
* Time_BodyGyroscope_JerkMean()-Y
* Time_BodyGyroscope_JerkMean()-Z
* Time_BodyGyroscope_JerkSTD()-X
* Time_BodyGyroscope_JerkSTD()-Y
* Time_BodyGyroscope_JerkSTD()-Z
* Time_BodyAccelerometer_Magnitude_Mean()
* Time_BodyAccelerometer_Magnitude_STD()
* Time_GravityAccelerometer_Magnitude_Mean()
* Time_GravityAccelerometer_Magnitude_STD()
* Time_BodyAccelerometer_JerkMagnitude_Mean()
* Time_BodyAccelerometer_JerkMagnitude_STD()
* Time_BodyGyroscope_Magnitude_Mean()
* Time_BodyGyroscope_Magnitude_STD()
* Time_BodyGyroscope_JerkMagnitude_Mean()
* Time_BodyGyroscope_JerkMagnitude_STD()
* Freq_BodyAccelerometer_Mean()-X
* Freq_BodyAccelerometer_Mean()-Y
* Freq_BodyAccelerometer_Mean()-Z
* Freq_BodyAccelerometer_STD()-X
* Freq_BodyAccelerometer_STD()-Y
* Freq_BodyAccelerometer_STD()-Z
* Freq_BodyAccelerometer_JerkMean()-X
* Freq_BodyAccelerometer_JerkMean()-Y
* Freq_BodyAccelerometer_JerkMean()-Z
* Freq_BodyAccelerometer_JerkSTD()-X
* Freq_BodyAccelerometer_JerkSTD()-Y
* Freq_BodyAccelerometer_JerkSTD()-Z
* Freq_BodyGyroscope_Mean()-X
* Freq_BodyGyroscope_Mean()-Y
* Freq_BodyGyroscope_Mean()-Z
* Freq_BodyGyroscope_STD()-X
* Freq_BodyGyroscope_STD()-Y
* Freq_BodyGyroscope_STD()-Z
* Freq_BodyAccelerometer_Magnitude_Mean()
* Freq_BodyAccelerometer_Magnitude_STD()
* Freq_Body_Accelerometer_JerkMagnitude_Mean()
* Freq_Body_Accelerometer_JerkMagnitude_STD()
* Freq_Body_Gyroscope_Magnitude_Mean()
* Freq_Body_Gyroscope_Magnitude_STD()
* Freq_Body_Gyroscope_JerkMagnitude_Mean()
* Freq_Body_Gyroscope_JerkMagnitude_STD()
