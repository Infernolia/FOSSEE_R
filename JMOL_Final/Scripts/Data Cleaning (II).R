
# Purpose of script: To clean the overall dataset, remove meaningless rows, columns and final checking before pre-processing and analysis.

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 1) Part 1: Loading the necessary data files for the cleaning.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 1.1) Reading data from previously cleaned file and storing in R dataframe object df. 
# Note: Ensure that the working directory is first set to the directory that contains the data file before running the R script.
df <- read.csv("data_loaded.csv")
# 1.2) Removing the extra column that gets added while reading data.
df <- df[,-c(1)]
# 1.3) Setting the column names again as the names with spaces get converted to . while reading from csv in R.
colnames(df) <- c("Name","Institute","Target Audience","Background","Background (Other)","Pre-Workshop Training","Already Using Modelling Software in Org","Already Using Modelling Software in Org (Name of Software)","Used Jmol Before","Used Jmol Before (Purpose)","Difficulty in Teaching/Learning Without 3D Viewer","Jmol Usefulness in Teaching/Learning","Jmol Difficulty for Teaching","3D Visualization Will Create Interest","ICT Tools Participant Will Use for Learning","ICT Tools Participant Will Use for Learning (Other)","Conventional Methods of Visualization Used by Participant","Method Preferred After Learning Jmol","Jmol Usefulness in Assessing Students","ICT Tools Use Case in COVID Online Teaching","ICT Tools Use Case in COVID Online Teaching (Other)","(Spoken Tutorial 1) Intro To Jmol Application","(Spoken Tutorial 2) Create and Edit Molecular Models","(Spoken Tutorial 3) Modify Display and View","(Spoken Tutorial 4) Measurements and Labeling","(Spoken Tutorial 5) Script Console and Script Commands","(Spoken Tutorial 6) Surfaces and Orbitals","(Spoken Tutorial 7) Crystal Structure and Unit Cell","(Assmt 1) Intro To Jmol Application","(Assmt 2) Create and Edit Molecular Models","(Assmt 3) Modify Display and View","(Assmt 4) Measurements and Labelling","(Assmt 5) Script Console and Script Commands","(Assmt 6) Surfaces and Orbitals","(Assmt 7) Crystal Structure and Unitcell","(Concept 1) Jmol 3D Modelling Knowledge Before Workshop","(Concept 1) Jmol 3D Modelling Knowledge After Workshop","(Concept 2) Jmol 3D Model Create Edit Knowledge Before Workshop","(Concept 2) Jmol 3D Model Create Edit Knowledge After Workshop","(Concept 3) Jmol Bond Measure Knowledge Before Workshop","(Concept 3) Jmol Bond Measure Knowledge After Workshop","(Concept 4) Jmol Orbital Create Knowledge Before Workshop","(Concept 4) Jmol Orbital Create Knowledge After Workshop","(Concept 5) Jmol Center of Axis Knowledge Before Workshop","(Concept 5) Jmol Center of Axis Knowledge After Workshop","(Concept 6) Jmol Point Groups Knowledge Before Workshop","(Concept 6) Jmol Point Groups Knowledge After Workshop","(Concept 7) Jmol Script Cmd 3D Model Knowledge Before Workshop","(Concept 7) Jmol Script Cmd 3D Model Knowledge After Workshop","(Concept 8) Jmol Crystal Display Knowledge Before Workshop","(Concept 8) Jmol Crystal Display Knowledge After Workshop","Quality Instructional Material","Self Learning Experience","Spoken Tutorial Forum Experience","Online Discussion Session Feedback","Interaction With Teaching Assistant Feedback","Quality of Workshop","Exposure To New Knowledge","Unhappy With Workshop Format","Willingness To Participate in Activities","Did Not Learn Much","Will Recommend Workshop","Liked Aspects of Workshop","Suggestions","Forum Doubt Answering Feedback","Workshop Learnings Use Case","Other Feedback")


#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 2) Part 2: Removing inconsistent rows found in the the Data Cleaning (I) script.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 2.1) Executing Data Cleaning (I).R script to obtain the invalid row entries.
source("Data Cleaning (I).R")
# 2.2) Removing all row entries with inappropriate (misleading) values that were identified in the script.
df <- df[-rowentries,]

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 3) Part 3: Removing columns with subjective answers as processing text is not a part of current scope.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 3.1) Selecting the subset of data without subjective question columns.
df <- subset(df,select = -c(1,2,4,5,8,10,15,16,17,18,20,21,63,64,65,66,67))

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 4) Part 4: Saving the cleaned data.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 4.1) Viewing the cleaned dataframe before saving to file.
View(df)
# 4.2) Writing the cleaned data to csv file.
write.csv(df,"data_cleaned.csv")

