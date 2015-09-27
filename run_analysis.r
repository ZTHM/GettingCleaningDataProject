

librarY (data.table)

url <-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(url,destfile = "Dataset.zip")
unzip("Dataset.zip")

print('Unzipping data....')

Bind = 1
#1 read and merge the training and testing data

#Read all the necessarY_Train.Test x train and test file and combine them using row bind
X_Train.Test_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
X_Train.Test_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
#Combine the trianing and test files
X_Train.Test <- rbind(X_Train.Test_train, X_Train.Test_test)


#Read the subject files for train and test file, then combine them using row bind.
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subject_Test.Train <- rbind(subject_train, subject_test)

Y_Train.Test_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
Y_Train.Test_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
Y_Train.Test <- rbind(Y_Train.Test_train, Y_Train.Test_test)

## 2. Extracting onlY_Train.Test the measurements on the mean and standard deviation
##    for each measurement.
featuresLabel <- read.table("UCI HAR Dataset/features.txt")
mean_std <- grep(".*mean\\(\\)|.*std\\(\\)", features[,2])
X_Train.Test <- X_Train.Test[, mean_std]
names(X_Train.Test) <- featuresLabel[mean_std,2]

## 3 & $. Using descriptive activitY_Train.Test names to name the activities in the data set
##AppropriatelY_Train.Test labeling the data set with descriptive activitY_Train.Test names. 
activitiesLabel <- read.table("UCI HAR Dataset/activitY_labels.txt")
Y_Train.Test[,1] = activitiesLabel[Y_Train.Test[,1],2]
names(Y_Train.Test) <- "ActivitY"
names(subject_Test.Train) <- "Subject"
combinedData <- cbind(subject_Test.Train, Y_Train.Test, X_Train.Test)

## 5. Creating a second, independent tidY_Train.Test data set with the average of each 
##    variable for each activitY_Train.Test and each subject. 
Subjects = unique(subject_Test.Train)[,1]
SubjectsCount = length(Subjects)
ActivitiesCount = length(activitiesLabel[,1])
b.Cols = dim(combinedData)[2]
tidyData = combinedData[1:(SubjectsCount*ActivitiesCount), ]


for (s in 1:SubjectsCount) {
  for (a in 1:ActivitiesCount) {
    tidyData[r.bind, 1] = Subjects[s]
    tidyData[r.bind, 2] = activitiesLabel[a, 2]
    Comb <- combinedData[combinedData$SubjectID==s & combinedData$ActivitY_Train.TestName==activitiesLabel[a, 2], ]
    tidyData[r.bind, 3:b.Cols] <- colMeans(Comb[, 3:b.Cols])
    r.bind = r.bind+1
  }
}

## 6. Writing the result to a output file
write.table(tidyData, "tidY_data.txt")

# House Keeping clean up
remove('activitiesLabel', 'featuresLabel', 'X_Train.Test','Y_Train.Test')
print('All done!')