# Purpose of this script: To load the "JMOL Application Beginner Workshop" data set and explore its content to find and remove missing and/or duplicate entries (if any).

#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 1) Loading libraries.
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 1.1) The "readxl" library is required to load data in the R environment from an excel file.
library(readxl)
# 1.2) The "dplyr" library is required for data manipulation.
library(dplyr)
# 1.3) The "skimr" library is required for generating a summary of data.
library(skimr)

#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 2) Loading the necessary data file.
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 2.1) Reading data from ".xls" file and storing its content into a data frame object with the name "Data". 
# Note: Ensure that the current session's working directory contains the required data file before running the R script.
Data <- read_excel("Jmol Application Beginner Workshop.xls")

#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 3) Changing column names of "Data".
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 3.1) Setting appropriate column names for "Data".
colnames(Data) <- c(# 3.1.1) Participants' details:
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
                  "Conventional Methods of Visualization Used and Purpose",
                  "Method Preferred After Learning Jmol",
                  "Jmol Usefulness in Assessing Students",
                  "ICT Tools Use Case in COVID Online Teaching",
                  "ICT Tools Use Case in COVID Online Teaching (Other)",
                  # 3.1.4) Spoken Tutorial feedback:
                  "(Spoken Tutorial) Intro To Jmol Application",
                  "(Spoken Tutorial) Create and Edit Molecular Models",
                  "(Spoken Tutorial) Modify Display and View",
                  "(Spoken Tutorial) Measurements and Labeling",
                  "(Spoken Tutorial) Script Console and Script Commands",
                  "(Spoken Tutorial) Surfaces and Orbitals",
                  "(Spoken Tutorial) Crystal Structure and Unit Cell",
                  # 3.1.5) Assignment feedback:
                  "(Assignment) Intro To Jmol Application",
                  "(Assignment) Create and Edit Molecular Models",
                  "(Assignment) Modify Display and View",
                  "(Assignment) Measurements and Labelling",
                  "(Assignment) Script Console and Script Commands",
                  "(Assignment) Surfaces and Orbitals",
                  "(Assignment) Crystal Structure and Unit Cell",
                  # 3.1.6) Knowledge of Jmol concepts before and after workshop:
                  "(Concept) Jmol 3D Modelling Knowledge Before Workshop",
                  "(Concept) Jmol 3D Modelling Knowledge After Workshop",
                  "(Concept) Jmol 3D Model Create Edit Knowledge Before Workshop",
                  "(Concept) Jmol 3D Model Create Edit Knowledge After Workshop",
                  "(Concept) Jmol Bond Measure Knowledge Before Workshop",
                  "(Concept) Jmol Bond Measure Knowledge After Workshop",
                  "(Concept) Jmol Orbital Create Knowledge Before Workshop",
                  "(Concept) Jmol Orbital Create Knowledge After Workshop",
                  "(Concept) Jmol Center of Axis Knowledge Before Workshop",
                  "(Concept) Jmol Center of Axis Knowledge After Workshop",
                  "(Concept) Jmol Point Groups Knowledge Before Workshop",
                  "(Concept) Jmol Point Groups Knowledge After Workshop",
                  "(Concept) Jmol Script CMD 3D Model Knowledge Before Workshop",
                  "(Concept) Jmol Script CMD 3D Model Knowledge After Workshop",
                  "(Concept) Jmol Crystal Display Knowledge Before Workshop",
                  "(Concept) Jmol Crystal Display Knowledge After Workshop",
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
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 4) Identifying row and column entries containing NA in "Data".
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 4.1) Finding the count of NA in each row.
Data %>% is.na %>% rowSums
# 4.2) Finding the column indexes for each row containing NA.
`NA rows` <- apply(as.data.frame(t(apply(Data,1,is.na))),1,function(x){which(x)})
# 4.3) Finding all column indexes containing NA.
`NA columns` <- NULL
for(i in 1:c(length(`NA rows`)-1)){
  temp <- unique(c(`NA rows`[[i]],`NA rows`[[i+1]]))
  `NA columns` <- append(`NA columns`,temp)
}
# 4.4) Viewing the data contained in the columns with NA (un-comment to view).
# View(Data[,unique(`NA columns`)])
# NOTE: After observing the columns with NA, it is found that the first row is useless because it doesn't even contain the participant's name. Therefore, removing it.
# 4.5) Removing first row.
Data <- Data[-c(1), ]
# 4.6) Checking the count of NA for the remaining data.
# 4.6.1) Finding the column indexes for each row containing NA.
`NA rows` <- apply(as.data.frame(t(apply(Data,1,is.na))),1,function(x){which(x)})
# 4.6.2) Finding all column indexes containing NA.
`NA columns` <- NULL
for(i in 1:c(length(`NA rows`)-1)){
  temp <- unique(c(`NA rows`[[i]],`NA rows`[[i+1]]))
  `NA columns` <- append(`NA columns`,temp)
}
# 4.6.3) Viewing the data contained in the columns with NA (un-comment to view).
# View(Data[,unique(`NA columns`)])
# NOTE: On observation it was found that the columns containing NA are non-numeric and contain valuable comments from participants. Hence, these columns are not removed.

#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 5) Checking whether there are multiple entries made by the same participant or not.
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 5.1) Checking whether the number of unique participants' names matches with the total number of rows in the data.
all.equal(nrow(Data),length(unique(Data$Name)))
# 5.2) Finding similarities between the names of participants to eliminate possible fraudulent entries.
# 5.2.1) Extracting all participants' names from "Data".
names <- Data %>% pull(Name)
# 5.2.2) Performing string matching operation among the extracted names.
matches <- lapply(names,agrep,names,value=TRUE)
# 5.2.3) Obtaining the number of matching names for each name.
unique(lengths(matches)-1)
# NOTE: Zero indicates that all the names are unique.

#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 6) Generating a final summary of the data frame using "skim" function of the "skimr" package.
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 6.1) Generating data summary of data frame..
View(skim(Data))

#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 7) Clearing the environment by removing all R objects except for the data frame "Data".
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 7.1) Removing all R objects except for the data frame "Data".
rm(list=setdiff(ls(),"Data"))


#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 8) Un-loading libraries.
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------#

detach("package:dplyr", unload=TRUE)
detach("package:readxl", unload=TRUE)
detach("package:skimr", unload=TRUE)


