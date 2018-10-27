

# Loading raw data from the files
```r
train_x <- read.table("./UCI HAR Dataset/train/x_train.txt", header= FALSE)
train_y <- read.csv("./UCI HAR Dataset/train/y_train.txt", header= FALSE, sep = " ")
train_sub <- read.csv("./UCI HAR Dataset/train/subject_train.txt", header= FALSE, sep = " ")

test_x <- read.table("./UCI HAR Dataset/test/x_test.txt", header= FALSE)
test_y <- read.csv("./UCI HAR Dataset/test/y_test.txt", header= FALSE, sep = " ")
test_sub <- read.csv("./UCI HAR Dataset/test/subject_test.txt", header= FALSE, sep = " ")
```

# Transfomations done on data are - 
## Merge test and train data - using the rbind command
Changing labels names from a file - the names of the data frame "data" are not intuitive. so the names are loaded from the file activity_labels.txt
```r
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
data_names <- read.table("./UCI HAR Dataset/features.txt")
```

## Selecting required columns only

```r
names(data) <- c("subject", "activity", as.character(data_names[,2]))
data <- data[,grep("subject|activity|mean|std", names(data))]
```

## merging with activity labels to get names of activity from code
```r
data <- merge(data, activity_labels, by.x = "activity", by.y = "V1", all.x= TRUE )
names(data)[ncol(data)] <- "activity_name"
```

## Creating new data tidy data set
The new data set has to have the means of variables by activity and subject, so the data set should have 4 columns 
namely activity, subject, variable and average
```r
data_tidy <- data[,grep("subject|activity|mean", names(data))]
#gathering the averages for all variables
data_tidy <- gather(data_tidy, key = "variable", value = "average", -c(activity, activity_name, subject))
```
