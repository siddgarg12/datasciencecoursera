There is a single script in the code repository. 

The file CodeBook.md details the various combine, merges, clean-ups done in the script run_analysis.R. 

The run_analysis.R uses the base and tidyr package to give the desired output:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. (final data set is named "data")
5. From the data set in step 4, creates a second (named "data_tidy"), independent tidy data set with the average of each variable for each activity and each subject.
