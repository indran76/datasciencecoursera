setwd("D:\\Classes\\Coursera\\John Hopkins  Data Science\\Practical Machine Learning\\datasciencecoursera\\pml")
rm(list=ls());
set.seed(333);

suppressMessages(library(caret));
suppressMessages(library(kernlab));
suppressMessages(library(ggplot2));
suppressMessages(library(stats));
suppressMessages(library(e1071));
suppressMessages(library(dplyr));
suppressMessages(library(klaR));
suppressMessages(library(randomForest));

trainingUrl <- "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv"
testingUrl  <- "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv"

inTrainData <- read.csv(url(trainingUrl));
inFinalTestingData <- read.csv(url(testingUrl));

#Extract predictors
colnames <- c("classe", "roll_belt", "pitch_belt",  "yaw_belt", "gyros_belt_x",  "gyros_belt_y", "gyros_belt_z", "accel_belt_x", "accel_belt_y", "accel_belt_z", "magnet_belt_x", "magnet_belt_y", "magnet_belt_z", "roll_arm", "pitch_arm", "yaw_arm", "total_accel_arm", "gyros_arm_y", "gyros_arm_y", "accel_arm_x", "accel_arm_y", "accel_arm_z", "magnet_arm_x", "magnet_arm_y", "magnet_arm_z",  "roll_dumbbell", "pitch_dumbbell", "yaw_dumbbell");

#Select colnames for prediction
trainFiltered <- dplyr::select(inTrainData, one_of(colnames));
testFiltered <- dplyr::select(inFinalTestingData, one_of(colnames[-1]));

# Build Cross Validation Set 30%
trainDataBuild <- createDataPartition(y=trainFiltered$classe, p=0.7, list = FALSE)
crossValidationData <- trainFiltered[-trainDataBuild,];

#Build training and testing data set 70/30 respectively, after reserving 30% for cross validation
buildData <- trainFiltered[trainDataBuild,];
inTrain <- createDataPartition(y=buildData$classe, p=0.7, list=FALSE)

trainingData <- buildData[inTrain,];
testingData  <- buildData[-inTrain,]

#Preprocess Data: remove hihgly correlated predictors

correlated <- cor(trainingData[, -1]);
highCorr <- findCorrelation(correlated, cutoff = .90)

finalTestDataProcessed <- testFiltered[, -highCorr];
highCorr <- highCorr +1;

trainingDataProcessed <- trainingData[, -highCorr];
testingDataProcessed <- testingData[, -highCorr];
crossValidationDataProcessed <- crossValidationData[, -highCorr];


#Support Vector Machine
svmModel <- svm(classe ~., data = trainingDataProcessed);
svmPrediction <- predict(svmModel, testingDataProcessed, type="classe");
svmCMatrix <-confusionMatrix(testingData$classe, svmPrediction);

#Out of Sample Errors
outOfSampleErrorSVM <- sum(svmPrediction != testingData$classe)/length(svmPrediction)
outOfSampleErrorSVM

#Cross Validation SVM
svmPredictionCross <- predict(svmModel, crossValidationDataProcessed, type="classe");
svmCmatrixCross <- confusionMatrix(crossValidationDataProcessed$classe, svmPredictionCross);


#Random Forrest Traing and Predict
rfModel <- train(classe~., data=trainingDataProcessed, method="rf", trControl = trainControl(method="cv"), number=4);
rfPrediction <- predict(rfModel, testingDataProcessed)
rfCMatrix <- confusionMatrix(testingData$classe, rfPrediction);

#Out Of Sample Error
outOfSampleErrorRandomForest <- sum(rfPrediction != testingData$classe)/length(rfPrediction)
outOfSampleErrorRandomForest


#Cross Validation Random Forest Model
rfPredictionCross <- predict(rfModel, crossValidationDataProcessed);
rfCMatrixCross <- confusionMatrix(crossValidationDataProcessed$classe, rfPredictionCross);
rfCMatrixCross

outOfSampleErrorRandomForestCross <- sum(rfPredictionCross != crossValidationDataProcessed$classe)/length(rfPredictionCross)
outOfSampleErrorRandomForestCross

#Plot random forest accuracy
plot(rfModel, main="Random Forest Accuracy Vs Predictors", ylab="Accuracy", xlab="Predictors")


#Prediction
FinaltestDataPredictions <- predict(rfModel, testFiltered)


