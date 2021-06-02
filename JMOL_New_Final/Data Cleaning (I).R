# Purpose of script: To pinpoint the row entries in survey data that contain inconsistent/meaningless data.

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 1) Part 1: Checking the background details of participants for inconsistent entries.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 1.1) Checking if the participants who mentioned other background gave an actual other background entry. If not, the entries with unnecessary background details are selected.
if(length(which(df$`Background` == "Other"))!=length(which(!is.na(df$`Background (Other)`))))
{
ms1<- setdiff(which(!is.na(df$`Background (Other)`)),which(df$`Background` == "Other"))
}
View(df[c(ms1),])

# 1.2) Checking if participants were already using modelling software but did not provide name of software.
if(length(which(df$`Already Using Modelling Software in Organization` == "Yes"))!=length(which(!is.na(df$`Already Using Modelling Software in Organization (Name of Software)`))))
{
  ms2 <- setdiff(which(df$`Already Using Modelling Software in Organization` == "Yes"),which(!is.na(df$`Already Using Modelling Software in Organization (Name of Software)`)))
}
View(df[c(ms2),])

# 1.3) Checking if participants were not already using modelling software but provided name of software.
if(length(which(df$`Already Using Modelling Software in Organization` == "No"|df$`Already Using Modelling Software in Organization` == "Not Sure"))!=length(which(is.na(df$`Already Using Modelling Software in Organization (Name of Software)`))))
{
  ms3 <- intersect(which(df$`Already Using Modelling Software in Organization` == "No"|df$`Already Using Modelling Software in Organization` == "Not Sure"),which(!is.na(df$`Already Using Modelling Software in Organization (Name of Software)`)))
}
View(df[c(ms3),])


# 1.4) Checking if participants were already using Jmol but did not provide use of Jmol.
if(length(which(df$`Used Jmol Before` == "Yes"))!=length(which(is.na(df$`Used Jmol Before (Purpose)`))))
{
  ms4 <- intersect(which(is.na(df$`Used Jmol Before (Purpose)`)),which(df$`Used Jmol Before` == "Yes"))
}
View(df[c(ms4),])

# 1.5) Checking if participants were not already using Jmol but provided use case of Jmol.
if(length(which(df$`Used Jmol Before` == "No"))!=length(which(!is.na(df$`Used Jmol Before (Purpose)`))))
{
  ms5 <- intersect(which(df$`Used Jmol Before` == "No"),which(!is.na(df$`Used Jmol Before (Purpose)`)))
}
View(df[c(ms5),])

# 1.6) Checking if the number of participants mentioning other ICT Tools description without selecting the Others option in the "ICT Tools Participant Will Use for Learning" question.
if(length(which(df$`ICT Tools Participant Will Use for Learning` == "Others"))!=length(which(!is.na(df$`ICT Tools Participant Will Use for Learning (Other)`))))
{
  ms6 <- intersect(which(df$`ICT Tools Participant Will Use for Learning` != "Others"),which(!is.na(df$`ICT Tools Participant Will Use for Learning (Other)`)))
}
ms6
View(df[c(ms6),])

# 1.7) Checking if the participants preferred conventional methods in spite of never having used traditional methods before.
# 1.7.1) Checking the conventional methods used by participants.
unique(df$`Conventional Methods of Visualization Used by Participant`)
# 1.7.2) Identifying the participants that preferred conventional methods even after learning Jmol.
temp1 <- which(grepl( "Conventional 2D drawing of molecules",df$`Method Preferred After Learning Jmol`,fixed=TRUE))
temp2 <- which(grepl( "Handheld 3D plastic or wooden models of molecules",df$`Method Preferred After Learning Jmol`,fixed=TRUE))
temp3 <- union(temp1,temp2)
temp3
# 1.7.3) Identifying the participants that never used conventional methods.
temp4 <- which(is.element(df$`Conventional Methods of Visualization Used by Participant`,c("No","NO","NA","Never used 3D plastic or Wooden models but now Jmol Software can help me further to study molecular structures measurement,labelling, orbitals, crystal structures, the best software i've used..","No experience","never taught before","Not used so far","no")))
temp4
# 1.7.4) Checking if the participants preferred conventional methods in spite of never having used traditional methods before.
ms7 <- intersect(temp3,temp4)

