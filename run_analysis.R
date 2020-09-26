run_analysis <- function(){
  test_data <- read.table("./Data/UCI HAR Dataset/test/X_test.txt")
  test_labels <- read.table("./Data/UCI HAR Dataset/test/y_test.txt")
  test_subjects <- read.table("./Data/UCI HAR Dataset/test/subject_test.txt")
  train_data <- read.table("./Data/UCI HAR Dataset/train/X_train.txt")
  train_labels <- read.table("./Data/UCI HAR Dataset/train/y_train.txt")
  train_subjects <- read.table("./Data/UCI HAR Dataset/train/subject_train.txt")
  act_labels <- read.table("./Data/UCI HAR Dataset/activity_labels.txt")
  test_names <- read.table("./Data/UCI HAR Dataset/features.txt")
  colnames(test_data) <- test_names[,2]
  colnames(train_data) <- test_names[,2]
  test_data <- cbind(test_subjects,test_labels,test_data)
  train_data <- cbind(train_subjects,train_labels,train_data)
  comb_data <- rbind(train_data,test_data)
  test_names <- colnames(comb_data)
  test_names[1:2] <- c("Individual","Activity")
  colnames(comb_data) <- test_names
  data <- comb_data %>% select(Individual:Activity,contains("mean()")|contains("std()"))
  rm(test_data,train_data,comb_data)
  data$Activity <- factor(data$Activity,levels = act_labels[,1],labels = act_labels[,2])
  test_names=c("Individual","Activity","Body Acceleration X axis timebase - mean",
               "Body Acceleration Y axis timebase - mean","Body Acceleration Z axis timebase - mean",
               "Gravity Acceleration X axis timebase - mean","Gravity Acceleration Y axis timebase - mean",
               "Gravity Acceleration Z axis timebase - mean","Body Acceleration Jerk X axis timebase - mean",
               "Body Acceleration Jerk Y axis timebase - mean","Body Acceleration Jerk Z axis timebase - mean",
               "Body Gyro measurement X axis timebase - mean","Body Gyro measurement Y axis timebase - mean",
               "Body Gyro measurement Z axis timebase - mean","Body Gyro Jerk measurement X axis timebase - mean",
               "Body Gyro Jerk measurement Y axis timebase - mean","Body Gyro Jerk measurement Z axis timebase - mean",
               "Body Acceleration Magnitude timebase - mean","Gravity Acceleration Magnitude timebase - mean",
               "Body Acceleration Jerk Magnitude timebase - mean","Body Gyro measurement Magnitude timebase - mean",
               "Body Gyro measurement Jerk Magnitude timebase - mean","Body Acceleration X axis FFT - mean",
               "Body Acceleration Y axis FFT - mean","Body Acceleration Z axis FFT - mean",
               "Body Acceleration Jerk X axis FFT - mean","Body Acceleration Jerk Y axis FFT - mean",
               "Body Acceleration Jerk Z axis FFT - mean","Body Gyro measurement X axis FFT - mean",
               "Body Gyro measurement Y axis FFT - mean","Body Gyro measurement Z axis FFT - mean",
               "Body Acceleration Magnitude FFT - mean","Body Acceleration Jerk Magnitude FFT - mean",
               "Body Gyro measurement Magnitude FFT - mean","Body Gyro measurement Jerk Magnitude FFT - mean",
               "Body Acceleration X axis timebase - standard deviation","Body Acceleration Y axis timebase - standard deviation",
               "Body Acceleration Z axis timebase - standard deviation","Gravity Acceleration X axis timebase - standard deviation",
               "Gravity Acceleration Y axis timebase - standard deviation",
               "Gravity Acceleration Z axis timebase - standard deviation",
               "Body Acceleration Jerk X axis timebase - standard deviation",
               "Body Acceleration Jerk Y axis timebase - standard deviation",
               "Body Acceleration Jerk Z axis timebase - standard deviation",
               "Body Gyro measurement X axis timebase - standard deviation",
               "Body Gyro measurement Y axis timebase - standard deviation",
               "Body Gyro measurement Z axis timebase - standard deviation",
               "Body Gyro Jerk measurement X axis timebase - standard deviation",
               "Body Gyro Jerk measurement Y axis timebase - standard deviation",
               "Body Gyro Jerk measurement Z axis timebase - standard deviation",
               "Body Acceleration Magnitude timebase - standard deviation",
               "Gravity Acceleration Magnitude timebase - standard deviation",
               "Body Acceleration Jerk Magnitude timebase - standard deviation",
               "Body Gyro measurement Magnitude timebase - standard deviation",
               "Body Gyro measurement Jerk Magnitude timebase - standard deviation",
               "Body Acceleration X axis FFT - standard deviation","Body Acceleration Y axis FFT - standard deviation",
               "Body Acceleration Z axis FFT - standard deviation","Body Acceleration Jerk X axis FFT - standard deviation",
               "Body Acceleration Jerk Y axis FFT - standard deviation","Body Acceleration Jerk Z axis FFT - standard deviation",
               "Body Gyro measurement X axis FFT - standard deviation","Body Gyro measurement Y axis FFT - standard deviation",
               "Body Gyro measurement Z axis FFT - standard deviation","Body Acceleration Magnitude FFT - standard deviation",
               "Body Acceleration Jerk Magnitude FFT - standard deviation","Body Gyro measurement Magnitude FFT - standard deviation",
               "Body Gyro measurement Jerk Magnitude FFT - standard deviation")
  colnames(data) <- test_names
  sum_data <- data %>% group_by(Individual,Activity) %>% summarize_all(mean)
  write.table(sum_data,".Results.txt")
}