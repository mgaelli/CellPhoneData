# CellPhoneData
Code for Assignment Week 4 of "Getting and Cleaning Data"

The project contains just one script that does the following:
1. Read the data files for the test and training datasets, as well as a file (with the activity description) that applies to both datasets.
2. The columns (variables) of the data frames are named, using the names provided in the file "features.txt".
3. The subject IDs and activity codes are attached to the dataframe containing the data.
4. The 2 datasets are combined into one.
5. The new variables from step 3 are named "Individual" and "Activity".
6. A new dataset is created, containg only these two variables, and any with "mean()" or "std()" in the names.
7. The Activity variable i turned into a factor, with the levels named with the activities (from theactivity description).
8. The rest of the variables are named using descriptive names.
9. The dataset is grouped by Individuals and Activities.
10. The dataset is summarized by calculating the eman of the values, by individual and activity.
11. The resulting summarized dataset is written to a file called "Results.txt"