ms7
View(df[c(ms7),])


# 1.8) Collecting all the misleading rows identified in this section together and removing the temporary variables.
re0<- c(ms1,ms2,ms3,ms4,ms5,ms6,ms7)
rm(list=setdiff(ls(),c("re0","df")))

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 2) Part 2:  Checking the feedback details for inconsistent entries.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 2.1)Checking if level has dropped after workshop
temp1=which(df$`(Concept 1) Jmol 3D Modelling Knowledge Before Workshop`=="Expert"&(df$`(Concept 1) Jmol 3D Modelling Knowledge After Workshop`=="Proficient"|df$`(Concept 1) Jmol 3D Modelling Knowledge After Workshop`=="Competent"|df$`(Concept 1) Jmol 3D Modelling Knowledge After Workshop`=="Amateur"|df$`(Concept 1) Jmol 3D Modelling Knowledge After Workshop`=="Novice"|df$`(Concept 1) Jmol 3D Modelling Knowledge After Workshop`=="Unaware"))
temp2=which(df$`(Concept 1) Jmol 3D Modelling Knowledge Before Workshop`=="Proficient"&(df$`(Concept 1) Jmol 3D Modelling Knowledge After Workshop`=="Competent"|df$`(Concept 1) Jmol 3D Modelling Knowledge After Workshop`=="Amateur"|df$`(Concept 1) Jmol 3D Modelling Knowledge After Workshop`=="Novice"|df$`(Concept 1) Jmol 3D Modelling Knowledge After Workshop`=="Unaware"))
temp3=which(df$`(Concept 1) Jmol 3D Modelling Knowledge Before Workshop`=="Competent"&(df$`(Concept 1) Jmol 3D Modelling Knowledge After Workshop`=="Amateur"|df$`(Concept 1) Jmol 3D Modelling Knowledge After Workshop`=="Novice"|df$`(Concept 1) Jmol 3D Modelling Knowledge After Workshop`=="Unaware"))
temp4=which(df$`(Concept 1) Jmol 3D Modelling Knowledge Before Workshop`=="Amateur"&(df$`(Concept 1) Jmol 3D Modelling Knowledge After Workshop`=="Novice"|df$`(Concept 1) Jmol 3D Modelling Knowledge After Workshop`=="Unaware"))
temp5=which(df$`(Concept 1) Jmol 3D Modelling Knowledge Before Workshop`=="Novice"&df$`(Concept 1) Jmol 3D Modelling Knowledge After Workshop`=="Unaware")
re1=c(temp1,temp2,temp3,temp4,temp5)
rm(list=ls(pattern="temp"))


# 2.2)Checking if level has dropped after workshop
temp1=which(df$`(Concept 2) Jmol 3D Model Create Edit Knowledge Before Workshop`=="Expert"&(df$`(Concept 2) Jmol 3D Model Create Edit Knowledge After Workshop`=="Proficient"|df$`(Concept 2) Jmol 3D Model Create Edit Knowledge After Workshop`=="Competent"|df$`(Concept 2) Jmol 3D Model Create Edit Knowledge After Workshop`=="Amateur"|df$`(Concept 2) Jmol 3D Model Create Edit Knowledge After Workshop`=="Novice"|df$`(Concept 2) Jmol 3D Model Create Edit Knowledge After Workshop`=="Unaware"))
temp2=which(df$`(Concept 2) Jmol 3D Model Create Edit Knowledge Before Workshop`=="Proficient"&(df$`(Concept 2) Jmol 3D Model Create Edit Knowledge After Workshop`=="Competent"|df$`(Concept 2) Jmol 3D Model Create Edit Knowledge After Workshop`=="Amateur"|df$`(Concept 2) Jmol 3D Model Create Edit Knowledge After Workshop`=="Novice"|df$`(Concept 2) Jmol 3D Model Create Edit Knowledge After Workshop`=="Unaware"))
temp3=which(df$`(Concept 2) Jmol 3D Model Create Edit Knowledge Before Workshop`=="Competent"&(df$`(Concept 2) Jmol 3D Model Create Edit Knowledge After Workshop`=="Amateur"|df$`(Concept 2) Jmol 3D Model Create Edit Knowledge After Workshop`=="Novice"|df$`(Concept 2) Jmol 3D Model Create Edit Knowledge After Workshop`=="Unaware"))
temp4=which(df$`(Concept 2) Jmol 3D Model Create Edit Knowledge Before Workshop`=="Amateur"&(df$`(Concept 2) Jmol 3D Model Create Edit Knowledge After Workshop`=="Novice"|df$`(Concept 2) Jmol 3D Model Create Edit Knowledge After Workshop`=="Unaware"))
temp5=which(df$`(Concept 2) Jmol 3D Model Create Edit Knowledge Before Workshop`=="Novice"&df$`(Concept 2) Jmol 3D Model Create Edit Knowledge After Workshop`=="Unaware")
re2=c(temp1,temp2,temp3,temp4,temp5)
rm(list=ls(pattern="temp"))

