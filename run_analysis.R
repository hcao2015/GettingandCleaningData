##1.Merges the training and the test sets to create one data set.

sub_test= read.table("subject_test.txt") ## 2947 1
sub_train= read.table("subject_train.txt") ## 7352 1
xtest= read.table("X_test.txt")   ## 2947 561
xtrain= read.table("X_train.txt") ## 7352 561
ytest= read.table("y_test.txt")   ## 2947 1
ytrain= read.table("y_train.txt") ## 7352 1
x = rbind(xtrain,xtest)
y = rbind(ytrain,ytest)
subject = rbind(sub_train,sub_test)
dat <- cbind(x,y,subject) ## This is a data frame with 10299 x 563 dimension

##2.Extracts only the measurements on the mean and standard deviation 
##  for each measurement. 

feature <- read.table("features.txt")
names(dat) = feature$V2
temp=dat[,which(grepl("mean|std",names(dat))==TRUE)]
dat=cbind(temp,y,subject)
colnames(dat)[80:81]=c("Activity", "Subject")

##3.Uses descriptive activity names to name the activities in the data set

activity = read.table("activity_labels.txt")
dat$Activity= activity$V2[dat$Activity]

##4.Appropriately labels the data set with descriptive variable names. 

names(dat)=gsub("[[:punct:]]","",names(dat))
names(dat)=gsub("std",".StandardDeviation.",names(dat))
names(dat)=gsub("Mag",".Magnitude.",names(dat))
names(dat) = gsub("Acc",".Acceleration.",names(dat))
names(dat) = gsub("Gyro",".Gyroscope.",names(dat))
names(dat) = gsub("mean",".Mean.",names(dat))
names(dat) = gsub("Freq","Frequency.",names(dat))
names(dat) = gsub("tB","Time.B", names(dat))
names(dat) = gsub("tG","Time.G", names(dat))
names(dat) = gsub ("fB","Frequency.B",names(dat))
names(dat) = gsub ("BodyBody","Body",names(dat))

##5.From the data set in step 4, creates a second, independent tidy data 
##  set with the average of each variable for each activity and each subject.

## Mean of each variable grouped by different activities, dimension is 6x80
tmp= aggregate(dat[,1:79],list(Subject=dat$Subject,Activity=dat$Activity),mean)

write.table(tmp,file="new.txt",row.name=F,col.names=T)



