## Code Book

This file describes the data used and the processing required to create the resulting tidy data set for this project.

### Overview

A smartphone captured various movement data of 30 volunteers performing 6 different activities.

### Explanation of each file

* `features.txt` gives the names of the 561 features.
* `activity_labels.txt` gives the names and IDs for each of the 6 activities.

* `X_train.txt` shows 7352 observations of the 561 features, for 21 of the 30 volunteers.
* `subject_train.txt` shows a vector of 7352 integers, denoting the ID of the volunteer related to each of the observations in `X_train.txt`.
* `y_train.txt`: shows a vector of 7352 integers, denoting the ID of the activity related to each of the observations in `X_train.txt`.

* `X_test.txt`: shows 2947 observations of the 561 features, for 9 of the 30 volunteers.
* `subject_test.txt`: shows a vector of 2947 integers, denoting the ID of the volunteer related to each of the observations in `X_test.txt`.
* `y_test.txt`: shows a vector of 2947 integers, denoting the ID of the activity related to each of the observations in `X_test.txt`.

Information about the files are in `README.txt`. Information about features are in `features_info.txt`. The analysis did not use the raw signal data, using only the files listed above. The data files in the "Inertial Signals" folders were ignored.

### Processing steps

1. Relevant data files were read into data frames, column headers added, and training and test sets were combined into a single data set.
2. Feature columns were removed that did not contain the exact string "mean()" or "std()", leaving 66 feature columns plus the subjectID and activity columns.
3. The activity column was converted from a integer to a factor, using labels describing the activities.
4. A "tidy" data set was created containing the mean and standard deviation of each feature for each subject and each activity. Thus, subject #1 has 6 rows in the tidy data set (one row for each activity), and each row contains the mean and std value for each of the 66 features for that subject/activity combination. Since there are 30 subjects, there are a total of 180 rows.
5. The tidy data set was output to a CSV file.