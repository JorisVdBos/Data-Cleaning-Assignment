# This script will ...

# Downloading the files
# download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "data.zip")
# unzip("data.zip")

#Reading data
features <- read.table(file.path("UCI HAR Dataset","features.txt"), header = FALSE)
activityLabels <- read.table(file.path("UCI HAR Dataset","activity_labels.txt"), header = FALSE)

Xtest <- read.table(file.path("UCI HAR Dataset","test","X_test.txt"))
Ytest <- read.table(file.path("UCI HAR Dataset","test","Y_test.txt"))
subjectTest <- read.csv(file.path("UCI HAR Dataset","test","subject_test.txt"))

Xtrain <- read.table(file.path("UCI HAR Dataset","train","X_train.txt"))
Ytrain <- read.table(file.path("UCI HAR Dataset","train","Y_train.txt"))
subjectTrain <- read.csv(file.path("UCI HAR Dataset","train","subject_train.txt"))
