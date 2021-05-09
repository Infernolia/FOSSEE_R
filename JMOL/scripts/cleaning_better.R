df <- read.csv("C:/Users/Aboli/Desktop/tmp/FOSSEE/Code/jmol/data.csv")

colnames(df) <- c("Name","Institute","Target_Audience","Background","Background_Other","Pre_Workshop_Training","Using_Software_Other_In_Org","Name_Software_Other","Used_Jmol_before","Jmol_Use_Before_Purpose","Concept_Difficulty_without_3DViewer","Jmol_Usefulness_For_Concepts","Jmol_Difficulty_For_Teaching","D_Visualization_Interesting","ICT_Tools_Will_Utilize","ICT_Tools_Will_Utilize_Others","Conventional_methods_visualization","After_Jmol_Which_Method_Prefer","Jmol_Useful_Assessing_Students","ICT_Tools_Use_COVID","ICT_Tools_Use_COVID_Other","ST_Introduction_to_Jmol_Application","ST_Create_and_Edit_Molecular_Models","ST_Modify_Display_and_View","ST_Measurements_and_Labeling","ST_Script_Console_and_Script_Commands","ST_Surfaces_and_Orbitals","ST_Crystal_Structure_and_Unit_Cell","A1_Introduction_to_Jmol_Application","A2_Create_and_Edit_Molecular_Models","A3_Modify_Display_and_View","A4_Measurements_and_Labelling","A5_Script_Console_and_Script_Commands","A6_Surfaces_and_Orbitals","A7_Crystal_Structure_and_Unitcell","Jmol_3D_Modelling_Knowledge_Before","Jmol_3D_Modelling_Knowledge_After","Jmol_3D_Model_Create_Edit_Knowledge_Before","Jmol_3D_Model_Create_Edit_Knowledge_After","Jmol_Bond_Measure_Knowledge_Before","Jmol_Bond_Measure_Knowledge_After","Jmol_Orbital_Create_Knowledge_Before","Jmol_Orbital_Create_Knowledge_After","Jmol_CenterAxis_Knowledge_Before","Jmol_CenterAxis_Knowledge_After","Jmol_PointGroups_Knowledge_Before","Jmol_PointGroups_Knowledge_After","Jmol_Script_Cmd_3D_Knowledge_Before","Jmol_Script_Cmd_3D_Knowledge_After","Jmol_Crystal_Knowledge_Before","Jmol_Crystal_Knowledge_After","Quality_instructional_material","Self_learning_experience","Spoken_Tutorial_Forum_experience","Online_discussion_session","Interaction_with_Teaching_Assistant","Quality_Workshop","New_Knowledge","Unhappy_Format","Willing_Participate_Activities","Not_Learn_Much","Will_Recommend","Aspects_Liked","Suggestions","Forum_Feedback","Use_Learnings_Purpose","Feedback")

length(colnames(df))



#They said  other profession but they didnt tell us the name and gave us the prof unnecessarily
df <- df[df$Background_Other!="Assist teacher in junior college",]

df <- df[!is.na(df$Background_Other),]
nrow(df)

#They said yes to other software but they didnt tell us the names
df <- na.omit(df, c("Name_Software_Other"))




#They said they havent used Jmol but they still gave a use case
for(i in 1:nrow(df))
{
  if(df[i,"Used_Jmol_before"] == "No" &&  !is.na(df[i,"Jmol_Use_Before_Purpose"]) && df[i,"Jmol_Use_Before_Purpose"]=="Teaching tool for classroom teaching.")
  {
    df <- df[-c(i), ]
  }
}




#Gave a reason for others without selecting the others option

df <- df[df$ICT_Tools_Will_Utilize_Others!="3 D viewers",]



sort(df$Name)
length(unique(df$Name))


#Now removing the subject answer questions as they have been cleaned

df <- subset(df,select = -c(1,2,4,5,8,10,15,16,17,18,20,21,63,64,65,66,67))




length(colnames(df))


#Finding number of Nans
sum(is.na(df))


df1 <- df


#Section 1: Label Encoding
# Recode Profession label to numeric, student to 1 and faculty and others to 5
df$Target_Audience <- ifelse(df$Target_Audience=="Student", 1, 5)


#Cleaning the Pre_Workshop_Training column
df[df$Pre_Workshop_Training=="Above 7 days", "Pre_Workshop_Training"] <- 5
df$Pre_Workshop_Training <- gsub("[^0-9.-]", "", df$Pre_Workshop_Training)
df[df$Pre_Workshop_Training=="0", "Pre_Workshop_Training"] <- 1
df[df$Pre_Workshop_Training=="1", "Pre_Workshop_Training"] <- 2
df[df$Pre_Workshop_Training=="2-4", "Pre_Workshop_Training"] <- 3
df[df$Pre_Workshop_Training=="5-7", "Pre_Workshop_Training"] <- 4



#Cleaning the Using_Software_Other_In_Org column

