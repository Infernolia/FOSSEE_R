# Purpose of this script: To find and remove misleading row entries from the data.

source("Data Loading and Exploring.R")

#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 1) Checking the background details of participants.
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 1.1) Checking whether the participants who selected "Other" in the "Background" column gave its description in the subsequent column or not.
if(length(which(Data$`Background` == "Other"))!=length(which(!is.na(Data$`Background (Other)`))))
{
  ms1<- setdiff(which(!is.na(Data$`Background (Other)`)),which(Data$`Background` == "Other"))
}

# 1.2) Checking for entries where participants first selected "Yes" when asked whether they are already using modelling software but did not provide the name of software.
if(length(which(Data$`Already Using Modelling Software in Organization` == "Yes"))!=length(which(!is.na(Data$`Already Using Modelling Software in Organization (Name of Software)`))))
{
  ms2 <- setdiff(which(Data$`Already Using Modelling Software in Organization` == "Yes"),which(!is.na(Data$`Already Using Modelling Software in Organization (Name of Software)`)))
}

# 1.3) Checking for entries where participants first selected "No" when asked whether they are already using modelling software but provided the name of a software.
if(length(which(Data$`Already Using Modelling Software in Organization` == "No"|Data$`Already Using Modelling Software in Organization` == "Not Sure"))!=length(which(is.na(Data$`Already Using Modelling Software in Organization (Name of Software)`))))
{
  ms3 <- intersect(which(Data$`Already Using Modelling Software in Organization` == "No"|Data$`Already Using Modelling Software in Organization` == "Not Sure"),which(!is.na(Data$`Already Using Modelling Software in Organization (Name of Software)`)))
}

# 1.4) Checking for entries where participants initially marked that they were already using Jmol but did not mention the purpose.
if(length(which(Data$`Used Jmol Before` == "Yes"))!=length(which(is.na(Data$`Used Jmol Before (Purpose)`))))
{
  ms4 <- intersect(which(is.na(Data$`Used Jmol Before (Purpose)`)),which(Data$`Used Jmol Before` == "Yes"))
}

# 1.5) Checking for entries where participants initially marked that they were not already using Jmol but mentioned the purpose of using Jmol.
if(length(which(Data$`Used Jmol Before` == "No"))!=length(which(!is.na(Data$`Used Jmol Before (Purpose)`))))
{
  ms5 <- intersect(which(Data$`Used Jmol Before` == "No"),which(!is.na(Data$`Used Jmol Before (Purpose)`)))
}

# 1.6) Checking whether any participant added a response under the "ICT Tools Participant Will Use for Learning (Other)" column without initially selecting the "Other" option in its previous column.
if(length(which(Data$`ICT Tools Participant Will Use for Learning` == "Others"))!=length(which(!is.na(Data$`ICT Tools Participant Will Use for Learning (Other)`))))
{
  ms6 <- intersect(which(Data$`ICT Tools Participant Will Use for Learning` != "Others"),which(!is.na(Data$`ICT Tools Participant Will Use for Learning (Other)`)))
}

# 1.7) Collecting all the misleading row entries.
re0 <- c(ms1,ms2,ms3,ms4,ms5,ms6)

# 1.8) Removing R objects.
rm(list=setdiff(ls(),c("re0","Data")))

