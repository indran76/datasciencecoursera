#Load Libraries
library(dplyr)
library(data.table)

#Clear workspace variables
rm(list=ls())

#Setup Global datadir variables

dataDir    <- "UCI HAR Dataset/"
dataDirTrain <- "UCI HAR Dataset/train/"
dataDirTest <- "UCI HAR Dataset/test/"

#Load features and activities tables

features <- read.table(paste(dataDir, "features.txt", sep=""))
activities <-  read.table(paste(dataDir, "activity_labels.txt", sep=""))

#Label activities colnames
setnames(activities, c("V1", "V2"), c("activityid", "activityname"))

#Extact features
features <- features$V2

#Load Training datasets and label the colnames
dataXTrain <- read.table(paste(dataDirTrain, "X_train.txt", sep=""))
setnames(dataXTrain, names(dataXTrain), as.character(features))

dataYTrain <- read.table(paste(dataDirTrain, "y_train.txt", sep=""))
dataSubjectTrain <- read.table(paste(dataDirTrain, "subject_train.txt", sep=""))

setnames(dataSubjectTrain, "V1", "subjectid")
setnames(dataYTrain, "V1", "activityid")

#Combine the Training datast keys with data
trainKeys <- cbind(dataSubjectTrain, dataYTrain)
trainData <- cbind(trainKeys, dataXTrain)


#Load Test Datasets
dataXTest <- read.table(paste(dataDirTest, "X_test.txt", sep=""))
setnames(dataXTest, names(dataXTest), as.character(features))

dataYTest <- read.table(paste(dataDirTest, "y_test.txt", sep=""))
dataSubjectTest <- read.table(paste(dataDirTest, "subject_test.txt", sep=""))

setnames(dataSubjectTest, "V1", "subjectid")
setnames(dataYTest, "V1", "activityid")

testKeys <- cbind(dataSubjectTest, dataYTest)
testData <- cbind(testKeys, dataXTest)


#Merge the training and test Datasets
dataSet <- rbind(trainData, testData)

#2 Extracts only the measurements on the mean and standard deviation for each measurement.

meanStdDataset <- subset(dataSet, select = grep("mean|std|subjectid|activityid", names(dataSet)))

#3 Uses descriptive activity names to name the activities in the data set
meanStdDatasetWithActivites <- merge(meanStdDataset, activities, by="activityid")
meanStdDatasetWithActivites <- select(meanStdDatasetWithActivites, 1:2, 82, 3:81)

#4 Appropriately labels the data set with descriptive variable names.
setnames(meanStdDatasetWithActivites, names(meanStdDatasetWithActivites), gsub('[-()]', "", names(meanStdDatasetWithActivites)))
setnames(meanStdDatasetWithActivites, names(meanStdDatasetWithActivites), gsub('mean', "Mean", names(meanStdDatasetWithActivites)))
setnames(meanStdDatasetWithActivites, names(meanStdDatasetWithActivites), gsub('std', "Std", names(meanStdDatasetWithActivites)))

#5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

tidyDataset <- meanStdDatasetWithActivites %>% group_by(subjectid, activityid, activityname) %>% summarise_each(funs(mean))