df[df$Using_Software_Other_In_Org=="Yes", "Using_Software_Other_In_Org"] <- 5
df[df$Using_Software_Other_In_Org=="No", "Using_Software_Other_In_Org"] <- 3
df[df$Using_Software_Other_In_Org=="Not Sure", "Using_Software_Other_In_Org"] <- 1


#Cleaning the Used_Jmol_before column

df[df$Used_Jmol_before=="Yes", "Used_Jmol_before"] <- 5
df[df$Used_Jmol_before=="No", "Used_Jmol_before"] <- 1


#Cleaning the Concept_Difficulty_without_3DViewer column

df[df$Concept_Difficulty_without_3DViewer=="Very difficult", "Concept_Difficulty_without_3DViewer"] <- 5
df[df$Concept_Difficulty_without_3DViewer=="Difficult", "Concept_Difficulty_without_3DViewer"] <- 4
df[df$Concept_Difficulty_without_3DViewer=="Easy", "Concept_Difficulty_without_3DViewer"] <- 2
df[df$Concept_Difficulty_without_3DViewer=="Very Easy", "Concept_Difficulty_without_3DViewer"] <- 1
df[df$Concept_Difficulty_without_3DViewer=="Not sure", "Concept_Difficulty_without_3DViewer"] <- 3

#Cleaning the Jmol_Usefulness_For_Concepts column

df[df$Jmol_Usefulness_For_Concepts=="Yes", "Jmol_Usefulness_For_Concepts"] <- 5
df[df$Jmol_Usefulness_For_Concepts=="No", "Jmol_Usefulness_For_Concepts"] <- 1
df[df$Jmol_Usefulness_For_Concepts=="May be", "Jmol_Usefulness_For_Concepts"] <- 3


#Cleaning the Jmol_Difficulty_For_Teaching column

df[df$Jmol_Difficulty_For_Teaching=="Very difficult", "Jmol_Difficulty_For_Teaching"] <- 1
df[df$Jmol_Difficulty_For_Teaching=="Difficult", "Jmol_Difficulty_For_Teaching"] <- 2
df[df$Jmol_Difficulty_For_Teaching=="Easy", "Jmol_Difficulty_For_Teaching"] <- 4
df[df$Jmol_Difficulty_For_Teaching=="Very Easy", "Jmol_Difficulty_For_Teaching"] <- 5
df[df$Jmol_Difficulty_For_Teaching=="Not sure", "Jmol_Difficulty_For_Teaching"] <- 3


#Cleaning the D_Visualization_Interesting  column


df[df$D_Visualization_Interesting=="Yes", "D_Visualization_Interesting"] <- 5
df[df$D_Visualization_Interesting=="No", "D_Visualization_Interesting"] <- 1
df[df$D_Visualization_Interesting=="May be", "D_Visualization_Interesting"] <- 3

#Cleaning the  Jmol_Useful_Assessing_Students

df[df$Jmol_Useful_Assessing_Students=="Yes", "Jmol_Useful_Assessing_Students"] <- 5
df[df$Jmol_Useful_Assessing_Students=="No", "Jmol_Useful_Assessing_Students"] <- 1
df[df$Jmol_Useful_Assessing_Students=="May be", "Jmol_Useful_Assessing_Students"] <- 3


#Reversing the scales of spoken tutorial qs and also removing unapplicable
df[df$ST_Introduction_to_Jmol_Application=="5", "ST_Introduction_to_Jmol_Application"] <- "1"
df[df$ST_Introduction_to_Jmol_Application=="4", "ST_Introduction_to_Jmol_Application"] <- "2"
df[df$ST_Introduction_to_Jmol_Application=="3", "ST_Introduction_to_Jmol_Application"] <- "3"
df[df$ST_Introduction_to_Jmol_Application=="2", "ST_Introduction_to_Jmol_Application"] <- "4"
df[df$ST_Introduction_to_Jmol_Application=="1", "ST_Introduction_to_Jmol_Application"] <- "5"
df[df$ST_Introduction_to_Jmol_Application=="Not Attempted", "ST_Introduction_to_Jmol_Application"] <- "1"
df[df$ST_Introduction_to_Jmol_Application=="Not Applicable", "ST_Introduction_to_Jmol_Application"] <- "1"

df[df$ST_Create_and_Edit_Molecular_Models=="5", "ST_Create_and_Edit_Molecular_Models"] <- "1"
df[df$ST_Create_and_Edit_Molecular_Models=="4", "ST_Create_and_Edit_Molecular_Models"] <- "2"
df[df$ST_Create_and_Edit_Molecular_Models=="3", "ST_Create_and_Edit_Molecular_Models"] <- "3"
df[df$ST_Create_and_Edit_Molecular_Models=="2", "ST_Create_and_Edit_Molecular_Models"] <- "4"
df[df$ST_Create_and_Edit_Molecular_Models=="1", "ST_Create_and_Edit_Molecular_Models"] <- "5"
df[df$ST_Create_and_Edit_Molecular_Models=="Not Attempted", "ST_Create_and_Edit_Molecular_Models"] <- "1"
df[df$ST_Create_and_Edit_Molecular_Models=="Not Applicable", "ST_Create_and_Edit_Molecular_Models"] <- "1"


