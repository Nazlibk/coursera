#load all test and train data to R
xTest<-read.table("./UCI HAR Dataset/test/X_test.txt")
yTest<-read.table("./UCI HAR Dataset/test/Y_test.txt")
subjectTest<-read.table("./UCI HAR Dataset/test/subject_test.txt")
xTrain<-read.table("./UCI HAR Dataset/train/X_train.txt")
yTrain<-read.table("./UCI HAR Dataset/train/Y_train.txt")
subjectTrain<-read.table("./UCI HAR Dataset/train/subject_train.txt")
activityLabel<-read.table("./UCI HAR Dataset/activity_labels.txt")
features<-read.table("./UCI HAR Dataset/features.txt")

#Gather all data together to get a Dataset
x<-rbind(xTest, xTrain)
y<-rbind(yTest, yTrain)
yAsNumber<-data.matrix(y)
labeledy<-activityLabel[yAsNumber, 2]
subject<-rbind(subjectTest, subjectTrain)
data<-cbind(subject,labeledy,x)

#Extract mean() and std()
meanAndstd<-grep("mean()|std()", features$V2)
meanAndstd[length(meanAndstd)+1]<-562
meanAndstd[length(meanAndstd)+1]<-563
main<-data[,meanAndstd]

#labeled the columns
labels[1]<-"Identifier"
labels[2]<-"Activities"
labels[3:81]<-features[meanAndstd[1:79],2]

names(main)<-labels

#write tidy data in a text file
write.table(main, file="main.txt", row.name=FALSE)