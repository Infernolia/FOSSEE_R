#-------------------------------------------------------------------------------------------------------------#
#1) Part 1: Importing and installing necessary libraries
#-------------------------------------------------------------------------------------------------------------#

#install.packages("readxl")
library("readxl")

#-------------------------------------------------------------------------------------------------------------#
#2) Part 2: Loading data
#-------------------------------------------------------------------------------------------------------------#

# Reading Data from csv or xls file. 
setwd("C:/Users/Aboli/Desktop/tmp/FOSSEE/Code/jmol")
df <- read_excel("original_jmol_data.xls")

#-------------------------------------------------------------------------------------------------------------#
#3) Part 3: Bringing dataframe to standard and readable form
#-------------------------------------------------------------------------------------------------------------#

# Removing the blank row present at the top of the excel file.
df <- df[-c(1), ]

# Setting column names for dataframe
colnames(df) <- c("Name","Institute","Target_Audience","Background","Background_Other","Pre_Workshop_Training","Using_Software_Other_In_Org","Name_Software_Other","Used_Jmol_before","Jmol_Use_Before_Purpose","Concept_Difficulty_without_3DViewer","Jmol_Usefulness_For_Concepts","Jmol_Difficulty_For_Teaching","D_Visualization_Interesting","ICT_Tools_Will_Utilize","ICT_Tools_Will_Utilize_Others","Conventional_methods_visualization","After_Jmol_Which_Method_Prefer","Jmol_Useful_Assessing_Students","ICT_Tools_Use_COVID","ICT_Tools_Use_COVID_Other","ST_Introduction_to_Jmol_Application","ST_Create_and_Edit_Molecular_Models","ST_Modify_Display_and_View","ST_Measurements_and_Labeling","ST_Script_Console_and_Script_Commands","ST_Surfaces_and_Orbitals","ST_Crystal_Structure_and_Unit_Cell","A1_Introduction_to_Jmol_Application","A2_Create_and_Edit_Molecular_Models","A3_Modify_Display_and_View","A4_Measurements_and_Labelling","A5_Script_Console_and_Script_Commands","A6_Surfaces_and_Orbitals","A7_Crystal_Structure_and_Unitcell","Jmol_3D_Modelling_Knowledge_Before","Jmol_3D_Modelling_Knowledge_After","Jmol_3D_Model_Create_Edit_Knowledge_Before","Jmol_3D_Model_Create_Edit_Knowledge_After","Jmol_Bond_Measure_Knowledge_Before","Jmol_Bond_Measure_Knowledge_After","Jmol_Orbital_Create_Knowledge_Before","Jmol_Orbital_Create_Knowledge_After","Jmol_CenterAxis_Knowledge_Before","Jmol_CenterAxis_Knowledge_After","Jmol_PointGroups_Knowledge_Before","Jmol_PointGroups_Knowledge_After","Jmol_Script_Cmd_3D_Knowledge_Before","Jmol_Script_Cmd_3D_Knowledge_After","Jmol_Crystal_Knowledge_Before","Jmol_Crystal_Knowledge_After","Quality_instructional_material","Self_learning_experience","Spoken_Tutorial_Forum_experience","Online_discussion_session","Interaction_with_Teaching_Assistant","Quality_Workshop","New_Knowledge","Unhappy_Format","Willing_Participate_Activities","Not_Learn_Much","Will_Recommend","Aspects_Liked","Suggestions","Forum_Feedback","Use_Learnings_Purpose","Feedback")

#-------------------------------------------------------------------------------------------------------------#
#4) Part 4: Checking  Nan entries in dataset
#-------------------------------------------------------------------------------------------------------------#

# Finding the number of Nan values in each column.
na_count <-sapply(df, function(y) sum(length(which(is.na(y)))))
na_count <- data.frame(na_count)
na_count

#-------------------------------------------------------------------------------------------------------------#
#5) Part 5: Checking the duplicate survey participant entries
#-------------------------------------------------------------------------------------------------------------#

# Finding the number of unique names in dataset.
length(unique(df$Name))

# Sorting the names alphabetically to determine similar names.
sort(df$Name)

# Finding the number of unique institutes in dataset.
length(unique(df$Institute))

# Sorting the institutes alphabetically to determine similar institutes.
sort(df$Institute)

#-------------------------------------------------------------------------------------------------------------#
#6) Part 6: Checking the background details of participants
#-------------------------------------------------------------------------------------------------------------#

# Identifying rows which have provided a use case of Jmol inspite of not having used Jmol before.
temp1 <- which(df$Used_Jmol_before=="No")
temp2 <- which(!is.na(df$Jmol_Use_Before_Purpose))
temp3 <- intersect(temp1,temp2)

#-------------------------------------------------------------------------------------------------------------#
#7) Part 7: Removing columns with subjective answers as processing text is not a part of current scope
#-------------------------------------------------------------------------------------------------------------#

df <- subset(df,select = -c(1,2,4,5,8,10,15,16,17,18,20,21,63,64,65,66,67))