df[df$ST_Modify_Display_and_View=="5", "ST_Modify_Display_and_View"] <- "1"
df[df$ST_Modify_Display_and_View=="4", "ST_Modify_Display_and_View"] <- "2"
df[df$ST_Modify_Display_and_View=="3", "ST_Modify_Display_and_View"] <- "3"
df[df$ST_Modify_Display_and_View=="2", "ST_Modify_Display_and_View"] <- "4"
df[df$ST_Modify_Display_and_View=="1", "ST_Modify_Display_and_View"] <- "5"
df[df$ST_Modify_Display_and_View=="Not Attempted", "ST_Modify_Display_and_View"] <- "1"
df[df$ST_Modify_Display_and_View=="Not Applicable", "ST_Modify_Display_and_View"] <- "1"


df[df$ST_Measurements_and_Labeling=="5", "ST_Measurements_and_Labeling"] <- "1"
df[df$ST_Measurements_and_Labeling=="4", "ST_Measurements_and_Labeling"] <- "2"
df[df$ST_Measurements_and_Labeling=="3", "ST_Measurements_and_Labeling"] <- "3"
df[df$ST_Measurements_and_Labeling=="2", "ST_Measurements_and_Labeling"] <- "4"
df[df$ST_Measurements_and_Labeling=="1", "ST_Measurements_and_Labeling"] <- "5"
df[df$ST_Measurements_and_Labeling=="Not Attempted", "ST_Measurements_and_Labeling"] <- "1"
df[df$ST_Measurements_and_Labeling=="Not Applicable", "ST_Measurements_and_Labeling"] <- "1"


df[df$ST_Script_Console_and_Script_Commands=="5", "ST_Script_Console_and_Script_Commands"] <- "1"
df[df$ST_Script_Console_and_Script_Commands=="4", "ST_Script_Console_and_Script_Commands"] <- "2"
df[df$ST_Script_Console_and_Script_Commands=="3", "ST_Script_Console_and_Script_Commands"] <- "3"
df[df$ST_Script_Console_and_Script_Commands=="2", "ST_Script_Console_and_Script_Commands"] <- "4"
df[df$ST_Script_Console_and_Script_Commands=="1", "ST_Script_Console_and_Script_Commands"] <- "5"
df[df$ST_Script_Console_and_Script_Commands=="Not Attempted", "ST_Script_Console_and_Script_Commands"] <- "1"
df[df$ST_Script_Console_and_Script_Commands=="Not Applicable", "ST_Script_Console_and_Script_Commands"] <- "1"


df[df$ST_Surfaces_and_Orbitals=="5", "ST_Surfaces_and_Orbitals"] <- "1"
df[df$ST_Surfaces_and_Orbitals=="4", "ST_Surfaces_and_Orbitals"] <- "2"
df[df$ST_Surfaces_and_Orbitals=="3", "ST_Surfaces_and_Orbitals"] <- "3"
df[df$ST_Surfaces_and_Orbitals=="2", "ST_Surfaces_and_Orbitals"] <- "4"
df[df$ST_Surfaces_and_Orbitals=="1", "ST_Surfaces_and_Orbitals"] <- "5"
df[df$ST_Surfaces_and_Orbitals=="Not Attempted", "ST_Surfaces_and_Orbitals"] <- "1"
df[df$ST_Surfaces_and_Orbitals=="Not Applicable", "ST_Surfaces_and_Orbitals"] <- "1"



df[df$ST_Crystal_Structure_and_Unit_Cell=="5", "ST_Crystal_Structure_and_Unit_Cell"] <- "1"
df[df$ST_Crystal_Structure_and_Unit_Cell=="4", "ST_Crystal_Structure_and_Unit_Cell"] <- "2"
df[df$ST_Crystal_Structure_and_Unit_Cell=="3", "ST_Crystal_Structure_and_Unit_Cell"] <- "3"
df[df$ST_Crystal_Structure_and_Unit_Cell=="2", "ST_Crystal_Structure_and_Unit_Cell"] <- "4"
df[df$ST_Crystal_Structure_and_Unit_Cell=="1", "ST_Crystal_Structure_and_Unit_Cell"] <- "5"
df[df$ST_Crystal_Structure_and_Unit_Cell=="Not Attempted", "ST_Crystal_Structure_and_Unit_Cell"] <- "1"
df[df$ST_Crystal_Structure_and_Unit_Cell=="Not Applicable", "ST_Crystal_Structure_and_Unit_Cell"] <- "1"


