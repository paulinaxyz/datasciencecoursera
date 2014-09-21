The script run_analysis is meant to take the datasets from UCI HAR project, in which various features regarding velocity and acceleration are measured for 30 subjects doing one of 6 activities, and obtain from them a tidy dataset with average of means and standard deviations of all features for each subject and each activity.

This is how the run_analysis script works:

* it reads the data for training and test sets, and the sets with the subjects and activities
* it adds the number of the subject and number of the activity for each observation to both sets
* it combines both sets and adds variable names
* it selects only variables measuring mean and standard deviation for each feature
* it labels the activities with their names
* it creates a tidy dataset in which average of all mean and standard deviation variables features are calculated for each subject and each activity

More information about the variables in the final dataset is available in the codebook.