# 2.3)Checking if level has dropped after workshop
temp1=which(df$`(Concept 3) Jmol Bond Measure Knowledge Before Workshop`=="Expert"&(df$`(Concept 3) Jmol Bond Measure Knowledge After Workshop`=="Proficient"|df$`(Concept 3) Jmol Bond Measure Knowledge After Workshop`=="Competent"|df$`(Concept 3) Jmol Bond Measure Knowledge After Workshop`=="Amateur"|df$`(Concept 3) Jmol Bond Measure Knowledge After Workshop`=="Novice"|df$`(Concept 3) Jmol Bond Measure Knowledge After Workshop`=="Unaware"))
temp2=which(df$`(Concept 3) Jmol Bond Measure Knowledge Before Workshop`=="Proficient"&(df$`(Concept 3) Jmol Bond Measure Knowledge After Workshop`=="Competent"|df$`(Concept 3) Jmol Bond Measure Knowledge After Workshop`=="Amateur"|df$`(Concept 3) Jmol Bond Measure Knowledge After Workshop`=="Novice"|df$`(Concept 3) Jmol Bond Measure Knowledge After Workshop`=="Unaware"))
temp3=which(df$`(Concept 3) Jmol Bond Measure Knowledge Before Workshop`=="Competent"&(df$`(Concept 3) Jmol Bond Measure Knowledge After Workshop`=="Amateur"|df$`(Concept 3) Jmol Bond Measure Knowledge After Workshop`=="Novice"|df$`(Concept 3) Jmol Bond Measure Knowledge After Workshop`=="Unaware"))
temp4=which(df$`(Concept 3) Jmol Bond Measure Knowledge Before Workshop`=="Amateur"&(df$`(Concept 3) Jmol Bond Measure Knowledge After Workshop`=="Novice"|df$`(Concept 3) Jmol Bond Measure Knowledge After Workshop`=="Unaware"))
temp5=which(df$`(Concept 3) Jmol Bond Measure Knowledge Before Workshop`=="Novice"&df$`(Concept 3) Jmol Bond Measure Knowledge After Workshop`=="Unaware")
re3=c(temp1,temp2,temp3,temp4,temp5)
rm(list=ls(pattern="temp"))


