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

## from an excel file
install.packages("readxl")
library(readxl)
Data_SuperstoreXLS <- read_excel("C:/Users/SBM ITB/OneDrive/Desktop/Rcode/Project 1 - Introduction to R/Superstore.xlsx",
col_types = c("numeric", "text", "date",
"date", "text", "text", "text", "text",
"text", "text", "text", "text", "text",
"text", "text", "text", "text", "numeric",
"numeric", "numeric", "numeric",
"numeric"))
View(Data_Superstore)

# Getting Information on a Dataset in R - https://www.datacamp.com/doc/r/contents ----
# viewing a dataframe
# class of an object (numeric, matrix, data frame, etc)
class(Data_Superstore)

# dimensions of an object
dim(Data_Superstore)

# list the variables in Data_Superstore
names(Data_Superstore)

# list the structure of Data_Superstore
str(Data_Superstore)

# print first 10 rows of Data_Superstore
head(Data_Superstore, n=10)
tail(Data_Superstore, n=10)

# summary of Data_Superstore
summary(Data_Superstore)


#### Subsetting Data ----
#### https://www.datacamp.com/tutorial/subsets-in-r
#### selecting the first 6 rows
abc <- Data_Superstore[1:6,]
View(abc)

#### selecting the first 6 columns
abc <- Data_Superstore[,1:6]
View(abc)

#### selecting the first 6 rows for a specified columns
abc <- Data_Superstore[1:6, c(1:7,14, 16:21)]
View(abc)

#### selecting the first 6 rows for a specified columns
abc <- Data_Superstore[1:6, c(1:7)]
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



abc <- subset(Data_Superstore, Segment == "Consumer")
View(abc)