#-------------------------------------------------------------------------------------------------------------#
#8) Part 8: Finding Nan values for non-subjective answer columns
#-------------------------------------------------------------------------------------------------------------#

# Finding the number of Nan values in each column.
na_count <-sapply(df, function(y) sum(length(which(is.na(y)))))
na_count <- data.frame(na_count)
na_count
View(df)
#Comment: There are no Nan entries left at this point.

#-------------------------------------------------------------------------------------------------------------#
#9) Part 9:  Checking dataset for inconsistent entries.
#-------------------------------------------------------------------------------------------------------------#

temp4 <- c();temp5 <- c();temp6 <- c();temp7 <- c();temp8 <- c();temp9 <- c();temp10 <- c();temp11 <- c(); temp13 = c(); temp14 = c();

#Defining a function that converts level of knowledge to number
fun <- function(x) {
  result <- 0
  if (x == "Unaware") { result <- 1 } else if (x == "Novice"){  result <- 2 } else if (x == "Amateur"){ result <- 3  }else if (x == "Competent"){   result <- 4 }else if (x == "Proficient"){   result <- 5  }else if (x == "Expert"){    result <- 6  }
  return(result)
}

# Identifying the rows which showed reduced Jmol knowledge for different concepts after workshop than before.
for (i in 1:nrow(df))
{
  if(fun(df[i,"Jmol_3D_Modelling_Knowledge_Before"]) - fun(df[i,"Jmol_3D_Modelling_Knowledge_After"])>0){temp4<- c(temp4, i)};  if(fun(df[i,"Jmol_3D_Model_Create_Edit_Knowledge_Before"]) - fun(df[i,"Jmol_3D_Model_Create_Edit_Knowledge_After"])>0){temp5<- c(temp5, i)};  if(fun(df[i,"Jmol_Bond_Measure_Knowledge_Before"]) - fun(df[i,"Jmol_Bond_Measure_Knowledge_After"])>0){temp6<- c(temp6, i)};  if(fun(df[i,"Jmol_Orbital_Create_Knowledge_Before"]) - fun(df[i,"Jmol_Orbital_Create_Knowledge_After"])>0){temp7<- c(temp7, i)};  if(fun(df[i,"Jmol_CenterAxis_Knowledge_Before"]) - fun(df[i,"Jmol_CenterAxis_Knowledge_After"])>0){temp8<- c(temp8, i)};  if(fun(df[i,"Jmol_PointGroups_Knowledge_Before"]) - fun(df[i,"Jmol_PointGroups_Knowledge_After"])>0){temp9<- c(temp9, i)};  if(fun(df[i,"Jmol_Script_Cmd_3D_Knowledge_Before"]) - fun(df[i,"Jmol_Script_Cmd_3D_Knowledge_After"])>0){temp10<- c(temp10, i)};  if(fun(df[i,"Jmol_Crystal_Knowledge_Before"]) - fun(df[i,"Jmol_Crystal_Knowledge_After"])>0){temp11<- c(temp11, i)}
}

temp12 <- union(union(union(union(union(union(union(temp4,temp5),temp6),temp7),temp8),temp9),temp10),temp11)

#Defining a function that converts satifaction level to number
fun1 <- function(x) { 
  result <- 0
  if (x == "Strongly Disagree" || x == "Extremely bad" ) { result <- 1 } else if (x == "Disagree" ||  x == "Bad"){  result <- 2 } else if (x == "Neither Disagree Nor Agree" ||  x == "Not sure"){ result <- 3  }else if (x == "Agree" ||  x == "Acceptable"){   result <- 4 }else if (x == "Strongly Agree" ||  x == "Good"){   result <- 5  }else if (x == "Not Applicable"){    result <- 1  } else if (  x == "Excellent") {result <- 6}
  return(result)
}

#Identifying the rows which show positive and negative workshop feedback simultaneously
for (i in 1:nrow(df))
{
  if(fun1(df[i,"New_Knowledge"])>3 && fun1(df[i,"Not_Learn_Much"])>3)  {temp13<- c(temp13, i)}; if(fun1(df[i,"New_Knowledge"])<3 && fun1(df[i,"Not_Learn_Much"])<3)  {temp13<- c(temp13, i)}
  if(fun1(df[i,"Quality_Workshop"])>=3 && fun1(df[i,"Will_Recommend"])>=3 && fun1(df[i,"Unhappy_Format"])>=3 && fun1(df[i,"Not_Learn_Much"])>=3)  {temp14<- c(temp14, i)};  if(fun1(df[i,"Quality_Workshop"])<3 && fun1(df[i,"Will_Recommend"])<3 && fun1(df[i,"Unhappy_Format"])<3 && fun1(df[i,"Not_Learn_Much"])<3)  {temp14<- c(temp14, i)}
}
temp15 <- union(temp13,temp14)

#-------------------------------------------------------------------------------------------------------------#
#10) Part 10:  Removing unnecessary rows and saving cleaned dataset.
#-------------------------------------------------------------------------------------------------------------#
temp_final <- union(union(temp12,temp15),temp3)
df <- df[-c(temp_final),]
nrow(df)

write.csv(df,"cleaned_14th_may.csv")