df[df$A1_Introduction_to_Jmol_Application=="Not Attempted", "A1_Introduction_to_Jmol_Application"] <- "1"
df[df$A2_Create_and_Edit_Molecular_Models=="Not Attempted", "A2_Create_and_Edit_Molecular_Models"] <- "1"
df[df$A3_Modify_Display_and_View=="Not Attempted", "A3_Modify_Display_and_View"] <- "1"
df[df$A4_Measurements_and_Labelling=="Not Attempted", "A4_Measurements_and_Labelling"] <- "1"
df[df$A5_Script_Console_and_Script_Commands=="Not Attempted", "A5_Script_Console_and_Script_Commands"] <- "1"
df[df$A6_Surfaces_and_Orbitals=="Not Attempted", "A6_Surfaces_and_Orbitals"] <- "1"
df[df$A7_Crystal_Structure_and_Unitcell=="Not Attempted", "A7_Crystal_Structure_and_Unitcell"] <- "1"



#Encoding all the before and after columns

df[df$Jmol_3D_Modelling_Knowledge_Before=="Unaware", "Jmol_3D_Modelling_Knowledge_Before"] <- "1"
df[df$Jmol_3D_Modelling_Knowledge_Before=="Novice", "Jmol_3D_Modelling_Knowledge_Before"] <- "2"
df[df$Jmol_3D_Modelling_Knowledge_Before=="Amateur", "Jmol_3D_Modelling_Knowledge_Before"] <- "3"
df[df$Jmol_3D_Modelling_Knowledge_Before=="Competent", "Jmol_3D_Modelling_Knowledge_Before"] <- "4"
df[df$Jmol_3D_Modelling_Knowledge_Before=="Proficient", "Jmol_3D_Modelling_Knowledge_Before"] <- "5"
df[df$Jmol_3D_Modelling_Knowledge_Before=="Expert", "Jmol_3D_Modelling_Knowledge_Before"] <- "6"


df[df$Jmol_3D_Modelling_Knowledge_After=="Unaware", "Jmol_3D_Modelling_Knowledge_After"] <- "1"
df[df$Jmol_3D_Modelling_Knowledge_After=="Novice", "Jmol_3D_Modelling_Knowledge_After"] <- "2"
df[df$Jmol_3D_Modelling_Knowledge_After=="Amateur", "Jmol_3D_Modelling_Knowledge_After"] <- "3"
df[df$Jmol_3D_Modelling_Knowledge_After=="Competent", "Jmol_3D_Modelling_Knowledge_After"] <- "4"
df[df$Jmol_3D_Modelling_Knowledge_After=="Proficient", "Jmol_3D_Modelling_Knowledge_After"] <- "5"
df[df$Jmol_3D_Modelling_Knowledge_After=="Expert", "Jmol_3D_Modelling_Knowledge_After"] <- "6"



df[df$Jmol_3D_Model_Create_Edit_Knowledge_Before=="Unaware", "Jmol_3D_Model_Create_Edit_Knowledge_Before"] <- "1"
df[df$Jmol_3D_Model_Create_Edit_Knowledge_Before=="Novice", "Jmol_3D_Model_Create_Edit_Knowledge_Before"] <- "2"
df[df$Jmol_3D_Model_Create_Edit_Knowledge_Before=="Amateur", "Jmol_3D_Model_Create_Edit_Knowledge_Before"] <- "3"
df[df$Jmol_3D_Model_Create_Edit_Knowledge_Before=="Competent", "Jmol_3D_Model_Create_Edit_Knowledge_Before"] <- "4"
df[df$Jmol_3D_Model_Create_Edit_Knowledge_Before=="Proficient", "Jmol_3D_Model_Create_Edit_Knowledge_Before"] <- "5"
df[df$Jmol_3D_Model_Create_Edit_Knowledge_Before=="Expert", "Jmol_3D_Model_Create_Edit_Knowledge_Before"] <- "6"

df[df$Jmol_3D_Model_Create_Edit_Knowledge_After=="Unaware", "Jmol_3D_Model_Create_Edit_Knowledge_After"] <- "1"
df[df$Jmol_3D_Model_Create_Edit_Knowledge_After=="Novice", "Jmol_3D_Model_Create_Edit_Knowledge_After"] <- "2"
df[df$Jmol_3D_Model_Create_Edit_Knowledge_After=="Amateur", "Jmol_3D_Model_Create_Edit_Knowledge_After"] <- "3"
df[df$Jmol_3D_Model_Create_Edit_Knowledge_After=="Competent", "Jmol_3D_Model_Create_Edit_Knowledge_After"] <- "4"
df[df$Jmol_3D_Model_Create_Edit_Knowledge_After=="Proficient", "Jmol_3D_Model_Create_Edit_Knowledge_After"] <- "5"
df[df$Jmol_3D_Model_Create_Edit_Knowledge_After=="Expert", "Jmol_3D_Model_Create_Edit_Knowledge_After"] <- "6"

