---
title: "Human Activity Recognition Using Smartphones Dataset
Version 1.0"
author: "Hanh Cao"
date: "November 12, 2015"
output: html_document
---
#**Overview**

The project used the data collected from a group of 30 volunteers within an age bracket of 19-48 years. Each person wore a smartphone(Samsung Galazy S II) and performed six activities (walking, walking_upstairs, walking_downstairs, sitting, standing and laying). From the device’s accelerometer and gyroscope, they recorded 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The project’s purpose is cleaning up the received data, calculate the mean of each variable by group of different activities and subjects, re-formatted and saved it to new.txt document.

The raw dataset which was used in creating new dataset includes: - ‘activity_labels.txt’: has 6 activities names - ‘features.txt’: List of all 561 features. - ‘subject_test.txt" and ’subject_train.txt’: ID of 30 subjects doing either test data or train data. - ‘X_train/X_test.txt’: training and testing data recorded for those features. - ‘y_train/y_test.txt’: training and testing labels, ranging from 1 to 6 indicating which activity was performed.

#**The new dataset**

- Dimensions of the dataset: 180x81
- Summary of the data
Column 1: 6 activities- walking, walking_upstairs, walking_downstairs, sitting, standing and laying.
Column 2: 30 subjects of each activity
Column 3 to 81: mean of each variable
- Meaning of measurements:
 Two instruments **accelerometer** and **gyroscope** 3-axial signals were used in testing .These **time-** domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into **-body-** and **-gravity-** acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. Subsequently, the body linear acceleration and angular velocity were derived in time to obtain **-Jerk-** signals. Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm.Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing **frequency-**  domain signals.
**-XYZ** is used to denote 3-axial signals in the X, Y and Z directions


```{r, include=FALSE}
file.rename(from="README.rmd", 
               to="README.md")
```