# 2.4)Checking if level has dropped after workshop
temp1=which(df$`(Concept 4) Jmol Orbital Create Knowledge Before Workshop`=="Expert"&(df$`(Concept 4) Jmol Orbital Create Knowledge After Workshop`=="Proficient"|df$`(Concept 4) Jmol Orbital Create Knowledge After Workshop`=="Competent"|df$`(Concept 4) Jmol Orbital Create Knowledge After Workshop`=="Amateur"|df$`(Concept 4) Jmol Orbital Create Knowledge After Workshop`=="Novice"|df$`(Concept 4) Jmol Orbital Create Knowledge After Workshop`=="Unaware"))
temp2=which(df$`(Concept 4) Jmol Orbital Create Knowledge Before Workshop`=="Proficient"&(df$`(Concept 4) Jmol Orbital Create Knowledge After Workshop`=="Competent"|df$`(Concept 4) Jmol Orbital Create Knowledge After Workshop`=="Amateur"|df$`(Concept 4) Jmol Orbital Create Knowledge After Workshop`=="Novice"|df$`(Concept 4) Jmol Orbital Create Knowledge After Workshop`=="Unaware"))
temp3=which(df$`(Concept 4) Jmol Orbital Create Knowledge Before Workshop`=="Competent"&(df$`(Concept 4) Jmol Orbital Create Knowledge After Workshop`=="Amateur"|df$`(Concept 4) Jmol Orbital Create Knowledge After Workshop`=="Novice"|df$`(Concept 4) Jmol Orbital Create Knowledge After Workshop`=="Unaware"))
temp4=which(df$`(Concept 4) Jmol Orbital Create Knowledge Before Workshop`=="Amateur"&(df$`(Concept 4) Jmol Orbital Create Knowledge After Workshop`=="Novice"|df$`(Concept 4) Jmol Orbital Create Knowledge After Workshop`=="Unaware"))
temp5=which(df$`(Concept 4) Jmol Orbital Create Knowledge Before Workshop`=="Novice"&df$`(Concept 4) Jmol Orbital Create Knowledge After Workshop`=="Unaware")
re4=c(temp1,temp2,temp3,temp4,temp5)
rm(list=ls(pattern="temp"))

# 2.5)Checking if level has dropped after workshop
temp1=which(df$`(Concept 5) Jmol Center of Axis Knowledge Before Workshop`=="Expert"&(df$`(Concept 5) Jmol Center of Axis Knowledge After Workshop`=="Proficient"|df$`(Concept 5) Jmol Center of Axis Knowledge After Workshop`=="Competent"|df$`(Concept 5) Jmol Center of Axis Knowledge After Workshop`=="Amateur"|df$`(Concept 5) Jmol Center of Axis Knowledge After Workshop`=="Novice"|df$`(Concept 5) Jmol Center of Axis Knowledge After Workshop`=="Unaware"))
temp2=which(df$`(Concept 5) Jmol Center of Axis Knowledge Before Workshop`=="Proficient"&(df$`(Concept 5) Jmol Center of Axis Knowledge After Workshop`=="Competent"|df$`(Concept 5) Jmol Center of Axis Knowledge After Workshop`=="Amateur"|df$`(Concept 5) Jmol Center of Axis Knowledge After Workshop`=="Novice"|df$`(Concept 5) Jmol Center of Axis Knowledge After Workshop`=="Unaware"))
temp3=which(df$`(Concept 5) Jmol Center of Axis Knowledge Before Workshop`=="Competent"&(df$`(Concept 5) Jmol Center of Axis Knowledge After Workshop`=="Amateur"|df$`(Concept 5) Jmol Center of Axis Knowledge After Workshop`=="Novice"|df$`(Concept 5) Jmol Center of Axis Knowledge After Workshop`=="Unaware"))
temp4=which(df$`(Concept 5) Jmol Center of Axis Knowledge Before Workshop`=="Amateur"&(df$`(Concept 5) Jmol Center of Axis Knowledge After Workshop`=="Novice"|df$`(Concept 5) Jmol Center of Axis Knowledge After Workshop`=="Unaware"))
temp5=which(df$`(Concept 5) Jmol Center of Axis Knowledge Before Workshop`=="Novice"&df$`(Concept 5) Jmol Center of Axis Knowledge After Workshop`=="Unaware")
re5=c(temp1,temp2,temp3,temp4,temp5)
rm(list=ls(pattern="temp"))

