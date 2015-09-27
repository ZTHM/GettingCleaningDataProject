Variables

X_Train.Test_train store the original meta data for x_train data
X_Train.Test_test store the original meta data for test value of x_test_date
#Combine the trianing and test files
X_Train.Test is a data where row bind data of the treainng and testing of x data stored


subject_train reads the subject file of the train data
subject_test  reads the subject file of the test data
subject_Test.Train  store the row bid of the subject data


Y_Train.Test_train store the original meta data for y_train data
Y_Train.Test_test store the original meta data for test value of x_test_date
Y_Train.Test is a data where row bind data of the treainng and testing of y data stored

## 2. Extracting onlY_Train.Test the measurements on the mean and standard deviation
##    for each measurement.
featuresLabel reads all the features
mean_std captures only the std for the data 
X_Train.Test captures only the mean of the features 


## 3 & $. Using descriptive activitY_Train.Test names to name the activities in the data set
##AppropriatelY_Train.Test labeling the data set with descriptive activitY_Train.Test names. 
activitiesLabel captures the avtivity lables

combinedData a combined data set of subjects, train and test data

## 5. Creating a second, independent tidY_Train.Test data set with the average of each 
##    variable for each activitY_Train.Test and each subject. 
Subjects holds the unique values 
SubjectsCount gets the length of subjects
ActivitiesCount get length of the subjects 

tidyData hold build the dat frame size for subeject and activity multiplied.