df[df$Jmol_Bond_Measure_Knowledge_Before=="Unaware", "Jmol_Bond_Measure_Knowledge_Before"] <- "1"
df[df$Jmol_Bond_Measure_Knowledge_Before=="Novice", "Jmol_Bond_Measure_Knowledge_Before"] <- "2"
df[df$Jmol_Bond_Measure_Knowledge_Before=="Amateur", "Jmol_Bond_Measure_Knowledge_Before"] <- "3"
df[df$Jmol_Bond_Measure_Knowledge_Before=="Competent", "Jmol_Bond_Measure_Knowledge_Before"] <- "4"
df[df$Jmol_Bond_Measure_Knowledge_Before=="Proficient", "Jmol_Bond_Measure_Knowledge_Before"] <- "5"
df[df$Jmol_Bond_Measure_Knowledge_Before=="Expert", "Jmol_Bond_Measure_Knowledge_Before"] <- "6"

df[df$Jmol_Bond_Measure_Knowledge_After=="Unaware", "Jmol_Bond_Measure_Knowledge_After"] <- "1"
df[df$Jmol_Bond_Measure_Knowledge_After=="Novice", "Jmol_Bond_Measure_Knowledge_After"] <- "2"
df[df$Jmol_Bond_Measure_Knowledge_After=="Amateur", "Jmol_Bond_Measure_Knowledge_After"] <- "3"
df[df$Jmol_Bond_Measure_Knowledge_After=="Competent", "Jmol_Bond_Measure_Knowledge_After"] <- "4"
df[df$Jmol_Bond_Measure_Knowledge_After=="Proficient", "Jmol_Bond_Measure_Knowledge_After"] <- "5"
df[df$Jmol_Bond_Measure_Knowledge_After=="Expert", "Jmol_Bond_Measure_Knowledge_After"] <- "6"



df[df$Jmol_Orbital_Create_Knowledge_Before=="Unaware", "Jmol_Orbital_Create_Knowledge_Before"] <- "1"
df[df$Jmol_Orbital_Create_Knowledge_Before=="Novice", "Jmol_Orbital_Create_Knowledge_Before"] <- "2"
df[df$Jmol_Orbital_Create_Knowledge_Before=="Amateur", "Jmol_Orbital_Create_Knowledge_Before"] <- "3"
df[df$Jmol_Orbital_Create_Knowledge_Before=="Competent", "Jmol_Orbital_Create_Knowledge_Before"] <- "4"
df[df$Jmol_Orbital_Create_Knowledge_Before=="Proficient", "Jmol_Orbital_Create_Knowledge_Before"] <- "5"
df[df$Jmol_Orbital_Create_Knowledge_Before=="Expert", "Jmol_Orbital_Create_Knowledge_Before"] <- "6"


df[df$Jmol_Orbital_Create_Knowledge_After=="Unaware", "Jmol_Orbital_Create_Knowledge_After"] <- "1"
df[df$Jmol_Orbital_Create_Knowledge_After=="Novice", "Jmol_Orbital_Create_Knowledge_After"] <- "2"
df[df$Jmol_Orbital_Create_Knowledge_After=="Amateur", "Jmol_Orbital_Create_Knowledge_After"] <- "3"
df[df$Jmol_Orbital_Create_Knowledge_After=="Competent", "Jmol_Orbital_Create_Knowledge_After"] <- "4"
df[df$Jmol_Orbital_Create_Knowledge_After=="Proficient", "Jmol_Orbital_Create_Knowledge_After"] <- "5"
df[df$Jmol_Orbital_Create_Knowledge_After=="Expert", "Jmol_Orbital_Create_Knowledge_After"] <- "6"


df[df$Jmol_CenterAxis_Knowledge_Before=="Unaware", "Jmol_CenterAxis_Knowledge_Before"] <- "1"
df[df$Jmol_CenterAxis_Knowledge_Before=="Novice", "Jmol_CenterAxis_Knowledge_Before"] <- "2"
df[df$Jmol_CenterAxis_Knowledge_Before=="Amateur", "Jmol_CenterAxis_Knowledge_Before"] <- "3"
df[df$Jmol_CenterAxis_Knowledge_Before=="Competent", "Jmol_CenterAxis_Knowledge_Before"] <- "4"
df[df$Jmol_CenterAxis_Knowledge_Before=="Proficient", "Jmol_CenterAxis_Knowledge_Before"] <- "5"
df[df$Jmol_CenterAxis_Knowledge_Before=="Expert", "Jmol_CenterAxis_Knowledge_Before"] <- "6"


df[df$Jmol_CenterAxis_Knowledge_After=="Unaware", "Jmol_CenterAxis_Knowledge_After"] <- "1"
df[df$Jmol_CenterAxis_Knowledge_After=="Novice", "Jmol_CenterAxis_Knowledge_After"] <- "2"
df[df$Jmol_CenterAxis_Knowledge_After=="Amateur", "Jmol_CenterAxis_Knowledge_After"] <- "3"
df[df$Jmol_CenterAxis_Knowledge_After=="Competent", "Jmol_CenterAxis_Knowledge_After"] <- "4"
df[df$Jmol_CenterAxis_Knowledge_After=="Proficient", "Jmol_CenterAxis_Knowledge_After"] <- "5"
df[df$Jmol_CenterAxis_Knowledge_After=="Expert", "Jmol_CenterAxis_Knowledge_After"] <- "6"