# 2.6)Checking if level has dropped after workshop
temp1=which(df$`(Concept 6) Jmol Point Groups Knowledge Before Workshop`=="Expert"&(df$`(Concept 6) Jmol Point Groups Knowledge After Workshop`=="Proficient"|df$`(Concept 6) Jmol Point Groups Knowledge After Workshop`=="Competent"|df$`(Concept 6) Jmol Point Groups Knowledge After Workshop`=="Amateur"|df$`(Concept 6) Jmol Point Groups Knowledge After Workshop`=="Novice"|df$`(Concept 6) Jmol Point Groups Knowledge After Workshop`=="Unaware"))
temp2=which(df$`(Concept 6) Jmol Point Groups Knowledge Before Workshop`=="Proficient"&(df$`(Concept 6) Jmol Point Groups Knowledge After Workshop`=="Competent"|df$`(Concept 6) Jmol Point Groups Knowledge After Workshop`=="Amateur"|df$`(Concept 6) Jmol Point Groups Knowledge After Workshop`=="Novice"|df$`(Concept 6) Jmol Point Groups Knowledge After Workshop`=="Unaware"))
temp3=which(df$`(Concept 6) Jmol Point Groups Knowledge Before Workshop`=="Competent"&(df$`(Concept 6) Jmol Point Groups Knowledge After Workshop`=="Amateur"|df$`(Concept 6) Jmol Point Groups Knowledge After Workshop`=="Novice"|df$`(Concept 6) Jmol Point Groups Knowledge After Workshop`=="Unaware"))
temp4=which(df$`(Concept 6) Jmol Point Groups Knowledge Before Workshop`=="Amateur"&(df$`(Concept 6) Jmol Point Groups Knowledge After Workshop`=="Novice"|df$`(Concept 6) Jmol Point Groups Knowledge After Workshop`=="Unaware"))
temp5=which(df$`(Concept 6) Jmol Point Groups Knowledge Before Workshop`=="Novice"&df$`(Concept 6) Jmol Point Groups Knowledge After Workshop`=="Unaware")
re6=c(temp1,temp2,temp3,temp4,temp5)
rm(list=ls(pattern="temp"))

# 2.7)Checking if level has dropped after workshop
temp1=which(df$`(Concept 7) Jmol Script CMD 3D Model Knowledge Before Workshop`=="Expert"&(df$`(Concept 7) Jmol Script CMD 3D Model Knowledge After Workshop`=="Proficient"|df$`(Concept 7) Jmol Script CMD 3D Model Knowledge After Workshop`=="Competent"|df$`(Concept 7) Jmol Script CMD 3D Model Knowledge After Workshop`=="Amateur"|df$`(Concept 7) Jmol Script CMD 3D Model Knowledge After Workshop`=="Novice"|df$`(Concept 7) Jmol Script CMD 3D Model Knowledge After Workshop`=="Unaware"))
temp2=which(df$`(Concept 7) Jmol Script CMD 3D Model Knowledge Before Workshop`=="Proficient"&(df$`(Concept 7) Jmol Script CMD 3D Model Knowledge After Workshop`=="Competent"|df$`(Concept 7) Jmol Script CMD 3D Model Knowledge After Workshop`=="Amateur"|df$`(Concept 7) Jmol Script CMD 3D Model Knowledge After Workshop`=="Novice"|df$`(Concept 7) Jmol Script CMD 3D Model Knowledge After Workshop`=="Unaware"))
temp3=which(df$`(Concept 7) Jmol Script CMD 3D Model Knowledge Before Workshop`=="Competent"&(df$`(Concept 7) Jmol Script CMD 3D Model Knowledge After Workshop`=="Amateur"|df$`(Concept 7) Jmol Script CMD 3D Model Knowledge After Workshop`=="Novice"|df$`(Concept 7) Jmol Script CMD 3D Model Knowledge After Workshop`=="Unaware"))
temp4=which(df$`(Concept 7) Jmol Script CMD 3D Model Knowledge Before Workshop`=="Amateur"&(df$`(Concept 7) Jmol Script CMD 3D Model Knowledge After Workshop`=="Novice"|df$`(Concept 7) Jmol Script CMD 3D Model Knowledge After Workshop`=="Unaware"))
temp5=which(df$`(Concept 7) Jmol Script CMD 3D Model Knowledge Before Workshop`=="Novice"&df$`(Concept 7) Jmol Script CMD 3D Model Knowledge After Workshop`=="Unaware")
re7=c(temp1,temp2,temp3,temp4,temp5)
rm(list=ls(pattern="temp"))

