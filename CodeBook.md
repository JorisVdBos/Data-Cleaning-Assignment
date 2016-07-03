Running the "run_analysis.R" code results in two data sets "featuresData" and "inertialSignalData". The choice was made to split the data up in two data frames, because the features are results from processing data over the whole period of one test time frame of 2.56 sec, while the signalling data itself is data points collected on discrete times. Both data frames can be linked by the column "timeFrameID".

# featuresData data frame
This data frame contains values for the features recorded in one test time frame of 2.56 sec.

Columns:
timeFrameID - This column was synthesized and consists of the subjectID and the number of the experiment on that subject.
subjectID - The subject's ID that performed the test. This column is extracted from "subject_test.txt"
activity - The activity the subject was performing. This column was extracted from "y_test.txt" and "y_train.txt" and reformed to a factor. The levels of the factor are extracted from "activity_labels.txt"

The next 561 columns are extracted from "X_test.txt" and "X_train.txt". The names of the features were extracted from "features.txt".

# inertialSignalData data frame
This data frame contains measurements of the accelerometer and gyroscope during the test time frames of 2.56 sec.

Columns:
timeFrameID - This column was synthesized and consists of the subjectID and the number of the experiment on that subject.

The following 1153 columns are extracted from the "Intertial Signals" folders and are named as such:
column 2 to 129:
estimatedBodyAccelerationX1 to estimatedBodyAccelerationX128 - extracted from "body_acc_x_test" and body_acc_x_train"
column 130 to 257:
estimatedBodyAccelerationY1 to estimatedBodyAccelerationY128 - extracted from "body_acc_y_test"and body_acc_y_train"
column 258 to 385:
estimatedBodyAccelerationZ1 to estimatedBodyAccelerationZ128 - extracted from "body_acc_z_test"and body_acc_y_train"
column 386 to 513:
gyroscopeX1 to gyroscopeX128 - extracted from "body_gyro_x_test" and "body_gyro_x_train"
column 514 to 643:
gyroscopeY1 to gyroscopeY128 - extracted from "body_gyro_y_test" and "body_gyro_y_train"
column 642 to 769:
gyroscopeZ1 to gyroscopeZ128 - extracted from "body_gyro_z_test" and "body_gyro_z_train"
column 770 to 897:
accelerometerX1 to accelerometerX128 - extracted from "total_acc_x_test" and "total_acc_x_train"
column 898 to 1025:
accelerometerY1 to accelerometerY128 - extracted from "total_acc_y_test" and "total_acc_y_train"
column 1026 to 1154:
accelerometerZ1 to accelerometerZ128 - extracted from "total_acc_z_test" and "total_acc_z_train"