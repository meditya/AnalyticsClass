# Getting and Setting Working Directory
getwd()
setwd("C:/Users/SBM ITB/OneDrive/Desktop/RCode/Project 1 - Introduction to R")
getwd()
# list objects in the working environment
ls()




# Importing Data ----
### from a csv file
### first row contains variable names, comma is separator
### assign the variable id to row names
### note the / instead of \ on mswindows systems
### mydata <- read.table("c:/mydata.csv", header=TRUE, sep=",", row.names="id")
data_SuperstoreCSV <- read.csv("C:/Users/SBM ITB/OneDrive/Desktop/Rcode/Project 1 - Introduction to R/SuperstoreCSV.csv", row.names=1)
View(data_SuperstoreCSV)




# Getting Information on a Dataset in R - https://www.datacamp.com/doc/r/contents ----
# viewing a dataframe
# class of an object (numeric, matrix, data frame, etc)
class(data_SuperstoreCSV)

# dimensions of an object
dim(data_SuperstoreCSV)

# list the variables in data_SuperstoreCSV
names(data_SuperstoreCSV)

# list the structure of data_SuperstoreCSV
str(data_SuperstoreCSV)

# print first 10 rows of data_SuperstoreCSV
head(data_SuperstoreCSV, n=10)
tail(data_SuperstoreCSV, n=10)

# summary of data_SuperstoreCSV
summary(data_SuperstoreCSV)




#### Subsetting Data ----
#### https://www.datacamp.com/tutorial/subsets-in-r
#### selecting the first 6 rows
abc <- data_SuperstoreCSV[1:6,]
View(abc)

#### selecting the first 6 columns
abc <- data_SuperstoreCSV[,1:6]
View(abc)

#### selecting the first 6 rows for a specified columns
abc <- data_SuperstoreCSV[1:6, c(1:7,14, 16:21)]
View(abc)

#### selecting the first 6 rows for a specified columns
abc <- data_SuperstoreCSV[1:6, c(1:7)]
View(abc)

#### selecting the first 6 rows for a specified "Consumer" segment
abc <- subset(data_SuperstoreCSV, Segment == "Consumer")
View(abc)



# Ensure date columns are in POSIXct format
data_SuperstoreCSV$Order.Date <- as.POSIXct(data_SuperstoreCSV$Order.Date, format = "%m/%d/%Y")
data_SuperstoreCSV$Ship.Date <- as.POSIXct(data_SuperstoreCSV$Ship.Date, format = "%m/%d/%Y")

# Calculate Shipping Duration
Shipping_Duration <- data_SuperstoreCSV$Ship.Date - data_SuperstoreCSV$Order.Date

# Convert Shipping Duration to numeric (in days) and add as a new column
data_SuperstoreCSV$Shipping_Duration <- as.numeric(Shipping_Duration) / 86400  # Convert seconds to days

# View the updated data frame
View(data_SuperstoreCSV)

# Get column names
colnames(data_SuperstoreCSV)




# Convert to a tibble
library("tibble")
col_order <- c("Order.ID", "Order.Date", "Ship.Date", "Ship.Mode", "Shipping_Duration")
data_SuperstoreCSV2 <- data_SuperstoreCSV[, col_order]
View(data_SuperstoreCSV2)
summary(data_SuperstoreCSV2)
