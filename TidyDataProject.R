## This script will retrieve, clean, and output data
## from a file source.

#First we extract the necessary files

ActLab <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")
TestX <- read.table("UCI HAR Dataset/test/X_test.txt")
TestY <- read.table("UCI HAR Dataset/test/y_test.txt")
TestSub <- read.table("UCI HAR Dataset/test/subject_test.txt")
TrainX <- read.table("UCI HAR Dataset/train/X_train.txt")
TrainY <- read.table("UCI Har Dataset/train/y_train.txt")
TrainSub <- read.table("UCI Har Dataset/train/subject_train.txt")

#Next we will get our data ready to extract mean and
#standard deviation info only as well as activity type

features[,2] <- as.character(features[,2])
ActLab[,2] <- as.character(ActLab[,2])

#Now we find the position of all mean and sd info w/ clean up

where_feats <- grep(".*mean.*|.*std.*", features[,2])
here_feats <- features[where_feats,2]
here_feats <- gsub("[-()]", " ",here_feats)

#Begin compiling the Test and train data
Test <- cbind(TestSub, TestY, TestX)
Train <- cbind(TrainSub, TrainY, TrainX)
AllData <- rbind(Test,Train)
colnames(AllData) <- c("Subject","Activity", here_feats)
AllData[,1] <- as.factor(AllData[,1])
AllData[,2] <- factor(AllData[,2], levels = ActLab[,1], labels = ActLab[,2])

#Getting the data ready for means
AllData <- as.data.table(AllData)
CleanData <- melt.data.table(AllData, c(1,2), here_feats)

#Calculated means for each variable by subject and activity
#and returns the results as a txt file
MeanData <- dcast(CleanData, Subject + Activity ~ variable, mean)
write.table(MeanData, "MeanData.txt", row.name = FALSE)




