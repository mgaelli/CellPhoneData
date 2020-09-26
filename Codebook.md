Data:

Data was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The data contains two dat sets, one called "train" and one called "test". Each of these contains a file with the actual data, called "X_test.txt" and "X_train.txt", respectively, a file with IDs for the test subjects, 
called "test_subjects.txt" and "train_subjects.txt", respectively, and a file with the activity codes for the different activities test, cally "y_test.txt" and "y_train.txt" respectively. Furthermore, there are data 
files with the description of the activities and their codes, called "activity_labels.txt", as well as a number of files explaining what was measured, and how the data was preprocessed.

Variable used:
test_data:	contains the data from the "test" dataset, from "X_test.txt"
test_labels:	contains the activity codes for the "test" dataset from "y_test.txt"
test_subjects:	contains the subject IDs for the "test" dataset from "subject_test.txt"
train_data:	contains the data from the "training" dataset from "X_train.txt"
train_labels:	contains the activity codes for the "training" dataset from "y_train.txt"
train_subjects:	contains the subject IDs for the "training" dataset from "subject_train.txt"
act_labels:	contains the activity labels from "activity_lables.txt"
test_names:	contains the column (variable) names of the dataframe containing the data
test_data:	dataframe containing the test data
train_data:	dataframe containing the training data
comb_data:	dataframe containing the combined data (test and training data)
data:	dataframe contiaing only the variables pertaining to mean and standard deviation of the measurements
sum_data:	dataframe containing the summarized values

Transformations:
Subject IDs and activity codes were attached to the data using cbind()
Test- and training data were combined using rbind()
The required columns(variables) were extracted using the "Select" command, choosing the first 2 columns (SUbject ID and Activity code), and any variables with "mean()" or "std()" in the name. 
	Note: the dataset contains a number of measurements that have "mean" in the name, but are not averaged measurements, e.g. "fBodyGyro-meanFreq()-X". Therefore the parentheses were included in the requirement.
The activity codes were converted to factors using the "factor" command, with the names pulled from the act_labels dataframe. The codes are in the first column, the names in the second one.
The variables were renamed using desciptive names.
Finally, the data was grouped by Subject ID and activity, using the group_by command, and summarized (mean values calculated for each variable) using the "summarize" command.

