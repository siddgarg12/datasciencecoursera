


```r
train_x <- read.table("./UCI HAR Dataset/train/x_train.txt", header= FALSE)
train_y <- read.csv("./UCI HAR Dataset/train/y_train.txt", header= FALSE, sep = " ")
train_sub <- read.csv("./UCI HAR Dataset/train/subject_train.txt", header= FALSE, sep = " ")

test_x <- read.table("./UCI HAR Dataset/test/x_test.txt", header= FALSE)
test_y <- read.csv("./UCI HAR Dataset/test/y_test.txt", header= FALSE, sep = " ")
test_sub <- read.csv("./UCI HAR Dataset/test/subject_test.txt", header= FALSE, sep = " ")
```

Transfomations done on data are - 
Merge test and train data - using the rbind command
Changing labels names from a file - the names of the data frame "data" are not intuitivive. so the names are loaded from the file "activity_labels.txt
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
data_names <- read.table("./UCI HAR Dataset/features.txt")
