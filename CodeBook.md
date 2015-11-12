---
title: "CodeBook"
author: "Hanh Cao"
date: "November 11, 2015"
output: html_document
---

# **Project Description**
The project used the data collected from a group of 30 volunteers within an age bracket of 19-48 years. Each person wore a smartphone(Samsung Galazy S II) and performed six activities (walking, walking_upstairs, walking_downstairs, sitting, standing and laying). From the device's accelerometer and gyroscope, they recorded 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The project's purpose is cleaning up the received data, calculate the mean of each variable by group of different activities and subjects, re-formatted and saved it to new.txt document.


The raw dataset which was used in creating new dataset includes:
- 'activity_labels.txt': has 6 activities names
- 'features.txt': List of all 561 features.
- 'subject_test.txt" and 'subject_train.txt': ID of 30 subjects doing either test data or train data.
- 'X_train/X_test.txt': training and testing data recorded for those features.
- 'y_train/y_test.txt': training and testing labels, ranging from 1 to 6 indicating which activity was performed.

#**Creating the tidy datafile**

##Guide to create the tidy data file

1. Merges all the train and the test sets ('subject_test.txt', 'subject_train.txt','X_train/X_test.txt','y_train/y_test.txt')  to create one data set.
The new data frame (dat) will have 10299 x 563 dimension, in which the first 561 columns are features, the 562th column indicates activity and 563th column indicates subject.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 
First, change the column name of (dat) according to each feature.
For 561 features, choose only those measuring mean or standard deviation (std) in their names.
After this step, (dat) will have dimension as 10299 x 81

3. Uses descriptive activity names to name the activities in the data set.
Use 'activity_labels.txt' file to change the variables of activity column of (dat) into 6 activities' name.

4. Labels the data set with descriptive variable names. 
For each column name of 561 features, the names are changed as following:
	std = StandardDeviation
	Acc = Acceleration
	Gyro = Gyroscope 
	Mag = Magnitude
	t= Time
	f= Frequency
	Freq= Frequency
	Putting dot (.) between words to make it easier to read.
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 With 6 activities and 30 subjects, there'd be 180 combinations total. Thus the new data set would have 180 rows and 79 features in column, each variable is the calculated mean of each feature due to one unique combination (activity,subject).
ex: one combination is (LYING,1) 
Using make.table() to create a new test file.

##Description of the variables in the new.txt file
 - Dimensions of the dataset: 180x81
 - Summary of the data
Column 1: 6 activities- walking, walking_upstairs, walking_downstairs, sitting, standing and laying.
Column 2: 30 subjects of each activity
Column 3 to 81: mean of each variable
 - Meaning of measurements:
 Two instruments **accelerometer** and **gyroscope** 3-axial signals were used in testing .These **time-** domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into **-body-** and **-gravity-** acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. Subsequently, the body linear acceleration and angular velocity were derived in time to obtain **-Jerk-** signals. Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm.Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing **frequency-**  domain signals.
**-XYZ** is used to denote 3-axial signals in the X, Y and Z directions
- List of measurements:

    "Time.Body.Acceleration..Mean.XYZ"                                
    "Time.Body.Acceleration..StandardDeviation.XYZ"  
                     
    "Time.Gravity.Acceleration..Mean.XYZ"                                 
    "Time.Gravity.Acceleration..StandardDeviation.XYZ" 
                       
    "Time.Body.Acceleration.Jerk.Mean.XYZ"                            
    "Time.Body.Acceleration.Jerk.StandardDeviation.XYZ"               
    
    "Time.Body.Gyroscope..Mean.XYZ"                                   
    "Time.Body.Gyroscope..StandardDeviation.XYZ"                      
    
    "Time.Body.Gyroscope.Jerk.Mean.XYZ"                               
    "Time.Body.Gyroscope.Jerk.StandardDeviation.XYZ"                  
    
    "Time.Body.Acceleration..Magnitude..Mean."                      
    "Time.Body.Acceleration..Magnitude..StandardDeviation."         
    
    "Time.Gravity.Acceleration..Magnitude..Mean."                       
    "Time.Gravity.Acceleration..Magnitude..StandardDeviation."          
    
    "Time.Body.Acceleration.Jerk.Magnitude..Mean."                  
    "Time.Body.Acceleration.Jerk.Magnitude..StandardDeviation."     
    
    "Time.Body.Gyroscope..Magnitude..Mean."                         
    "Time.Body.Gyroscope..Magnitude..StandardDeviation."            
    
    "Time.Body.Gyroscope.Jerk.Magnitude..Mean."                     
    "Time.Body.Gyroscope.Jerk.Magnitude..StandardDeviation."
            
    "Frequency.Body.Acceleration..Mean.XYZ"                           
    "Frequency.Body.Acceleration..StandardDeviation.XYZ"              
    "Frequency.Body.Acceleration..Mean.Frequency.XYZ" 
                    
    "Frequency.Body.Acceleration.Jerk.Mean.XYZ"                       
    "Frequency.Body.Acceleration.Jerk.StandardDeviation.XYZ"          
    "Frequency.Body.Acceleration.Jerk.Mean.Frequency.XYZ"             
    
    "Frequency.Body.Gyroscope..Mean.XYZ"                              
    "Frequency.Body.Gyroscope..StandardDeviation.XYZ"  
    "Frequency.Body.Gyroscope..Mean.Frequency.XYZ"                    
    
    "Frequency.Body.Acceleration..Magnitude..Mean."                 
    "Frequency.Body.Acceleration..Magnitude..StandardDeviation."    
    "Frequency.Body.Acceleration..Magnitude..Mean.Frequency."       
    
    "Frequency.Body.Acceleration.Jerk.Magnitude..Mean."             
    "Frequency.Body.Acceleration.Jerk.Magnitude..StandardDeviation."
    "Frequency.Body.Acceleration.Jerk.Magnitude..Mean.Frequency."   
    
    "Frequency.Body.Gyroscope..Magnitude..Mean."                    
    "Frequency.Body.Gyroscope..Magnitude..StandardDeviation."       
    "Frequency.Body.Gyroscope..Magnitude..Mean.Frequency."          
    
    "Frequency.Body.Gyroscope.Jerk.Magnitude..Mean."                
    "Frequency.Body.Gyroscope.Jerk.Magnitude..StandardDeviation."   
    "Frequency.Body.Gyroscope.Jerk.Magnitude..Mean.Frequency."  
    
```{r, include=FALSE}
   file.rename(from="CodeBook.rmd", 
               to="CodeBook.md")
```