#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 2) Checking the feedback details.
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 2.1) Checking if level of knowledge dropped after workshop.
temp1=which(Data$`(Concept) Jmol 3D Modelling Knowledge Before Workshop`=="Expert"&(Data$`(Concept) Jmol 3D Modelling Knowledge After Workshop`=="Proficient"|Data$`(Concept) Jmol 3D Modelling Knowledge After Workshop`=="Competent"|Data$`(Concept) Jmol 3D Modelling Knowledge After Workshop`=="Amateur"|Data$`(Concept) Jmol 3D Modelling Knowledge After Workshop`=="Novice"|Data$`(Concept) Jmol 3D Modelling Knowledge After Workshop`=="Unaware"))
temp2=which(Data$`(Concept) Jmol 3D Modelling Knowledge Before Workshop`=="Proficient"&(Data$`(Concept) Jmol 3D Modelling Knowledge After Workshop`=="Competent"|Data$`(Concept) Jmol 3D Modelling Knowledge After Workshop`=="Amateur"|Data$`(Concept) Jmol 3D Modelling Knowledge After Workshop`=="Novice"|Data$`(Concept) Jmol 3D Modelling Knowledge After Workshop`=="Unaware"))
temp3=which(Data$`(Concept) Jmol 3D Modelling Knowledge Before Workshop`=="Competent"&(Data$`(Concept) Jmol 3D Modelling Knowledge After Workshop`=="Amateur"|Data$`(Concept) Jmol 3D Modelling Knowledge After Workshop`=="Novice"|Data$`(Concept) Jmol 3D Modelling Knowledge After Workshop`=="Unaware"))
temp4=which(Data$`(Concept) Jmol 3D Modelling Knowledge Before Workshop`=="Amateur"&(Data$`(Concept) Jmol 3D Modelling Knowledge After Workshop`=="Novice"|Data$`(Concept) Jmol 3D Modelling Knowledge After Workshop`=="Unaware"))
temp5=which(Data$`(Concept) Jmol 3D Modelling Knowledge Before Workshop`=="Novice"&Data$`(Concept) Jmol 3D Modelling Knowledge After Workshop`=="Unaware")
re1=c(temp1,temp2,temp3,temp4,temp5)
rm(list=ls(pattern="temp"))
temp1=which(Data$`(Concept) Jmol 3D Model Create Edit Knowledge Before Workshop`=="Expert"&(Data$`(Concept) Jmol 3D Model Create Edit Knowledge After Workshop`=="Proficient"|Data$`(Concept) Jmol 3D Model Create Edit Knowledge After Workshop`=="Competent"|Data$`(Concept) Jmol 3D Model Create Edit Knowledge After Workshop`=="Amateur"|Data$`(Concept) Jmol 3D Model Create Edit Knowledge After Workshop`=="Novice"|Data$`(Concept) Jmol 3D Model Create Edit Knowledge After Workshop`=="Unaware"))
temp2=which(Data$`(Concept) Jmol 3D Model Create Edit Knowledge Before Workshop`=="Proficient"&(Data$`(Concept) Jmol 3D Model Create Edit Knowledge After Workshop`=="Competent"|Data$`(Concept) Jmol 3D Model Create Edit Knowledge After Workshop`=="Amateur"|Data$`(Concept) Jmol 3D Model Create Edit Knowledge After Workshop`=="Novice"|Data$`(Concept) Jmol 3D Model Create Edit Knowledge After Workshop`=="Unaware"))
temp3=which(Data$`(Concept) Jmol 3D Model Create Edit Knowledge Before Workshop`=="Competent"&(Data$`(Concept) Jmol 3D Model Create Edit Knowledge After Workshop`=="Amateur"|Data$`(Concept) Jmol 3D Model Create Edit Knowledge After Workshop`=="Novice"|Data$`(Concept) Jmol 3D Model Create Edit Knowledge After Workshop`=="Unaware"))
temp4=which(Data$`(Concept) Jmol 3D Model Create Edit Knowledge Before Workshop`=="Amateur"&(Data$`(Concept) Jmol 3D Model Create Edit Knowledge After Workshop`=="Novice"|Data$`(Concept) Jmol 3D Model Create Edit Knowledge After Workshop`=="Unaware"))
temp5=which(Data$`(Concept) Jmol 3D Model Create Edit Knowledge Before Workshop`=="Novice"&Data$`(Concept) Jmol 3D Model Create Edit Knowledge After Workshop`=="Unaware")
re2=c(temp1,temp2,temp3,temp4,temp5)
rm(list=ls(pattern="temp"))
temp1=which(Data$`(Concept) Jmol Bond Measure Knowledge Before Workshop`=="Expert"&(Data$`(Concept) Jmol Bond Measure Knowledge After Workshop`=="Proficient"|Data$`(Concept) Jmol Bond Measure Knowledge After Workshop`=="Competent"|Data$`(Concept) Jmol Bond Measure Knowledge After Workshop`=="Amateur"|Data$`(Concept) Jmol Bond Measure Knowledge After Workshop`=="Novice"|Data$`(Concept) Jmol Bond Measure Knowledge After Workshop`=="Unaware"))
temp2=which(Data$`(Concept) Jmol Bond Measure Knowledge Before Workshop`=="Proficient"&(Data$`(Concept) Jmol Bond Measure Knowledge After Workshop`=="Competent"|Data$`(Concept) Jmol Bond Measure Knowledge After Workshop`=="Amateur"|Data$`(Concept) Jmol Bond Measure Knowledge After Workshop`=="Novice"|Data$`(Concept) Jmol Bond Measure Knowledge After Workshop`=="Unaware"))
temp3=which(Data$`(Concept) Jmol Bond Measure Knowledge Before Workshop`=="Competent"&(Data$`(Concept) Jmol Bond Measure Knowledge After Workshop`=="Amateur"|Data$`(Concept) Jmol Bond Measure Knowledge After Workshop`=="Novice"|Data$`(Concept) Jmol Bond Measure Knowledge After Workshop`=="Unaware"))
temp4=which(Data$`(Concept) Jmol Bond Measure Knowledge Before Workshop`=="Amateur"&(Data$`(Concept) Jmol Bond Measure Knowledge After Workshop`=="Novice"|Data$`(Concept) Jmol Bond Measure Knowledge After Workshop`=="Unaware"))
temp5=which(Data$`(Concept) Jmol Bond Measure Knowledge Before Workshop`=="Novice"&Data$`(Concept) Jmol Bond Measure Knowledge After Workshop`=="Unaware")
re3=c(temp1,temp2,temp3,temp4,temp5)
rm(list=ls(pattern="temp"))
temp1=which(Data$`(Concept) Jmol Orbital Create Knowledge Before Workshop`=="Expert"&(Data$`(Concept) Jmol Orbital Create Knowledge After Workshop`=="Proficient"|Data$`(Concept) Jmol Orbital Create Knowledge After Workshop`=="Competent"|Data$`(Concept) Jmol Orbital Create Knowledge After Workshop`=="Amateur"|Data$`(Concept) Jmol Orbital Create Knowledge After Workshop`=="Novice"|Data$`(Concept) Jmol Orbital Create Knowledge After Workshop`=="Unaware"))
temp2=which(Data$`(Concept) Jmol Orbital Create Knowledge Before Workshop`=="Proficient"&(Data$`(Concept) Jmol Orbital Create Knowledge After Workshop`=="Competent"|Data$`(Concept) Jmol Orbital Create Knowledge After Workshop`=="Amateur"|Data$`(Concept) Jmol Orbital Create Knowledge After Workshop`=="Novice"|Data$`(Concept) Jmol Orbital Create Knowledge After Workshop`=="Unaware"))
temp3=which(Data$`(Concept) Jmol Orbital Create Knowledge Before Workshop`=="Competent"&(Data$`(Concept) Jmol Orbital Create Knowledge After Workshop`=="Amateur"|Data$`(Concept) Jmol Orbital Create Knowledge After Workshop`=="Novice"|Data$`(Concept) Jmol Orbital Create Knowledge After Workshop`=="Unaware"))
temp4=which(Data$`(Concept) Jmol Orbital Create Knowledge Before Workshop`=="Amateur"&(Data$`(Concept) Jmol Orbital Create Knowledge After Workshop`=="Novice"|Data$`(Concept) Jmol Orbital Create Knowledge After Workshop`=="Unaware"))
temp5=which(Data$`(Concept) Jmol Orbital Create Knowledge Before Workshop`=="Novice"&Data$`(Concept) Jmol Orbital Create Knowledge After Workshop`=="Unaware")
re4=c(temp1,temp2,temp3,temp4,temp5)
rm(list=ls(pattern="temp"))
temp1=which(Data$`(Concept) Jmol Center of Axis Knowledge Before Workshop`=="Expert"&(Data$`(Concept) Jmol Center of Axis Knowledge After Workshop`=="Proficient"|Data$`(Concept) Jmol Center of Axis Knowledge After Workshop`=="Competent"|Data$`(Concept) Jmol Center of Axis Knowledge After Workshop`=="Amateur"|Data$`(Concept) Jmol Center of Axis Knowledge After Workshop`=="Novice"|Data$`(Concept) Jmol Center of Axis Knowledge After Workshop`=="Unaware"))
temp2=which(Data$`(Concept) Jmol Center of Axis Knowledge Before Workshop`=="Proficient"&(Data$`(Concept) Jmol Center of Axis Knowledge After Workshop`=="Competent"|Data$`(Concept) Jmol Center of Axis Knowledge After Workshop`=="Amateur"|Data$`(Concept) Jmol Center of Axis Knowledge After Workshop`=="Novice"|Data$`(Concept) Jmol Center of Axis Knowledge After Workshop`=="Unaware"))
temp3=which(Data$`(Concept) Jmol Center of Axis Knowledge Before Workshop`=="Competent"&(Data$`(Concept) Jmol Center of Axis Knowledge After Workshop`=="Amateur"|Data$`(Concept) Jmol Center of Axis Knowledge After Workshop`=="Novice"|Data$`(Concept) Jmol Center of Axis Knowledge After Workshop`=="Unaware"))
temp4=which(Data$`(Concept) Jmol Center of Axis Knowledge Before Workshop`=="Amateur"&(Data$`(Concept) Jmol Center of Axis Knowledge After Workshop`=="Novice"|Data$`(Concept) Jmol Center of Axis Knowledge After Workshop`=="Unaware"))
temp5=which(Data$`(Concept) Jmol Center of Axis Knowledge Before Workshop`=="Novice"&Data$`(Concept) Jmol Center of Axis Knowledge After Workshop`=="Unaware")
re5=c(temp1,temp2,temp3,temp4,temp5)
rm(list=ls(pattern="temp"))
temp1=which(Data$`(Concept) Jmol Point Groups Knowledge Before Workshop`=="Expert"&(Data$`(Concept) Jmol Point Groups Knowledge After Workshop`=="Proficient"|Data$`(Concept) Jmol Point Groups Knowledge After Workshop`=="Competent"|Data$`(Concept) Jmol Point Groups Knowledge After Workshop`=="Amateur"|Data$`(Concept) Jmol Point Groups Knowledge After Workshop`=="Novice"|Data$`(Concept) Jmol Point Groups Knowledge After Workshop`=="Unaware"))
temp2=which(Data$`(Concept) Jmol Point Groups Knowledge Before Workshop`=="Proficient"&(Data$`(Concept) Jmol Point Groups Knowledge After Workshop`=="Competent"|Data$`(Concept) Jmol Point Groups Knowledge After Workshop`=="Amateur"|Data$`(Concept) Jmol Point Groups Knowledge After Workshop`=="Novice"|Data$`(Concept) Jmol Point Groups Knowledge After Workshop`=="Unaware"))
temp3=which(Data$`(Concept) Jmol Point Groups Knowledge Before Workshop`=="Competent"&(Data$`(Concept) Jmol Point Groups Knowledge After Workshop`=="Amateur"|Data$`(Concept) Jmol Point Groups Knowledge After Workshop`=="Novice"|Data$`(Concept) Jmol Point Groups Knowledge After Workshop`=="Unaware"))
temp4=which(Data$`(Concept) Jmol Point Groups Knowledge Before Workshop`=="Amateur"&(Data$`(Concept) Jmol Point Groups Knowledge After Workshop`=="Novice"|Data$`(Concept) Jmol Point Groups Knowledge After Workshop`=="Unaware"))
temp5=which(Data$`(Concept) Jmol Point Groups Knowledge Before Workshop`=="Novice"&Data$`(Concept) Jmol Point Groups Knowledge After Workshop`=="Unaware")
re6=c(temp1,temp2,temp3,temp4,temp5)
rm(list=ls(pattern="temp"))
temp1=which(Data$`(Concept) Jmol Script CMD 3D Model Knowledge Before Workshop`=="Expert"&(Data$`(Concept) Jmol Script CMD 3D Model Knowledge After Workshop`=="Proficient"|Data$`(Concept) Jmol Script CMD 3D Model Knowledge After Workshop`=="Competent"|Data$`(Concept) Jmol Script CMD 3D Model Knowledge After Workshop`=="Amateur"|Data$`(Concept) Jmol Script CMD 3D Model Knowledge After Workshop`=="Novice"|Data$`(Concept) Jmol Script CMD 3D Model Knowledge After Workshop`=="Unaware"))
temp2=which(Data$`(Concept) Jmol Script CMD 3D Model Knowledge Before Workshop`=="Proficient"&(Data$`(Concept) Jmol Script CMD 3D Model Knowledge After Workshop`=="Competent"|Data$`(Concept) Jmol Script CMD 3D Model Knowledge After Workshop`=="Amateur"|Data$`(Concept) Jmol Script CMD 3D Model Knowledge After Workshop`=="Novice"|Data$`(Concept) Jmol Script CMD 3D Model Knowledge After Workshop`=="Unaware"))
temp3=which(Data$`(Concept) Jmol Script CMD 3D Model Knowledge Before Workshop`=="Competent"&(Data$`(Concept) Jmol Script CMD 3D Model Knowledge After Workshop`=="Amateur"|Data$`(Concept) Jmol Script CMD 3D Model Knowledge After Workshop`=="Novice"|Data$`(Concept) Jmol Script CMD 3D Model Knowledge After Workshop`=="Unaware"))
temp4=which(Data$`(Concept) Jmol Script CMD 3D Model Knowledge Before Workshop`=="Amateur"&(Data$`(Concept) Jmol Script CMD 3D Model Knowledge After Workshop`=="Novice"|Data$`(Concept) Jmol Script CMD 3D Model Knowledge After Workshop`=="Unaware"))
temp5=which(Data$`(Concept) Jmol Script CMD 3D Model Knowledge Before Workshop`=="Novice"&Data$`(Concept) Jmol Script CMD 3D Model Knowledge After Workshop`=="Unaware")
re7=c(temp1,temp2,temp3,temp4,temp5)
rm(list=ls(pattern="temp"))
temp1=which(Data$`(Concept) Jmol Crystal Display Knowledge Before Workshop`=="Expert"&(Data$`(Concept) Jmol Crystal Display Knowledge After Workshop`=="Proficient"|Data$`(Concept) Jmol Crystal Display Knowledge After Workshop`=="Competent"|Data$`(Concept) Jmol Crystal Display Knowledge After Workshop`=="Amateur"|Data$`(Concept) Jmol Crystal Display Knowledge After Workshop`=="Novice"|Data$`(Concept) Jmol Crystal Display Knowledge After Workshop`=="Unaware"))
temp2=which(Data$`(Concept) Jmol Crystal Display Knowledge Before Workshop`=="Proficient"&(Data$`(Concept) Jmol Crystal Display Knowledge After Workshop`=="Competent"|Data$`(Concept) Jmol Crystal Display Knowledge After Workshop`=="Amateur"|Data$`(Concept) Jmol Crystal Display Knowledge After Workshop`=="Novice"|Data$`(Concept) Jmol Crystal Display Knowledge After Workshop`=="Unaware"))
temp3=which(Data$`(Concept) Jmol Crystal Display Knowledge Before Workshop`=="Competent"&(Data$`(Concept) Jmol Crystal Display Knowledge After Workshop`=="Amateur"|Data$`(Concept) Jmol Crystal Display Knowledge After Workshop`=="Novice"|Data$`(Concept) Jmol Crystal Display Knowledge After Workshop`=="Unaware"))
temp4=which(Data$`(Concept) Jmol Crystal Display Knowledge Before Workshop`=="Amateur"&(Data$`(Concept) Jmol Crystal Display Knowledge After Workshop`=="Novice"|Data$`(Concept) Jmol Crystal Display Knowledge After Workshop`=="Unaware"))
temp5=which(Data$`(Concept) Jmol Crystal Display Knowledge Before Workshop`=="Novice"&Data$`(Concept) Jmol Crystal Display Knowledge After Workshop`=="Unaware")
re8=c(temp1,temp2,temp3,temp4,temp5)
rm(list=ls(pattern="temp"))
# 2.1.1) Row entries indicating a drop in the level of knowledge after workshop.
re9 <- c(re1,re2,re3,re4,re5,re6,re7,re8)
# NOTE: As there are no row entries indicating a drop in the level of knowledge after workshop. The R object "re9" shall be removed.

