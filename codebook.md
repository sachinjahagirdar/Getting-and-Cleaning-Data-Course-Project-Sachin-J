

The purpose of this code is to -
1) Merge the training and the test sets to create one data set
2) Extract only the measurements on the mean and standard deviation for each measurement
3) Use descriptive activity names to name the activities in the data set
4) Label the data set with descriptive variable names.
5) Create a second, independent tidy data set 

Key functions used in this code are -
rbind, grep, cbind, ddply
write.table function writes the formatted data into tidy data set named as avg_data.txt

x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files.
x_data, y_data and subject_data merge the previous datasets.
features contains the correct names for the x_data dataset, which are applied to the column names stored in mean_and_std_features, 
a numeric vector used to extract the desired data.

all_data merges x_data, y_data and subject_data.
avg_data contains the averages which are stored in a .txt file. 
