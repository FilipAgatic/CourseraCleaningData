
# Project title: 
**MERGING AND CLEANING THE HUMAN ACTIVITY SMARTPHONE DATASET (Getting and Cleaning Data Coursera course final project)**

# Project author:
**Filip Agatić**

# Dataset:
Human Activity Recognition Using Smartphones Dataset Version 1.0

# Dataset authors:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit� degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

# Data collection Methods 
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

**For each record it is provided:**
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

# run_analysis processing steps 
1) Checks for UCI HAR Dateset directory in the current work directory, returns error warning if not present.
2) All the necessary files are imported
3) all unnecessary (and duplicate) column variables are removed
4) both the training data and testing data subsets are marked with an additional column 'setlabel' in case it would be relevant for further analysis (not present in the output tidy data).
5) Activity labels are changed from numbers to descriptions for clarity 
6) subject identifiers are added
7) datasets are merged 
8) labels are corrected to satisfy the bellow mentioned convention 
9) data is grouped by subjects and activity and the sensor measures are being averaged over the two. 
10) the tidy dataset 'tidyMeans.txt' is exported. 


# Variable names in the 'tidyMeans.txt'
A snake case convention was applied to naming column variables separating meaningful descriptive word chunks within variables with an underscore delimeters. All of the upper cases were removed to decrease a chance of typos. The meaining of each part:
t - time
f - frequency
_body - measure taken from the body
_gravity - measure taken from the Earth 
_acc - accelometer data
_gyro - gyroscope data
_jerk - type of movement
_mag - magnitude (collapsed over dimentions)
_mean - average value
_std - standard deviation of the mean
_x - axis of measurement 1
_y - axis of measurement 2
_z - axis of measurement 3


All the variable names in order: 
"1" "activity" [WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING]
"2" "subjects" [1:30]
"3" "t_body_acc_mean_x" [all sensor variables take normalized continuous values from -1 to 1.]
"4" "t_body_acc_mean_y"
"5" "t_body_acc_mean_z"
"6" "t_gravity_acc_mean_x"
"7" "t_gravity_acc_mean_y"
"8" "t_gravity_acc_mean_z"
"9" "t_body_acc_jerk_mean_x"
"10" "t_body_acc_jerk_mean_y"
"11" "t_body_acc_jerk_mean_z"
"12" "t_body_gyro_mean_x"
"13" "t_body_gyro_mean_y"
"14" "t_body_gyro_mean_z"
"15" "t_body_gyro_jerk_mean_x"
"16" "t_body_gyro_jerk_mean_y"
"17" "t_body_gyro_jerk_mean_z"
"18" "t_body_acc_mag_mean"
"19" "t_gravity_acc_mag_mean"
"20" "t_body_acc_jerk_mag_mean"
"21" "t_body_gyro_mag_mean"
"22" "t_body_gyro_jerk_mag_mean"
"23" "f_body_acc_mean_x"
"24" "f_body_acc_mean_y"
"25" "f_body_acc_mean_z"
"26" "f_body_acc_jerk_mean_x"
"27" "f_body_acc_jerk_mean_y"
"28" "f_body_acc_jerk_mean_z"
"29" "f_body_gyro_mean_x"
"30" "f_body_gyro_mean_y"
"31" "f_body_gyro_mean_z"
"32" "f_body_acc_mag_mean"
"33" "f_body_body_acc_jerk_mag_mean"
"34" "f_body_body_gyro_mag_mean"
"35" "f_body_body_gyro_jerk_mag_mean"
"36" "t_body_acc_std_x"
"37" "t_body_acc_std_y"
"38" "t_body_acc_std_z"
"39" "t_gravity_acc_std_x"
"40" "t_gravity_acc_std_y"
"41" "t_gravity_acc_std_z"
"42" "t_body_acc_jerk_std_x"
"43" "t_body_acc_jerk_std_y"
"44" "t_body_acc_jerk_std_z"
"45" "t_body_gyro_std_x"
"46" "t_body_gyro_std_y"
"47" "t_body_gyro_std_z"
"48" "t_body_gyro_jerk_std_x"
"49" "t_body_gyro_jerk_std_y"
"50" "t_body_gyro_jerk_std_z"
"51" "t_body_acc_mag_std"
"52" "t_gravity_acc_mag_std"
"53" "t_body_acc_jerk_mag_std"
"54" "t_body_gyro_mag_std"
"55" "t_body_gyro_jerk_mag_std"
"56" "f_body_acc_std_x"
"57" "f_body_acc_std_y"
"58" "f_body_acc_std_z"
"59" "f_body_acc_jerk_std_x"
"60" "f_body_acc_jerk_std_y"
"61" "f_body_acc_jerk_std_z"
"62" "f_body_gyro_std_x"
"63" "f_body_gyro_std_y"
"64" "f_body_gyro_std_z"
"65" "f_body_acc_mag_std"
"66" "f_body_body_acc_jerk_mag_std"
"67" "f_body_body_gyro_mag_std"
"68" "f_body_body_gyro_jerk_mag_std"