# 2.2) Checking for contradictory feedback about workshop.
temp1=which((Data$`Exposure To New Knowledge`=="Strongly Disagree"|Data$`Exposure To New Knowledge`=="Disagree")&(Data$`Did Not Learn Much`=="Strongly Disagree"|Data$`Did Not Learn Much`=="Disagree"))
temp2=which((Data$`Exposure To New Knowledge`=="Strongly Agree"|Data$`Exposure To New Knowledge`=="Agree")&(Data$`Did Not Learn Much`=="Strongly Agree"|Data$`Did Not Learn Much`=="Disagree"))
temp3=which((Data$`Quality of Workshop`=="Strongly Disagree"|Data$`Quality of Workshop`=="Disagree")&(Data$`Will Recommend Workshop`=="Strongly Disagree"|Data$`Will Recommend Workshop`=="Disagree")&(Data$`Unhappy With Workshop Format`=="Strongly Disagree"|Data$`Unhappy With Workshop Format`=="Disagree")&(Data$`Did Not Learn Much`=="Strongly Disagree"|Data$`Did Not Learn Much`=="Disagree"))
temp4=which((Data$`Quality of Workshop`=="Strongly Agree"|Data$`Quality of Workshop`=="Agree")&(Data$`Will Recommend Workshop`=="Strongly Agree"|Data$`Will Recommend Workshop`=="Agree")&(Data$`Unhappy With Workshop Format`=="Strongly Agree"|Data$`Unhappy With Workshop Format`=="Agree")&(Data$`Did Not Learn Much`=="Strongly Agree"|Data$`Did Not Learn Much`=="Agree"))
re10 <- c(temp1,temp2,temp3,temp4)
rm(list=ls(pattern="temp"))