df[df$Jmol_PointGroups_Knowledge_Before=="Unaware", "Jmol_PointGroups_Knowledge_Before"] <- "1"
df[df$Jmol_PointGroups_Knowledge_Before=="Novice", "Jmol_PointGroups_Knowledge_Before"] <- "2"
df[df$Jmol_PointGroups_Knowledge_Before=="Amateur", "Jmol_PointGroups_Knowledge_Before"] <- "3"
df[df$Jmol_PointGroups_Knowledge_Before=="Competent", "Jmol_PointGroups_Knowledge_Before"] <- "4"
df[df$Jmol_PointGroups_Knowledge_Before=="Proficient", "Jmol_PointGroups_Knowledge_Before"] <- "5"
df[df$Jmol_PointGroups_Knowledge_Before=="Expert", "Jmol_PointGroups_Knowledge_Before"] <- "6"


df[df$Jmol_PointGroups_Knowledge_After=="Unaware", "Jmol_PointGroups_Knowledge_After"] <- "1"
df[df$Jmol_PointGroups_Knowledge_After=="Novice", "Jmol_PointGroups_Knowledge_After"] <- "2"
df[df$Jmol_PointGroups_Knowledge_After=="Amateur", "Jmol_PointGroups_Knowledge_After"] <- "3"
df[df$Jmol_PointGroups_Knowledge_After=="Competent", "Jmol_PointGroups_Knowledge_After"] <- "4"
df[df$Jmol_PointGroups_Knowledge_After=="Proficient", "Jmol_PointGroups_Knowledge_After"] <- "5"
df[df$Jmol_PointGroups_Knowledge_After=="Expert", "Jmol_PointGroups_Knowledge_After"] <- "6"



df[df$Jmol_Script_Cmd_3D_Knowledge_Before=="Unaware", "Jmol_Script_Cmd_3D_Knowledge_Before"] <- "1"
df[df$Jmol_Script_Cmd_3D_Knowledge_Before=="Novice", "Jmol_Script_Cmd_3D_Knowledge_Before"] <- "2"
df[df$Jmol_Script_Cmd_3D_Knowledge_Before=="Amateur", "Jmol_Script_Cmd_3D_Knowledge_Before"] <- "3"
df[df$Jmol_Script_Cmd_3D_Knowledge_Before=="Competent", "Jmol_Script_Cmd_3D_Knowledge_Before"] <- "4"
df[df$Jmol_Script_Cmd_3D_Knowledge_Before=="Proficient", "Jmol_Script_Cmd_3D_Knowledge_Before"] <- "5"
df[df$Jmol_Script_Cmd_3D_Knowledge_Before=="Expert", "Jmol_Script_Cmd_3D_Knowledge_Before"] <- "6"


df[df$Jmol_Script_Cmd_3D_Knowledge_After=="Unaware", "Jmol_Script_Cmd_3D_Knowledge_After"] <- "1"
df[df$Jmol_Script_Cmd_3D_Knowledge_After=="Novice", "Jmol_Script_Cmd_3D_Knowledge_After"] <- "2"
df[df$Jmol_Script_Cmd_3D_Knowledge_After=="Amateur", "Jmol_Script_Cmd_3D_Knowledge_After"] <- "3"
df[df$Jmol_Script_Cmd_3D_Knowledge_After=="Competent", "Jmol_Script_Cmd_3D_Knowledge_After"] <- "4"
df[df$Jmol_Script_Cmd_3D_Knowledge_After=="Proficient", "Jmol_Script_Cmd_3D_Knowledge_After"] <- "5"
df[df$Jmol_Script_Cmd_3D_Knowledge_After=="Expert", "Jmol_Script_Cmd_3D_Knowledge_After"] <- "6"


df[df$Jmol_Crystal_Knowledge_Before=="Not Applicable", "Jmol_Crystal_Knowledge_Before"] <- "1"
df[df$Jmol_Crystal_Knowledge_Before=="Not at all Confident", "Jmol_Crystal_Knowledge_Before"] <- "2"
df[df$Jmol_Crystal_Knowledge_Before=="Slightly Confident", "Jmol_Crystal_Knowledge_Before"] <- "3"
df[df$Jmol_Crystal_Knowledge_Before=="Somewhat confident", "Jmol_Crystal_Knowledge_Before"] <- "4"
df[df$Jmol_Crystal_Knowledge_Before=="Confident", "Jmol_Crystal_Knowledge_Before"] <- "5"
df[df$Jmol_Crystal_Knowledge_Before=="Strongly Confident", "Jmol_Crystal_Knowledge_Before"] <- "6"


