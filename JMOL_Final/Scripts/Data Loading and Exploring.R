
# Purpose of script: To load the dataset from file and explore the general features, missing entries and duplicate entries in survey data.

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 1) Part 1: Importing and installing the necessary libraries in R environment.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 1.1) The readxl library is required for the read_excel function to load data from excel file.
# install.packages("readxl")
library("readxl")
# 1.2) The dplyr library is required for rowwise computation of NA in dataframe.
# install.packages("dplyr")
library("dplyr")
# 1.3) The DataExplorer library is used for creative data visualization.
# install.packages("DataExplorer")
library(DataExplorer)

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 2) Part 2: Loading the necessary data files for the project.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 2.1) Reading data from xls file and storing in R dataframe object df. 
# Note: Ensure that the working directory is first set to the directory that contains the data file before running the R script.
df <- read_excel("original_jmol_data.xls")
# 2.2) Counting the number of rows in original dataframe.
nrow(df)
# 2.3) Counting the number of columns in original dataframe.
ncol(df)
# 2.4) Viewing the original dataframe.
View(df)
# 2.5) Exploring the features like missing data and complete entries original dataframe.
plot_intro(df)

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 3) Part 3: Identifying NA entries (NA indicates missing entries) in the dataframe.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 3.1) Finding the number of NA values in each column.
na_count <-sapply(df, function(y) sum(length(which(is.na(y)))))
na_count <- data.frame(na_count)
na_count
# 3.2) Finding the number of NA values in each row.
df %>% 
  select(1:67) %>% 
  is.na %>% 
  rowSums
# Observations: Nearly all the rows have missing entries for the columns that requested text-based(subjective) answers. But the first row contains many missing values. Upon viewing the dataframe, it is visible that the first row contains multiple missing values and also some string values, which are the latter halves of the column names which were split while reading the dataframe from xls file. The first row needs to be removed, and all the columns need to be renamed with shorter and understandable names. The text-based(subjective) question columns have multiple missing entries and need to be removed.

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 4) Part 4: Transforming the dataframe to a standard and readable format.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 4.1) Removing the first row due to 26 missing values and incomplete data as explained above.
df <- df[-c(1), ]
# 4.2) Setting appropriate column names for dataframe.
colnames(df) <- c("Name","Institute","Target Audience","Background","Background (Other)","Pre-Workshop Training","Already Using Modelling Software in Org","Already Using Modelling Software in Org (Name of Software)","Used Jmol Before","Used Jmol Before (Purpose)","Difficulty in Teaching/Learning Without 3D Viewer","Jmol Usefulness in Teaching/Learning","Jmol Difficulty for Teaching","3D Visualization Will Create Interest","ICT Tools Participant Will Use for Learning","ICT Tools Participant Will Use for Learning (Other)","Conventional Methods of Visualization Used by Participant","Method Preferred After Learning Jmol","Jmol Usefulness in Assessing Students","ICT Tools Use Case in COVID Online Teaching","ICT Tools Use Case in COVID Online Teaching (Other)","(Spoken Tutorial 1) Intro To Jmol Application","(Spoken Tutorial 2) Create and Edit Molecular Models","(Spoken Tutorial 3) Modify Display and View","(Spoken Tutorial 4) Measurements and Labeling","(Spoken Tutorial 5) Script Console and Script Commands","(Spoken Tutorial 6) Surfaces and Orbitals","(Spoken Tutorial 7) Crystal Structure and Unit Cell","(Assmt 1) Intro To Jmol Application","(Assmt 2) Create and Edit Molecular Models","(Assmt 3) Modify Display and View","(Assmt 4) Measurements and Labelling","(Assmt 5) Script Console and Script Commands","(Assmt 6) Surfaces and Orbitals","(Assmt 7) Crystal Structure and Unitcell","(Concept 1) Jmol 3D Modelling Knowledge Before Workshop","(Concept 1) Jmol 3D Modelling Knowledge After Workshop","(Concept 2) Jmol 3D Model Create Edit Knowledge Before Workshop","(Concept 2) Jmol 3D Model Create Edit Knowledge After Workshop","(Concept 3) Jmol Bond Measure Knowledge Before Workshop","(Concept 3) Jmol Bond Measure Knowledge After Workshop","(Concept 4) Jmol Orbital Create Knowledge Before Workshop","(Concept 4) Jmol Orbital Create Knowledge After Workshop","(Concept 5) Jmol Center of Axis Knowledge Before Workshop","(Concept 5) Jmol Center of Axis Knowledge After Workshop","(Concept 6) Jmol Point Groups Knowledge Before Workshop","(Concept 6) Jmol Point Groups Knowledge After Workshop","(Concept 7) Jmol Script Cmd 3D Model Knowledge Before Workshop","(Concept 7) Jmol Script Cmd 3D Model Knowledge After Workshop","(Concept 8) Jmol Crystal Display Knowledge Before Workshop","(Concept 8) Jmol Crystal Display Knowledge After Workshop","Quality Instructional Material","Self Learning Experience","Spoken Tutorial Forum Experience","Online Discussion Session Feedback","Interaction With Teaching Assistant Feedback","Quality of Workshop","Exposure To New Knowledge","Unhappy With Workshop Format","Willingness To Participate in Activities","Did Not Learn Much","Will Recommend Workshop","Liked Aspects of Workshop","Suggestions","Forum Doubt Answering Feedback","Workshop Learnings Use Case","Other Feedback")
# Note: The multi-word named columns can be accessed using `` punctuation marks in R.

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
#5) Part 5: Checking the duplicate survey participant entries.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 5.1) Finding the number of unique names in dataset.
length(unique(df$Name))
# 5.2) Sorting the names alphabetically to find similar names.
sort(df$Name)
# 5.3) Finding the number of unique institutes in dataset.
length(unique(df$Institute))
# 5.4) Sorting the institutes alphabetically to find institutes with the same name.
sort(df$Institute)
# 5.5) Finding similarity between names of participants to eliminate possible fraudulent entries.
# 5.5.1) Using dplyr pull function to extract the column as vector of strings datatype.
names<- df%>% pull(Name)
# 5.5.2) Utilizing agrep with lapply function performs string matching between elements of vector using the generalized Levenshtein edit distance (the minimal possibly weighted number of insertions, deletions and substitutions needed to transform one string into another).
lapply(names,agrep,names,value=TRUE)
# Observations: All names of participants are unique and dissimilar. Some participants belong to the same institute,but have unique names, thus are separate participants and thus no fradulent or duplicate entires were found.

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
#6) Part 6: Saving the dataframe for future cleaning and preprocessing scripts.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 6.1) Viewing the basic processed dataframe before saving to file.
View(df)
# 6.2) Saving the dataframe to csv for next script.
write.csv(df,"data_loaded.csv")


