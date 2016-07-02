# This script defines two functions: to download the data and read the data
# Running it will check the availablity of the data. If not present, it will download it. 
# It will then commence to read the data and 

getData <- function() { 
        download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "data.zip")
        unzip("data.zip")
        file.remove("data.zip")
}

#This function reads either the "test" or "train" data. Which one is given by the "map" argument
readData <- function(map) {
        
        featureNames <- read.table(file.path("UCI HAR Dataset","features.txt"), header = FALSE)
        activityLabels <- read.table(file.path("UCI HAR Dataset","activity_labels.txt"), header = FALSE)
        
        # Reading the features data
        features <- read.table(file.path("UCI HAR Dataset", map, paste0("X_", map, ".txt")))
        names(features) <- featureNames[,2]
        
        # Reading the activity data and transforming to a factor
        activity <- read.table(file.path("UCI HAR Dataset", map, paste0("Y_", map, ".txt")), colClasses = "character")
        activity <- factor(activity[,1])
        levels(activity) <- activityLabels[,2]
        
        # Reading the intertial signals
        subjectID <- read.table(file.path("UCI HAR Dataset", map, paste0("subject_", map, ".txt")))
        names(subjectID) <- "subjectID"
        
        # Reading the intertial signal data
        testBodyAccX <- read.table(file.path("UCI HAR Dataset", map, "Inertial Signals", paste0("body_acc_X_", map, ".txt")))
        
        # Merging the data together in a data frame
        data.frame(subjectID, activity, features)
}

# check if data available
if (!file.exists("UCI HAR Dataset")) 
        getdata()

# Reading the test and train data
testData <- readData("test")
trainData <- readData("train")

# Merging the test and train data