# 2.3) Removing R objects.
rm(list = setdiff(ls(),c("Data","re0","re10")))

#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 3) Finding frequencies of row entries containing inappropriate data.
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 3.1) Combining row entries with inappropriate data.
Temp <- c(re0,re10)

# 3.2) Obtaining frequencies.
Table <- table(Temp)


# 3.3) Row entries with frequency more than one.
`Row Entries` <- as.numeric(names(which(Table>1)))


# 3.4) Removing R objects which are not required.
rm(list=setdiff(ls(),c("Data","Row Entries","re0","re10")))

#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 4) Evaluating the obtained row entries and removing them if required.
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 4.1) Background details.
Data[`Row Entries`[`Row Entries`%in%re0],c(4,5,7,8,9,10,15,16)]
temp1 <- `Row Entries`[`Row Entries`%in%re0][c(1,2,4,7,8)]

# 4.2) Feedback on workshop.
Data[`Row Entries`[`Row Entries`%in%re10],c(57:59,61:62)]
temp2 <- `Row Entries`[`Row Entries`%in%re10][c(1,5)]

# 4.3) Removing row entries.
Data <- Data[-union(temp1,temp2),]

# 4.4) Removing all R objects except for the data frame "Data".
rm(list=setdiff(ls(),c("Data")))