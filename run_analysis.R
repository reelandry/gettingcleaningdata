## R script called run_analysis.R that cleans a number of data sets
# load the reshape2 package
library(reshape2)

## 1) Merges the training and the test sets to create one data set.

# read data into data frames
sub_train <- read.table("subject_train.txt")
sub_test <- read.table("subject_test.txt")
X_train <- read.table("X_train.txt")
X_test <- read.table("X_test.txt")
y_train <- read.table("y_train.txt")
y_test <- read.table("y_test.txt")

# column names for subject files
names(sub_train) <- "subjectID"
names(sub_test) <- "subjectID"

# column names for measurement files
featureNames <- read.table("features.txt")
names(X_train) <- featureNames$V2
names(X_test) <- featureNames$V2

# column names for label files
names(y_train) <- "activity"
names(y_test) <- "activity"

# combine files into one dataset
train <- cbind(sub_train, y_train, X_train)
test <- cbind(sub_test, y_test, X_test)
combined <- rbind(train, test)

## 2) Extracts only the measurements on the mean and standard
## deviation for each measurement.

# determine which columns contain "mean()" or "std()"
meanstdcols <- grepl("mean\\(\\)", names(combined)) |
    grepl("std\\(\\)", names(combined))

# ensure that we also keep the subjectID and activity columns
meanstdcols[1:2] <- TRUE

# remove unnecessary columns
combined <- combined[, meanstdcols]

## 3) Uses descriptive activity names to name the activities
## in the data set, and 4) Appropriately labels the data set with descriptive
## activity names.

# convert the activity column from integer to factor
combined$activity <- factor(combined$activity, labels=c("Walking",
                                                        "Walking Upstairs",
                                                        "Walking Downstairs",
                                                        "Sitting",
                                                        "Standing",
                                                        "Laying"))


## 5) Creates a second, independent tidy data set with the
## average of each variable for each activity and each subject.

# create the tidy data set
melted <- melt(combined, id=c("subjectID","activity"))
tidy <- dcast(melted, subjectID+activity ~ variable, mean)

# write the tidy data set to a file
write.csv(tidy, "tidy.csv", row.names=FALSE)