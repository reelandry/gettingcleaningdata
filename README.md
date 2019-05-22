## Coursera Project for "Getting and Cleaning Data"

The class project for was to read in the ["Human Activity Recognition Using Smartphones" data set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), perform analysis, and output a "tidy" data set.

**Steps done before running the R script:**

1. Download the zip file from [this URL](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
2. Unzip the file.
3. Move the following files to the same directory as the R script:
	* `features.txt`
	* `subject_train.txt`
	* `subject_test.txt`
	* `X_train.txt`
	* `X_test.txt`
	* `y_train.txt`
	* `y_test.txt`

**Run the R script ([run_analysis.R](run_analysis.R)).** This script requires the a package [reshape2 package](http://cran.r-project.org/web/packages/reshape2/index.html), which can be downloaded from CRAN.

**The output of the R script is the "tidy" data set, [tidy_data.txt](tidy_data.txt).**

Further information of these data and the analysis is in the [code book](CodeBook.md).
