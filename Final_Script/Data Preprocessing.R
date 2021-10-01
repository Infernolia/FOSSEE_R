# Purpose of this script: To prepare the data for analysis.

source("Data Cleaning.R")

#-------------------------------------------------------------------------------------------------------------#
# 1) Performing data type conversions.
#-------------------------------------------------------------------------------------------------------------#

# 1.1) Converting string values like "Not Attempted" to NA in numeric data columns.
Data[,22:35] <- apply(Data[,22:35],2,as.numeric)

# 1.2) Subsetting data.
# 1.2.1) Columns containing participants' background information.
Background <- 1:10
# 1.2.2) Columns containing comments, suggestions or opinions of the participants.
Suggestions <- c(16:17,21,63:67)
# 1.2.3) Columns containing quantitative and qualitative data.
Quantitative <- 22:35
Qualitative <- c(1:ncol(Data))[!c(1:ncol(Data))%in%c(Background,Suggestions,Quantitative)]

# 1.3) Converting the class of "Data" object to "data.frame" and creating a backup.
Data <- as.data.frame(Data)
Backup <- Data

# 1.4) Data type conversion from character to numeric for quantitative data columns.
for(i in 1:length(Quantitative))
{
  Data[,Quantitative[i]] <- as.numeric(Data[,Quantitative[i]])
}

# 1.5) Data type conversion from character to factor for qualitative data columns.
for(i in 1:length(Qualitative))
{
  Data[,Qualitative[i]] <- as.factor(Data[,Qualitative[i]])
}

#-------------------------------------------------------------------------------------------------------------#
# 2) Removing unnecessary data.
#-------------------------------------------------------------------------------------------------------------#

# 2.1) Removing R objects.
rm(i,Quantitative,Qualitative)

# 2.2) Removing columns containing participants' background information, comments, suggestions and/or opinions.
Data <- Data[,-c(Background,Suggestions)]