df[df$Jmol_Crystal_Knowledge_After=="Not Applicable", "Jmol_Crystal_Knowledge_After"] <- "1"
df[df$Jmol_Crystal_Knowledge_After=="Not at all Confident", "Jmol_Crystal_Knowledge_After"] <- "2"
df[df$Jmol_Crystal_Knowledge_After=="Slightly Confident", "Jmol_Crystal_Knowledge_After"] <- "3"
df[df$Jmol_Crystal_Knowledge_After=="Somewhat confident", "Jmol_Crystal_Knowledge_After"] <- "4"
df[df$Jmol_Crystal_Knowledge_After=="Confident", "Jmol_Crystal_Knowledge_After"] <- "5"
df[df$Jmol_Crystal_Knowledge_After=="Strongly Confident", "Jmol_Crystal_Knowledge_After"] <- "6"


df[df$Quality_instructional_material=="Extremely bad", "Quality_instructional_material"] <- "1"
df[df$Quality_instructional_material=="Bad", "Quality_instructional_material"] <- "2"
df[df$Quality_instructional_material=="Not sure", "Quality_instructional_material"] <- "3"
df[df$Quality_instructional_material=="Acceptable", "Quality_instructional_material"] <- "4"
df[df$Quality_instructional_material=="Good", "Quality_instructional_material"] <- "5"
df[df$Quality_instructional_material=="Excellent", "Quality_instructional_material"] <- "6"

df[df$Self_learning_experience=="Extremely bad", "Self_learning_experience"] <- "1"
df[df$Self_learning_experience=="Bad", "Self_learning_experience"] <- "2"
df[df$Self_learning_experience=="Not sure", "Self_learning_experience"] <- "3"
df[df$Self_learning_experience=="Acceptable", "Self_learning_experience"] <- "4"
df[df$Self_learning_experience=="Good", "Self_learning_experience"] <- "5"
df[df$Self_learning_experience=="Excellent", "Self_learning_experience"] <- "6"


df[df$Spoken_Tutorial_Forum_experience=="Extremely bad", "Spoken_Tutorial_Forum_experience"] <- "1"
df[df$Spoken_Tutorial_Forum_experience=="Bad", "Spoken_Tutorial_Forum_experience"] <- "2"
df[df$Spoken_Tutorial_Forum_experience=="Not sure", "Spoken_Tutorial_Forum_experience"] <- "3"
df[df$Spoken_Tutorial_Forum_experience=="Acceptable", "Spoken_Tutorial_Forum_experience"] <- "4"
df[df$Spoken_Tutorial_Forum_experience=="Good", "Spoken_Tutorial_Forum_experience"] <- "5"
df[df$Spoken_Tutorial_Forum_experience=="Excellent", "Spoken_Tutorial_Forum_experience"] <- "6"


df[df$Online_discussion_session=="Extremely bad", "Online_discussion_session"] <- "1"
df[df$Online_discussion_session=="Bad", "Online_discussion_session"] <- "2"
df[df$Online_discussion_session=="Not sure", "Online_discussion_session"] <- "3"
df[df$Online_discussion_session=="Acceptable", "Online_discussion_session"] <- "4"
df[df$Online_discussion_session=="Good", "Online_discussion_session"] <- "5"
df[df$Online_discussion_session=="Excellent", "Online_discussion_session"] <- "6"


df[df$Interaction_with_Teaching_Assistant=="Extremely bad", "Interaction_with_Teaching_Assistant"] <- "1"
df[df$Interaction_with_Teaching_Assistant=="Bad", "Interaction_with_Teaching_Assistant"] <- "2"
df[df$Interaction_with_Teaching_Assistant=="Not sure", "Interaction_with_Teaching_Assistant"] <- "3"
df[df$Interaction_with_Teaching_Assistant=="Acceptable", "Interaction_with_Teaching_Assistant"] <- "4"
df[df$Interaction_with_Teaching_Assistant=="Good", "Interaction_with_Teaching_Assistant"] <- "5"
df[df$Interaction_with_Teaching_Assistant=="Excellent", "Interaction_with_Teaching_Assistant"] <- "6"


df[df$Quality_Workshop=="Extremely bad", "Quality_Workshop"] <- "1"
df[df$Quality_Workshop=="Bad", "Quality_Workshop"] <- "2"
df[df$Quality_Workshop=="Not sure", "Quality_Workshop"] <- "3"
df[df$Quality_Workshop=="Acceptable", "Quality_Workshop"] <- "4"
df[df$Quality_Workshop=="Good", "Quality_Workshop"] <- "5"
df[df$Quality_Workshop=="Excellent", "Quality_Workshop"] <- "6"




df[df$New_Knowledge=="Strongly Disagree", "New_Knowledge"] <- "1"
df[df$New_Knowledge=="Disagree", "New_Knowledge"] <- "2"
df[df$New_Knowledge=="Neither Disagree Nor Agree", "New_Knowledge"] <- "3"
df[df$New_Knowledge=="Agree", "New_Knowledge"] <- "4"
df[df$New_Knowledge=="Strongly Agree", "New_Knowledge"] <- "5"
df[df$New_Knowledge=="Not Applicable", "New_Knowledge"] <- "1"


