library(dplyr)
library(tidyr)

train_x <- read.table("./UCI HAR Dataset/train/x_train.txt", header= FALSE)
train_y <- read.csv("./UCI HAR Dataset/train/y_train.txt", header= FALSE, sep = " ")
train_sub <- read.csv("./UCI HAR Dataset/train/subject_train.txt", header= FALSE, sep = " ")

test_x <- read.table("./UCI HAR Dataset/test/x_test.txt", header= FALSE)
test_y <- read.csv("./UCI HAR Dataset/test/y_test.txt", header= FALSE, sep = " ")
test_sub <- read.csv("./UCI HAR Dataset/test/subject_test.txt", header= FALSE, sep = " ")

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
data_names <- read.table("./UCI HAR Dataset/features.txt")

data <- rbind(cbind(train_sub, train_y, train_x), cbind(test_sub, test_y, test_x))
names(data) <- c("subject", "activity", as.character(data_names[,2]))
data <- data[,grep("subject|activity|mean|std", names(data))]

#merging with activity labels to get names of activity from code
data <- merge(data, activity_labels, by.x = "activity", by.y = "V1", all.x= TRUE )
names(data)[ncol(data)] <- "activity_name"

#creating new data set with only means of variables
data_tidy <- data[,grep("subject|activity|mean", names(data))]
#gathering the averages for all variables
data_tidy <- gather(data_tidy, key = "variable", value = "average", -c(activity, activity_name, subject))

write.table(data, "final_data.txt", row.names = FALSE)
write.table(data_tidy, "tidy_data.txt", row.names = FALSE)
