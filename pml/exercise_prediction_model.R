setwd("D:\\Classes\\Coursera\\John Hopkins  Data Science\\Practical Machine Learning\\datasciencecoursera\\pml")

suppressMessages(library(caret))
suppressMessages(library(kernlab))
suppressMessages(library(dplyr))
suppressMessages(library(ggplot2))

inTrainData <- read.csv("pml-training.csv")
inFinalTestingData <- read.csv("pml-testing.csv")

colnames <- c(X, user_name, classe, roll_belt, pitch_belt,  yaw_belt, gyros_belt_x,  gyros_belt_y, gyros_belt_z,accel_belt_x,  accel_belt_y, accel_belt_z, magnet_belt_x, magnet_belt_y,magnet_belt_z,  roll_arm, pitch_arm,  yaw_arm, total_accel_arm, gyros_arm_y, gyros_arm_y, accel_arm_x, accel_arm_y, accel_arm_z, magnet_arm_x, magnet_arm_y, magnet_arm_z,  roll_dumbbell, pitch_dumbbell, yaw_dumbbell);

trainFiltered <- select(inTrainData, colnames)

#inTrainSub <- select(inTrain, X, user_name, classe, roll_belt, pitch_belt,  yaw_belt, gyros_belt_x,  gyros_belt_y, gyros_belt_z,accel_belt_x,  accel_belt_y, accel_belt_z, magnet_belt_x, magnet_belt_y,magnet_belt_z,  roll_arm, pitch_arm,  yaw_arm, total_accel_arm, gyros_arm_y, gyros_arm_y, accel_arm_x, accel_arm_y, accel_arm_z, magnet_arm_x, magnet_arm_y, magnet_arm_z,  roll_dumbbell, pitch_dumbbell, yaw_dumbbell)