df[df$Unhappy_Format=="Strongly Disagree", "Unhappy_Format"] <- "5"
df[df$Unhappy_Format=="Disagree", "Unhappy_Format"] <- "4"
df[df$Unhappy_Format=="Neither Disagree Nor Agree", "Unhappy_Format"] <- "3"
df[df$Unhappy_Format=="Agree", "Unhappy_Format"] <- "2"
df[df$Unhappy_Format=="Strongly Agree", "Unhappy_Format"] <- "1"
df[df$Unhappy_Format=="Not Applicable", "Unhappy_Format"] <- "1"


df[df$Willing_Participate_Activities=="Strongly Disagree", "Willing_Participate_Activities"] <- "1"
df[df$Willing_Participate_Activities=="Disagree", "Willing_Participate_Activities"] <- "2"
df[df$Willing_Participate_Activities=="Neither Disagree Nor Agree", "Willing_Participate_Activities"] <- "3"
df[df$Willing_Participate_Activities=="Agree", "Willing_Participate_Activities"] <- "4"
df[df$Willing_Participate_Activities=="Strongly Agree", "Willing_Participate_Activities"] <- "5"
df[df$Willing_Participate_Activities=="Not Applicable", "Willing_Participate_Activities"] <- "1"


df[df$Will_Recommend=="Strongly Disagree", "Will_Recommend"] <- "1"
df[df$Will_Recommend=="Disagree", "Will_Recommend"] <- "2"
df[df$Will_Recommend=="Neither Disagree Nor Agree", "Will_Recommend"] <- "3"
df[df$Will_Recommend=="Agree", "Will_Recommend"] <- "4"
df[df$Will_Recommend=="Strongly Agree", "Will_Recommend"] <- "5"
df[df$Will_Recommend=="Not Applicable", "Will_Recommend"] <- "1"

df[df$Not_Learn_Much=="Strongly Disagree", "Not_Learn_Much"] <- "5"
df[df$Not_Learn_Much=="Disagree", "Not_Learn_Much"] <- "4"
df[df$Not_Learn_Much=="Neither Disagree Nor Agree", "Not_Learn_Much"] <- "3"
df[df$Not_Learn_Much=="Agree", "Not_Learn_Much"] <- "2"
df[df$Not_Learn_Much=="Strongly Agree", "Not_Learn_Much"] <- "1"
df[df$Not_Learn_Much=="Not Applicable", "Not_Learn_Much"] <- "1"

df <- data.frame(apply(df, 2, function(x) as.numeric(as.character(x))))

View(df)

#Correlation between before and after workshop rating
View(cor(df[,c(24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39)]))

#Correlation between workshop feedback
View(cor(df[,c(40,41,42,43,44,45,46,47,48,49,50)]))

`Temp1` <- which(df$Jmol_3D_Modelling_Knowledge_Before-df$Jmol_3D_Modelling_Knowledge_After>0)
`Temp2` <- which(df$Jmol_3D_Model_Create_Edit_Knowledge_Before-df$Jmol_3D_Model_Create_Edit_Knowledge_After>0)
`Temp3` <- which(df$Jmol_Bond_Measure_Knowledge_Before-df$Jmol_Bond_Measure_Knowledge_After>0)
`Temp4` <- which(df$Jmol_Orbital_Create_Knowledge_Before-df$Jmol_Orbital_Create_Knowledge_After>0)
`Temp5` <- which(df$Jmol_CenterAxis_Knowledge_Before-df$Jmol_CenterAxis_Knowledge_After>0)
`Temp6` <- which(df$Jmol_PointGroups_Knowledge_Before-df$Jmol_PointGroups_Knowledge_After>0)
`Temp7` <- which(df$Jmol_Script_Cmd_3D_Knowledge_Before-df$Jmol_Script_Cmd_3D_Knowledge_After>0)
`Temp8` <- which(df$Jmol_Crystal_Knowledge_Before-df$Jmol_Crystal_Knowledge_After>0)


`Temp9` <- which(df$New_Knowledge>3)
`Temp10` <- which(df$Not_Learn_Much<=3)
`Temp11` <- intersect(`Temp9`,`Temp10`)

`Temp12` <- which(df$Quality_Workshop>=3 && df$Will_Recommend>=3)
`Temp13` <- which(df$Unhappy_Format<=3)
`Temp14` <- intersect(`Temp12`,`Temp13`)

`Temp15` <- union(`Temp11`,`Temp14`)


# Union of all row entries with inappropriate values
`Row entries` <- sort(union(union(union(union(union(union(union(union(`Temp1`,`Temp2`),`Temp3`),`Temp4`),`Temp5`),`Temp6`),`Temp7`),`Temp8`),`Temp15`))



#Now converting dataset back to original state


nrow(df1)

df1 <- df1[-`Row entries`,]


nrow(df1)




View(df1)


write.csv(df1,"C:/Users/Aboli/Desktop/tmp/FOSSEE/Code/jmol/data_cleaned_final.csv")


