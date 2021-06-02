# Purpose of the script: To load the "JMOL Application Beginner Workshop" dataset from file and explore its content to find and remove missing and duplicate entries (if any).

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 1) Part 1: Loading necessary libraries.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 1.1) The "readxl" library is required to load data in the R environment from an excel file.
library(readxl)
# 1.2) The "dplyr" library is required for data manipulation.
library(dplyr)
# 1.3) The "DataExplorer" library is used for creative data visualization.
library(DataExplorer)

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 2) Part 2: Loading the necessary data file.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 2.1) Reading data from ".xls" file and storing its content into a dataframe object with the name "df". 
# Note: Ensure that the current session's working directory contains the required data file before running the R script.
df <- read_excel("original_jmol_data.xls")

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 3) Part 3: Changing column names of "df".
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 3.1) Setting appropriate column names for "df".
colnames(df) <- c(# 3.1.1) Participants' details:
                  "Name",
                  "Institute",
                  "Target Audience",
                  "Background",
                  "Background (Other)",
                  # 3.1.2) Participants' technical background:
                  "Pre-Workshop Training",
                  "Already Using Modelling Software in Organization",
                  "Already Using Modelling Software in Organization (Name of Software)",
                  "Used Jmol Before",
                  "Used Jmol Before (Purpose)",
                  # 3.1.3) Opinion on generic modeling software and 3D viewer:
                  "Difficulty in Teaching/Learning Without 3D Viewer",
                  "Jmol Usefulness in Teaching/Learning",
                  "Jmol Difficulty for Teaching",
                  "3D Visualization Will Create Interest",
                  "ICT Tools Participant Will Use for Learning",
                  "ICT Tools Participant Will Use for Learning (Other)",
                  "Conventional Methods of Visualization Used by Participant",
                  "Method Preferred After Learning Jmol",
                  "Jmol Usefulness in Assessing Students",
                  "ICT Tools Use Case in COVID Online Teaching",
                  "ICT Tools Use Case in COVID Online Teaching (Other)",
                  # 3.1.4) Spoken Tutorial feedback:
                  "(Spoken Tutorial 1) Intro To Jmol Application",
                  "(Spoken Tutorial 2) Create and Edit Molecular Models",
                  "(Spoken Tutorial 3) Modify Display and View",
                  "(Spoken Tutorial 4) Measurements and Labeling",
                  "(Spoken Tutorial 5) Script Console and Script Commands",
                  "(Spoken Tutorial 6) Surfaces and Orbitals",
                  "(Spoken Tutorial 7) Crystal Structure and Unit Cell",
                  # 3.1.5) Assignment feedback:
                  "(Assignment 1) Intro To Jmol Application",
                  "(Assignment 2) Create and Edit Molecular Models",
                  "(Assignment 3) Modify Display and View",
                  "(Assignment 4) Measurements and Labelling",
                  "(Assignment 5) Script Console and Script Commands",
                  "(Assignment 6) Surfaces and Orbitals",
                  "(Assignment 7) Crystal Structure and Unit Cell",
                  # 3.1.6) Knowledge of Jmol concepts before and after workshop:
                  "(Concept 1) Jmol 3D Modelling Knowledge Before Workshop",
                  "(Concept 1) Jmol 3D Modelling Knowledge After Workshop",
                  "(Concept 2) Jmol 3D Model Create Edit Knowledge Before Workshop",
                  "(Concept 2) Jmol 3D Model Create Edit Knowledge After Workshop",
                  "(Concept 3) Jmol Bond Measure Knowledge Before Workshop",
                  "(Concept 3) Jmol Bond Measure Knowledge After Workshop",
                  "(Concept 4) Jmol Orbital Create Knowledge Before Workshop",
                  "(Concept 4) Jmol Orbital Create Knowledge After Workshop",
                  "(Concept 5) Jmol Center of Axis Knowledge Before Workshop",
                  "(Concept 5) Jmol Center of Axis Knowledge After Workshop",
                  "(Concept 6) Jmol Point Groups Knowledge Before Workshop",
                  "(Concept 6) Jmol Point Groups Knowledge After Workshop",
                  "(Concept 7) Jmol Script CMD 3D Model Knowledge Before Workshop",
                  "(Concept 7) Jmol Script CMD 3D Model Knowledge After Workshop",
                  "(Concept 8) Jmol Crystal Display Knowledge Before Workshop",
                  "(Concept 8) Jmol Crystal Display Knowledge After Workshop",
                  # 3.1.7) Overall workshop feedback:
                  "Quality of Instructional Material",
                  "Self Learning Experience",
                  "Spoken Tutorial Forum Experience",
                  "Online Discussion Session (Feedback)",
                  "Interaction with Teaching Assistant (Feedback)",
                  "Quality of Workshop",
                  "Exposure To New Knowledge",
                  "Unhappy With Workshop Format",
                  "Willingness To Participate in Activities",
                  "Did Not Learn Much",
                  "Will Recommend Workshop",
                  "Liked Aspects of Workshop",
                  "Suggestions",
                  "Forum Doubt Answering (Feedback)",
                  "Workshop Learnings Use Case",
                  "Other Feedback")

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 4) Part 4: Identifying row entries containing NA in "df".
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 4.1) Finding the number of NA values in each row.
df %>% is.na %>% rowSums
# 4.2) Finding the column indexes for each row containing NA values.
`Row indexes having NA` <- apply(as.data.frame(t(apply(df,1,is.na))),1,function(x){which(x)})
# 4.3) Finding all indexes associated with the columns containing NA values.
`NA columns` <- NULL
for(i in 1:c(length(`Row indexes having NA`)-1)){
  temp <- unique(c(`Row indexes having NA`[[i]],`Row indexes having NA`[[i+1]]))
  `NA columns` <- append(`NA columns`,temp)
}
# 4.4) Viewing the data contained in the columns with NA values (Uncomment the following command to view the data).
# View(df[,unique(`NA columns`)])
# NOTE: After observing the columns with NA values, it is found that the first row is useless because it doesn't even contain the participant's name. Therefore, removing it.
# 4.5) Removing first row.
df <- df[-c(1), ]
# 4.6) Checking the number of NA values for the remaining rows.
# 4.6.1) Finding the column indexes for each row containing NA values.
`Row indexes having NA` <- apply(as.data.frame(t(apply(df,1,is.na))),1,function(x){which(x)})
# 4.6.2) Finding all indexes associated with the columns containing NA values.
`NA columns` <- NULL
for(i in 1:c(length(`Row indexes having NA`)-1)){
  temp <- unique(c(`Row indexes having NA`[[i]],`Row indexes having NA`[[i+1]]))
  `NA columns` <- append(`NA columns`,temp)
}
# 4.6.3) Viewing the data contained in the columns with NA values (Uncomment the following command to view the data).
# View(df[,unique(`NA columns`)])
# NOTE: On observation it was found that the columns containing NA value/s are non-numeric and contain valuable comments from participants. Hence, these columns should not be removed.

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 5) Part 5: Checking whether there are multiple entries made by the same participant or not.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 5.1) Checking whether the number of unique participant names matches with the total number of rows in the data.
all.equal(nrow(df),length(unique(df$Name)))
# 5.2) Finding similarities between names of participants to eliminate possible fraudulent entries.
# 5.2.1) Extracting all participants' names from "df".
names <- df %>% pull(Name)
# 5.2.2) Performing string matching operation among the extracted names.
matches <- lapply(names,agrep,names,value=TRUE)
# 5.2.3) Obtaining the number of matching names for each name.
unique(lengths(matches)-1)
# NOTE: Zero indicates that all the names are unique.

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 6) Part 6: Clearing all the R objects created in this script from the environment, except for the dataframe needed in the next script.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 6.1) Removing all objects except dataframe df.
rm(list=setdiff(ls(),"df"))

