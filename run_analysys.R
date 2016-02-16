# Merge the training and test sets to create one data set as per the project requirement

library(plyr)
x_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")
subject_train <- read.table("subject_train.txt")

x_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
subject_test <- read.table("subject_test.txt")

# Creating X data set

x_data <- rbind(x_train, x_test)

# Creating y data set

y_data <- rbind(y_train, y_test)

# Creating subject data set

subject_data <- rbind(subject_train, subject_test)

# Extracting mean and standard deviation for each measurement

features <- read.table("features.txt")

# Columns with mean() or std() in their names
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# required columns
x_data <- x_data[, mean_and_std_features]


# correct the column names
names(x_data) <- features[mean_and_std_features, 2]


# Use descriptive activity names to name the activities in the data set

activities <- read.table("activity_labels.txt")

# update values with correct activity names
y_data[, 1] <- activities[y_data[, 1], 2]

# correct column name
names(y_data) <- "activity"

# correct column name
names(subject_data) <- "subject"

# bind all the data in a single data set
all_data <- cbind(x_data, y_data, subject_data)

avg_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(avg_data, "avg_data.txt", row.name=FALSE)