# 2.8)Checking if level has dropped after workshop
temp1=which(df$`(Concept 8) Jmol Crystal Display Knowledge Before Workshop`=="Expert"&(df$`(Concept 8) Jmol Crystal Display Knowledge After Workshop`=="Proficient"|df$`(Concept 8) Jmol Crystal Display Knowledge After Workshop`=="Competent"|df$`(Concept 8) Jmol Crystal Display Knowledge After Workshop`=="Amateur"|df$`(Concept 8) Jmol Crystal Display Knowledge After Workshop`=="Novice"|df$`(Concept 8) Jmol Crystal Display Knowledge After Workshop`=="Unaware"))
temp2=which(df$`(Concept 8) Jmol Crystal Display Knowledge Before Workshop`=="Proficient"&(df$`(Concept 8) Jmol Crystal Display Knowledge After Workshop`=="Competent"|df$`(Concept 8) Jmol Crystal Display Knowledge After Workshop`=="Amateur"|df$`(Concept 8) Jmol Crystal Display Knowledge After Workshop`=="Novice"|df$`(Concept 8) Jmol Crystal Display Knowledge After Workshop`=="Unaware"))
temp3=which(df$`(Concept 8) Jmol Crystal Display Knowledge Before Workshop`=="Competent"&(df$`(Concept 8) Jmol Crystal Display Knowledge After Workshop`=="Amateur"|df$`(Concept 8) Jmol Crystal Display Knowledge After Workshop`=="Novice"|df$`(Concept 8) Jmol Crystal Display Knowledge After Workshop`=="Unaware"))
temp4=which(df$`(Concept 8) Jmol Crystal Display Knowledge Before Workshop`=="Amateur"&(df$`(Concept 8) Jmol Crystal Display Knowledge After Workshop`=="Novice"|df$`(Concept 8) Jmol Crystal Display Knowledge After Workshop`=="Unaware"))
temp5=which(df$`(Concept 8) Jmol Crystal Display Knowledge Before Workshop`=="Novice"&df$`(Concept 8) Jmol Crystal Display Knowledge After Workshop`=="Unaware")
re8=c(temp1,temp2,temp3,temp4,temp5)
rm(list=ls(pattern="temp"))

# 2.9) Collecting all the row entries in which level dropped after workshop in re9 object.
re9 <- c(re1,re2,re3,re4,re5,re6,re7,re8)

# 2.10) Collecting the row entries with contradictory feedback about workshop in re10 object.
temp1=which((df$`Exposure To New Knowledge`=="Strongly Disagree"|df$`Exposure To New Knowledge`=="Disagree")&(df$`Did Not Learn Much`=="Strongly Disagree"|df$`Did Not Learn Much`=="Disagree"))
temp2=which((df$`Exposure To New Knowledge`=="Strongly Agree"|df$`Exposure To New Knowledge`=="Agree")&(df$`Did Not Learn Much`=="Strongly Agree"|df$`Did Not Learn Much`=="Disagree"))
temp3=which((df$`Quality of Workshop`=="Strongly Agree"|df$`Quality of Workshop`=="Agree")&(df$`Will Recommend Workshop`=="Strongly Agree"|df$`Will Recommend Workshop`=="Agree")&(df$`Unhappy With Workshop Format`=="Strongly Agree"|df$`Unhappy With Workshop Format`=="Agree")&(df$`Did Not Learn Much`=="Strongly Agree"|df$`Did Not Learn Much`=="Agree"))
re10 <- c(temp1,temp2,temp3)
rm(list=ls(pattern="temp"))

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 3) Part 3:  Collecting all the inconsistent rows found in this script together.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 3.1) Performing concatenation to form the set of unique rows that are inconsistent or meaningless.
rows_inconsistent <- c(re0,re9,re10)

# 3.2) Getting the frequency of the inconsistent rows in order to remove entries with highly inconsistent answers.
Table <- table(rows_inconsistent)

# 3.3) Storing the row numbers with highly inconsistent(>1 inconsistent entries) in rowentries object.
rowentries <- c(as.numeric(names(Table)[which(Table>1)]))


#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 4) Part 4: Clearing all the R objects created in this script from the environment, except for the ones needed in the next script.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 4.1) Removing all objects except dataframe df and rowentries.
rm(list=setdiff(ls(),c("df","rowentries")))
  

