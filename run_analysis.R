# This script defines two functions: to download the data and read the data
# Running it will check the availablity of the data. If not present, it will download it. 
# It will then commence to read the data and 

getData <- function() { 
        download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "data.zip")
        unzip("data.zip")
        file.remove("data.zip")
}


#This function reads either the "test" or "train" features data. Which one is given by the "map" argument
readFeatures <- function(map) {
        print(paste("Reading", map, "features data."))
        
        # Reading the subject data
        featureNames <- read.table(file.path("UCI HAR Dataset","features.txt"), header = FALSE)
        
        # Reading the features data
        features <- read.table(file.path("UCI HAR Dataset", map, paste0("X_", map, ".txt")))
        names(features) <- featureNames[,2]
        
        # Reading the activity data and transforming to a factor
        activity <- read.table(file.path("UCI HAR Dataset", map, paste0("Y_", map, ".txt")), colClasses = "character")
        activity <- factor(activity[,1])
        activityLabels <- read.table(file.path("UCI HAR Dataset","activity_labels.txt"), header = FALSE)
        levels(activity) <- activityLabels[,2]
        
        # Reading the subjects
        subjectID <- read.table(file.path("UCI HAR Dataset", map, paste0("subject_", map, ".txt")))
        names(subjectID) <- "subjectID"
        
        featuresData = data.frame(timeFrameID = generateID(map), subjectID, activity, features)
}

#This function reads either the "test" or "train" inertial signal data. Which one is given by the "map" argument
readInertialSignalData <- function(map) {
        print(paste("Reading", map, "signal data."))
        
        for(i in c("body_acc_x_", "body_acc_y_", "body_acc_z_", "body_gyro_x_",  "body_gyro_y_",  "body_gyro_z_",
                   "total_acc_x_", "total_acc_y_", "total_acc_z_")) {
                
                j <- read.table(file.path("UCI HAR Dataset", map, "Inertial Signals",
                                                     paste0(i, map, ".txt")))
                
                # Concstruction of the names
                names <- sub("body_acc_", "estimatedBodyAcceleration", i)
                names <- sub("body_gyro_", "gyroscope", names)
                names <- sub("total_acc_", "accelerometer", names)
                names <- sub("x_", "X", names)
                names <- sub("y_", "Y", names)
                names <- sub("z_", "Z", names)
                
                names(j) <- paste0(names, seq(1:128))
                
                if (exists("inertialData")) {
                        inertialData <- cbind(inertialData, j)
                } else
                        inertialData <- j
        }
        

        signalReadings = cbind(timeFrameID = generateID(map), inertialData)
}

# Generating the test ID column
generateID <- function(map) {
        
        subjectID <- read.table(file.path("UCI HAR Dataset", map, paste0("subject_", map, ".txt")))
        
        for(i in unique(subjectID)[,1]) {
                j <- paste(i, 1:sum(subjectID==i))
                
                if (exists("timeFrameID")) {
                        timeFrameID <- c(timeFrameID, j)
                } else
                        timeFrameID <- j
                
        }
        
        timeFrameID
}

# check if data available
if (!file.exists("UCI HAR Dataset")) {
        print("Files not found. Donwloading data.")
        getdata()
        print("Download complete!")
} else
        print("Data files are present.")

# Reading the test and train data and merging the two in two data frames
featuresData <- rbind(readFeatures("test"), readFeatures("train"))
inertialSignalData <- rbind(readInertialSignalData("test"), readInertialSignalData("train"))
print("Data reading completed!")