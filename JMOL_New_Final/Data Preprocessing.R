
# Purpose of script: To process the cleaned dataset specifically for EFA.


#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 1) Part 1: Label encoding for conversion of strings to numeric data.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# Data labelling convention: Lower values represent bad feedback and higher values represent positive feedback, irrespective of the context and phrasing of the survey question.

# 1.1) Encoding `Target Audience` label to numeric, student to 1, teaching faculty and others to 5.
df$`Target Audience` <- ifelse(df$`Target Audience`=="Student", 1, 5)

# 1.2) Processing the `Pre-Workshop Training` column to convert number of days to level of training from 1 to 5.
df[df$`Pre-Workshop Training`=="Above 7 days", "Pre-Workshop Training"] <- "5"
df$`Pre-Workshop Training` <- gsub("[^0-9.-]", "", df$`Pre-Workshop Training`)
df[df$`Pre-Workshop Training`=="0", "Pre-Workshop Training"] <- "1"
df[df$`Pre-Workshop Training`=="1", "Pre-Workshop Training"] <- "2"
df[df$`Pre-Workshop Training`=="2-4", "Pre-Workshop Training"] <- "3"
df[df$`Pre-Workshop Training`=="5-7", "Pre-Workshop Training"] <- "4"

# 1.3) Processing the `Already Using Modelling Software in Org` column and setting the values Yes, Not Sure and No in the range 5 to 1.
df[df$`Already Using Modelling Software in Organization`=="Yes", "Already Using Modelling Software in Organization"] <- "5"
df[df$`Already Using Modelling Software in Organization`=="No", "Already Using Modelling Software in Organization"] <- "1"
df[df$`Already Using Modelling Software in Organization`=="Not Sure", "Already Using Modelling Software in Organization"] <- "3"

# 1.4) Processing the `Used Jmol Before` column and setting the values No and Yes to 1 and 5.
df[df$`Used Jmol Before`=="Yes", "Used Jmol Before"] <- "5"
df[df$`Used Jmol Before`=="No", "Used Jmol Before"] <- "1"

# 1.5) Processing the `Difficulty in Teaching/Learning Without 3D Viewer` column and setting the values Very Difficult to Very Easy in the range 5 to 1.
df[df$`Difficulty in Teaching/Learning Without 3D Viewer`=="Very difficult", "Difficulty in Teaching/Learning Without 3D Viewer"] <- "5"
df[df$`Difficulty in Teaching/Learning Without 3D Viewer`=="Difficult", "Difficulty in Teaching/Learning Without 3D Viewer"] <- "4"
df[df$`Difficulty in Teaching/Learning Without 3D Viewer`=="Easy", "Difficulty in Teaching/Learning Without 3D Viewer"] <- "2"
df[df$`Difficulty in Teaching/Learning Without 3D Viewer`=="Very Easy", "Difficulty in Teaching/Learning Without 3D Viewer"] <- "1"
df[df$`Difficulty in Teaching/Learning Without 3D Viewer`=="Not sure", "Difficulty in Teaching/Learning Without 3D Viewer"] <- "3"

# 1.6) Processing the `Jmol Usefulness in Teaching/Learning` column and setting the values Yes, May be and No in the range 5 to 1.
df[df$`Jmol Usefulness in Teaching/Learning`=="Yes", "Jmol Usefulness in Teaching/Learning"] <- "5"
df[df$`Jmol Usefulness in Teaching/Learning`=="No", "Jmol Usefulness in Teaching/Learning"] <- "1"
df[df$`Jmol Usefulness in Teaching/Learning`=="May be", "Jmol Usefulness in Teaching/Learning"] <- "3"

# 1.7) Processing the `Jmol Difficulty for Teaching` column and setting the values Very Difficult to Very Easy in the range 1 to 5.
df[df$`Jmol Difficulty for Teaching`=="Very difficult", "Jmol Difficulty for Teaching"] <- "1"
df[df$`Jmol Difficulty for Teaching`=="Difficult", "Jmol Difficulty for Teaching"] <- "2"
df[df$`Jmol Difficulty for Teaching`=="Easy", "Jmol Difficulty for Teaching"] <- "4"
df[df$`Jmol Difficulty for Teaching`=="Very Easy", "Jmol Difficulty for Teaching"] <- "5"
df[df$`Jmol Difficulty for Teaching`=="Not sure", "Jmol Difficulty for Teaching"] <- "3"

# 1.8) Processing the`3D Visualization Will Create Interest` column and setting the values Yes, May be and No in the range 5 to 1.
df[df$`3D Visualization Will Create Interest`=="Yes", "3D Visualization Will Create Interest"] <- "5"
df[df$`3D Visualization Will Create Interest`=="No", "3D Visualization Will Create Interest"] <- "1"
df[df$`3D Visualization Will Create Interest`=="May be", "3D Visualization Will Create Interest"] <- "3"

# 1.9) Processing the`Jmol Usefulness in Assessing Students` column  and setting the values Yes, May be and No in the range 5 to 1.
df[df$`Jmol Usefulness in Assessing Students`=="Yes", "Jmol Usefulness in Assessing Students"] <- "5"
df[df$`Jmol Usefulness in Assessing Students`=="No", "Jmol Usefulness in Assessing Students"] <- "1"
df[df$`Jmol Usefulness in Assessing Students`=="May be", "Jmol Usefulness in Assessing Students"] <- "3"


# 1.10) Cleaning the assignment based questions and setting the values Not Attempted to 3. The other values are already numeric in nature and need not be converted.
df[df$`(Assignment 1) Intro To Jmol Application`=="Not Attempted", "(Assignment 1) Intro To Jmol Application"] <- "3"
df[df$`(Assignment 2) Create and Edit Molecular Models`=="Not Attempted", "(Assignment 2) Create and Edit Molecular Models"] <- "3"
df[df$`(Assignment 3) Modify Display and View`=="Not Attempted", "(Assignment 3) Modify Display and View"] <- "3"
df[df$`(Assignment 4) Measurements and Labelling`=="Not Attempted", "(Assignment 4) Measurements and Labelling"] <- "3"
df[df$`(Assignment 5) Script Console and Script Commands`=="Not Attempted", "(Assignment 5) Script Console and Script Commands"] <- "3"
df[df$`(Assignment 6) Surfaces and Orbitals`=="Not Attempted", "(Assignment 6) Surfaces and Orbitals"] <- "3"
df[df$`(Assignment 7) Crystal Structure and Unit Cell`=="Not Attempted", "(Assignment 7) Crystal Structure and Unit Cell"] <- "3"

# 1.11) Cleaning the concept based questions and setting the values in the range Unaware to Expert to the range 1 to 6. 
df[df$`(Concept 1) Jmol 3D Modelling Knowledge Before Workshop`=="Unaware", "(Concept 1) Jmol 3D Modelling Knowledge Before Workshop"] <- "1"
df[df$`(Concept 1) Jmol 3D Modelling Knowledge Before Workshop`=="Novice", "(Concept 1) Jmol 3D Modelling Knowledge Before Workshop"] <- "2"
df[df$`(Concept 1) Jmol 3D Modelling Knowledge Before Workshop`=="Amateur", "(Concept 1) Jmol 3D Modelling Knowledge Before Workshop"] <- "3"
df[df$`(Concept 1) Jmol 3D Modelling Knowledge Before Workshop`=="Competent", "(Concept 1) Jmol 3D Modelling Knowledge Before Workshop"] <- "4"
df[df$`(Concept 1) Jmol 3D Modelling Knowledge Before Workshop`=="Proficient", "(Concept 1) Jmol 3D Modelling Knowledge Before Workshop"] <- "5"
df[df$`(Concept 1) Jmol 3D Modelling Knowledge Before Workshop`=="Expert", "(Concept 1) Jmol 3D Modelling Knowledge Before Workshop"] <- "6"

df[df$`(Concept 1) Jmol 3D Modelling Knowledge After Workshop`=="Unaware", "(Concept 1) Jmol 3D Modelling Knowledge After Workshop"] <- "1"
df[df$`(Concept 1) Jmol 3D Modelling Knowledge After Workshop`=="Novice", "(Concept 1) Jmol 3D Modelling Knowledge After Workshop"] <- "2"
df[df$`(Concept 1) Jmol 3D Modelling Knowledge After Workshop`=="Amateur", "(Concept 1) Jmol 3D Modelling Knowledge After Workshop"] <- "3"
df[df$`(Concept 1) Jmol 3D Modelling Knowledge After Workshop`=="Competent", "(Concept 1) Jmol 3D Modelling Knowledge After Workshop"] <- "4"
df[df$`(Concept 1) Jmol 3D Modelling Knowledge After Workshop`=="Proficient", "(Concept 1) Jmol 3D Modelling Knowledge After Workshop"] <- "5"
df[df$`(Concept 1) Jmol 3D Modelling Knowledge After Workshop`=="Expert", "(Concept 1) Jmol 3D Modelling Knowledge After Workshop"] <- "6"

df[df$`(Concept 2) Jmol 3D Model Create Edit Knowledge Before Workshop`=="Unaware", "(Concept 2) Jmol 3D Model Create Edit Knowledge Before Workshop"] <- "1"
df[df$`(Concept 2) Jmol 3D Model Create Edit Knowledge Before Workshop`=="Novice", "(Concept 2) Jmol 3D Model Create Edit Knowledge Before Workshop"] <- "2"
df[df$`(Concept 2) Jmol 3D Model Create Edit Knowledge Before Workshop`=="Amateur", "(Concept 2) Jmol 3D Model Create Edit Knowledge Before Workshop"] <- "3"
df[df$`(Concept 2) Jmol 3D Model Create Edit Knowledge Before Workshop`=="Competent", "(Concept 2) Jmol 3D Model Create Edit Knowledge Before Workshop"] <- "4"
df[df$`(Concept 2) Jmol 3D Model Create Edit Knowledge Before Workshop`=="Proficient", "(Concept 2) Jmol 3D Model Create Edit Knowledge Before Workshop"] <- "5"
df[df$`(Concept 2) Jmol 3D Model Create Edit Knowledge Before Workshop`=="Expert", "(Concept 2) Jmol 3D Model Create Edit Knowledge Before Workshop"] <- "6"

df[df$`(Concept 2) Jmol 3D Model Create Edit Knowledge After Workshop`=="Unaware", "(Concept 2) Jmol 3D Model Create Edit Knowledge After Workshop"] <- "1"
df[df$`(Concept 2) Jmol 3D Model Create Edit Knowledge After Workshop`=="Novice", "(Concept 2) Jmol 3D Model Create Edit Knowledge After Workshop"] <- "2"
df[df$`(Concept 2) Jmol 3D Model Create Edit Knowledge After Workshop`=="Amateur", "(Concept 2) Jmol 3D Model Create Edit Knowledge After Workshop"] <- "3"
df[df$`(Concept 2) Jmol 3D Model Create Edit Knowledge After Workshop`=="Competent", "(Concept 2) Jmol 3D Model Create Edit Knowledge After Workshop"] <- "4"
df[df$`(Concept 2) Jmol 3D Model Create Edit Knowledge After Workshop`=="Proficient", "(Concept 2) Jmol 3D Model Create Edit Knowledge After Workshop"] <- "5"
df[df$`(Concept 2) Jmol 3D Model Create Edit Knowledge After Workshop`=="Expert", "(Concept 2) Jmol 3D Model Create Edit Knowledge After Workshop"] <- "6"

df[df$`(Concept 3) Jmol Bond Measure Knowledge Before Workshop`=="Unaware", "(Concept 3) Jmol Bond Measure Knowledge Before Workshop"] <- "1"
df[df$`(Concept 3) Jmol Bond Measure Knowledge Before Workshop`=="Novice", "(Concept 3) Jmol Bond Measure Knowledge Before Workshop"] <- "2"
df[df$`(Concept 3) Jmol Bond Measure Knowledge Before Workshop`=="Amateur", "(Concept 3) Jmol Bond Measure Knowledge Before Workshop"] <- "3"
df[df$`(Concept 3) Jmol Bond Measure Knowledge Before Workshop`=="Competent", "(Concept 3) Jmol Bond Measure Knowledge Before Workshop"] <- "4"
df[df$`(Concept 3) Jmol Bond Measure Knowledge Before Workshop`=="Proficient", "(Concept 3) Jmol Bond Measure Knowledge Before Workshop"] <- "5"
df[df$`(Concept 3) Jmol Bond Measure Knowledge Before Workshop`=="Expert", "(Concept 3) Jmol Bond Measure Knowledge Before Workshop"] <- "6"

df[df$`(Concept 3) Jmol Bond Measure Knowledge After Workshop`=="Unaware", "(Concept 3) Jmol Bond Measure Knowledge After Workshop"] <- "1"
df[df$`(Concept 3) Jmol Bond Measure Knowledge After Workshop`=="Novice", "(Concept 3) Jmol Bond Measure Knowledge After Workshop"] <- "2"
df[df$`(Concept 3) Jmol Bond Measure Knowledge After Workshop`=="Amateur", "(Concept 3) Jmol Bond Measure Knowledge After Workshop"] <- "3"
df[df$`(Concept 3) Jmol Bond Measure Knowledge After Workshop`=="Competent", "(Concept 3) Jmol Bond Measure Knowledge After Workshop"] <- "4"
df[df$`(Concept 3) Jmol Bond Measure Knowledge After Workshop`=="Proficient", "(Concept 3) Jmol Bond Measure Knowledge After Workshop"] <- "5"
df[df$`(Concept 3) Jmol Bond Measure Knowledge After Workshop`=="Expert", "(Concept 3) Jmol Bond Measure Knowledge After Workshop"] <- "6"

df[df$`(Concept 4) Jmol Orbital Create Knowledge Before Workshop`=="Unaware", "(Concept 4) Jmol Orbital Create Knowledge Before Workshop"] <- "1"
df[df$`(Concept 4) Jmol Orbital Create Knowledge Before Workshop`=="Novice", "(Concept 4) Jmol Orbital Create Knowledge Before Workshop"] <- "2"
df[df$`(Concept 4) Jmol Orbital Create Knowledge Before Workshop`=="Amateur", "(Concept 4) Jmol Orbital Create Knowledge Before Workshop"] <- "3"
df[df$`(Concept 4) Jmol Orbital Create Knowledge Before Workshop`=="Competent", "(Concept 4) Jmol Orbital Create Knowledge Before Workshop"] <- "4"
df[df$`(Concept 4) Jmol Orbital Create Knowledge Before Workshop`=="Proficient", "(Concept 4) Jmol Orbital Create Knowledge Before Workshop"] <- "5"
df[df$`(Concept 4) Jmol Orbital Create Knowledge Before Workshop`=="Expert", "(Concept 4) Jmol Orbital Create Knowledge Before Workshop"] <- "6"

df[df$`(Concept 4) Jmol Orbital Create Knowledge After Workshop`=="Unaware", "(Concept 4) Jmol Orbital Create Knowledge After Workshop"] <- "1"
df[df$`(Concept 4) Jmol Orbital Create Knowledge After Workshop`=="Novice", "(Concept 4) Jmol Orbital Create Knowledge After Workshop"] <- "2"
df[df$`(Concept 4) Jmol Orbital Create Knowledge After Workshop`=="Amateur", "(Concept 4) Jmol Orbital Create Knowledge After Workshop"] <- "3"
df[df$`(Concept 4) Jmol Orbital Create Knowledge After Workshop`=="Competent", "(Concept 4) Jmol Orbital Create Knowledge After Workshop"] <- "4"
df[df$`(Concept 4) Jmol Orbital Create Knowledge After Workshop`=="Proficient", "(Concept 4) Jmol Orbital Create Knowledge After Workshop"] <- "5"
df[df$`(Concept 4) Jmol Orbital Create Knowledge After Workshop`=="Expert", "(Concept 4) Jmol Orbital Create Knowledge After Workshop"] <- "6"

df[df$`(Concept 5) Jmol Center of Axis Knowledge Before Workshop`=="Unaware", "(Concept 5) Jmol Center of Axis Knowledge Before Workshop"] <- "1"
df[df$`(Concept 5) Jmol Center of Axis Knowledge Before Workshop`=="Novice", "(Concept 5) Jmol Center of Axis Knowledge Before Workshop"] <- "2"
df[df$`(Concept 5) Jmol Center of Axis Knowledge Before Workshop`=="Amateur", "(Concept 5) Jmol Center of Axis Knowledge Before Workshop"] <- "3"
df[df$`(Concept 5) Jmol Center of Axis Knowledge Before Workshop`=="Competent", "(Concept 5) Jmol Center of Axis Knowledge Before Workshop"] <- "4"
df[df$`(Concept 5) Jmol Center of Axis Knowledge Before Workshop`=="Proficient", "(Concept 5) Jmol Center of Axis Knowledge Before Workshop"] <- "5"
df[df$`(Concept 5) Jmol Center of Axis Knowledge Before Workshop`=="Expert", "(Concept 5) Jmol Center of Axis Knowledge Before Workshop"] <- "6"

df[df$`(Concept 5) Jmol Center of Axis Knowledge After Workshop`=="Unaware", "(Concept 5) Jmol Center of Axis Knowledge After Workshop"] <- "1"
df[df$`(Concept 5) Jmol Center of Axis Knowledge After Workshop`=="Novice", "(Concept 5) Jmol Center of Axis Knowledge After Workshop"] <- "2"
df[df$`(Concept 5) Jmol Center of Axis Knowledge After Workshop`=="Amateur", "(Concept 5) Jmol Center of Axis Knowledge After Workshop"] <- "3"
df[df$`(Concept 5) Jmol Center of Axis Knowledge After Workshop`=="Competent", "(Concept 5) Jmol Center of Axis Knowledge After Workshop"] <- "4"
df[df$`(Concept 5) Jmol Center of Axis Knowledge After Workshop`=="Proficient", "(Concept 5) Jmol Center of Axis Knowledge After Workshop"] <- "5"
df[df$`(Concept 5) Jmol Center of Axis Knowledge After Workshop`=="Expert", "(Concept 5) Jmol Center of Axis Knowledge After Workshop"] <- "6"

df[df$`(Concept 6) Jmol Point Groups Knowledge Before Workshop`=="Unaware", "(Concept 6) Jmol Point Groups Knowledge Before Workshop"] <- "1"
df[df$`(Concept 6) Jmol Point Groups Knowledge Before Workshop`=="Novice", "(Concept 6) Jmol Point Groups Knowledge Before Workshop"] <- "2"
df[df$`(Concept 6) Jmol Point Groups Knowledge Before Workshop`=="Amateur", "(Concept 6) Jmol Point Groups Knowledge Before Workshop"] <- "3"
df[df$`(Concept 6) Jmol Point Groups Knowledge Before Workshop`=="Competent", "(Concept 6) Jmol Point Groups Knowledge Before Workshop"] <- "4"
df[df$`(Concept 6) Jmol Point Groups Knowledge Before Workshop`=="Proficient", "(Concept 6) Jmol Point Groups Knowledge Before Workshop"] <- "5"
df[df$`(Concept 6) Jmol Point Groups Knowledge Before Workshop`=="Expert", "(Concept 6) Jmol Point Groups Knowledge Before Workshop"] <- "6"

df[df$`(Concept 6) Jmol Point Groups Knowledge After Workshop`=="Unaware", "(Concept 6) Jmol Point Groups Knowledge After Workshop"] <- "1"
df[df$`(Concept 6) Jmol Point Groups Knowledge After Workshop`=="Novice", "(Concept 6) Jmol Point Groups Knowledge After Workshop"] <- "2"
df[df$`(Concept 6) Jmol Point Groups Knowledge After Workshop`=="Amateur", "(Concept 6) Jmol Point Groups Knowledge After Workshop"] <- "3"
df[df$`(Concept 6) Jmol Point Groups Knowledge After Workshop`=="Competent", "(Concept 6) Jmol Point Groups Knowledge After Workshop"] <- "4"
df[df$`(Concept 6) Jmol Point Groups Knowledge After Workshop`=="Proficient", "(Concept 6) Jmol Point Groups Knowledge After Workshop"] <- "5"
df[df$`(Concept 6) Jmol Point Groups Knowledge After Workshop`=="Expert", "(Concept 6) Jmol Point Groups Knowledge After Workshop"] <- "6"

df[df$`(Concept 7) Jmol Script CMD 3D Model Knowledge Before Workshop`=="Unaware", "(Concept 7) Jmol Script CMD 3D Model Knowledge Before Workshop"] <- "1"
df[df$`(Concept 7) Jmol Script CMD 3D Model Knowledge Before Workshop`=="Novice", "(Concept 7) Jmol Script CMD 3D Model Knowledge Before Workshop"] <- "2"
df[df$`(Concept 7) Jmol Script CMD 3D Model Knowledge Before Workshop`=="Amateur", "(Concept 7) Jmol Script CMD 3D Model Knowledge Before Workshop"] <- "3"
df[df$`(Concept 7) Jmol Script CMD 3D Model Knowledge Before Workshop`=="Competent", "(Concept 7) Jmol Script CMD 3D Model Knowledge Before Workshop"] <- "4"
df[df$`(Concept 7) Jmol Script CMD 3D Model Knowledge Before Workshop`=="Proficient", "(Concept 7) Jmol Script CMD 3D Model Knowledge Before Workshop"] <- "5"
df[df$`(Concept 7) Jmol Script CMD 3D Model Knowledge Before Workshop`=="Expert", "(Concept 7) Jmol Script CMD 3D Model Knowledge Before Workshop"] <- "6"

df[df$`(Concept 7) Jmol Script CMD 3D Model Knowledge After Workshop`=="Unaware", "(Concept 7) Jmol Script CMD 3D Model Knowledge After Workshop"] <- "1"
df[df$`(Concept 7) Jmol Script CMD 3D Model Knowledge After Workshop`=="Novice", "(Concept 7) Jmol Script CMD 3D Model Knowledge After Workshop"] <- "2"
df[df$`(Concept 7) Jmol Script CMD 3D Model Knowledge After Workshop`=="Amateur", "(Concept 7) Jmol Script CMD 3D Model Knowledge After Workshop"] <- "3"
df[df$`(Concept 7) Jmol Script CMD 3D Model Knowledge After Workshop`=="Competent", "(Concept 7) Jmol Script CMD 3D Model Knowledge After Workshop"] <- "4"
df[df$`(Concept 7) Jmol Script CMD 3D Model Knowledge After Workshop`=="Proficient", "(Concept 7) Jmol Script CMD 3D Model Knowledge After Workshop"] <- "5"
df[df$`(Concept 7) Jmol Script CMD 3D Model Knowledge After Workshop`=="Expert", "(Concept 7) Jmol Script CMD 3D Model Knowledge After Workshop"] <- "6"

df[df$`(Concept 8) Jmol Crystal Display Knowledge Before Workshop`=="Not Applicable", "(Concept 8) Jmol Crystal Display Knowledge Before Workshop"] <- "3"
df[df$`(Concept 8) Jmol Crystal Display Knowledge Before Workshop`=="Not at all Confident", "(Concept 8) Jmol Crystal Display Knowledge Before Workshop"] <- "2"
df[df$`(Concept 8) Jmol Crystal Display Knowledge Before Workshop`=="Slightly Confident", "(Concept 8) Jmol Crystal Display Knowledge Before Workshop"] <- "3"
df[df$`(Concept 8) Jmol Crystal Display Knowledge Before Workshop`=="Somewhat confident", "(Concept 8) Jmol Crystal Display Knowledge Before Workshop"] <- "4"
df[df$`(Concept 8) Jmol Crystal Display Knowledge Before Workshop`=="Confident", "(Concept 8) Jmol Crystal Display Knowledge Before Workshop"] <- "5"
df[df$`(Concept 8) Jmol Crystal Display Knowledge Before Workshop`=="Strongly Confident", "(Concept 8) Jmol Crystal Display Knowledge Before Workshop"] <- "6"

df[df$`(Concept 8) Jmol Crystal Display Knowledge After Workshop`=="Not Applicable", "(Concept 8) Jmol Crystal Display Knowledge After Workshop"] <- "3"
df[df$`(Concept 8) Jmol Crystal Display Knowledge After Workshop`=="Not at all Confident", "(Concept 8) Jmol Crystal Display Knowledge After Workshop"] <- "2"
df[df$`(Concept 8) Jmol Crystal Display Knowledge After Workshop`=="Slightly Confident", "(Concept 8) Jmol Crystal Display Knowledge After Workshop"] <- "3"
df[df$`(Concept 8) Jmol Crystal Display Knowledge After Workshop`=="Somewhat confident", "(Concept 8) Jmol Crystal Display Knowledge After Workshop"] <- "4"
df[df$`(Concept 8) Jmol Crystal Display Knowledge After Workshop`=="Confident", "(Concept 8) Jmol Crystal Display Knowledge After Workshop"] <- "5"
df[df$`(Concept 8) Jmol Crystal Display Knowledge After Workshop`=="Strongly Confident", "(Concept 8) Jmol Crystal Display Knowledge After Workshop"] <- "6"

# 1.12) Cleaning the positive workshop feedback based questions and setting the values in the range Extremely Bad to Excellent to the range 1 to 6. 
df[df$`Quality of Instructional Material`=="Extremely bad", "Quality of Instructional Material"] <- "1"
df[df$`Quality of Instructional Material`=="Bad", "Quality of Instructional Material"] <- "2"
df[df$`Quality of Instructional Material`=="Not sure", "Quality of Instructional Material"] <- "3"
df[df$`Quality of Instructional Material`=="Acceptable", "Quality of Instructional Material"] <- "4"
df[df$`Quality of Instructional Material`=="Good", "Quality of Instructional Material"] <- "5"
df[df$`Quality of Instructional Material`=="Excellent", "Quality of Instructional Material"] <- "6"

df[df$`Self Learning Experience`=="Extremely bad", "Self Learning Experience"] <- "1"
df[df$`Self Learning Experience`=="Bad", "Self Learning Experience"] <- "2"
df[df$`Self Learning Experience`=="Not sure", "Self Learning Experience"] <- "3"
df[df$`Self Learning Experience`=="Acceptable", "Self Learning Experience"] <- "4"
df[df$`Self Learning Experience`=="Good", "Self Learning Experience"] <- "5"
df[df$`Self Learning Experience`=="Excellent", "Self Learning Experience"] <- "6"

df[df$`Spoken Tutorial Forum Experience`=="Extremely bad", "Spoken Tutorial Forum Experience"] <- "1"
df[df$`Spoken Tutorial Forum Experience`=="Bad", "Spoken Tutorial Forum Experience"] <- "2"
df[df$`Spoken Tutorial Forum Experience`=="Not sure", "Spoken Tutorial Forum Experience"] <- "3"
df[df$`Spoken Tutorial Forum Experience`=="Acceptable", "Spoken Tutorial Forum Experience"] <- "4"
df[df$`Spoken Tutorial Forum Experience`=="Good", "Spoken Tutorial Forum Experience"] <- "5"
df[df$`Spoken Tutorial Forum Experience`=="Excellent", "Spoken Tutorial Forum Experience"] <- "6"

df[df$`Online Discussion Session (Feedback)`=="Extremely bad", "Online Discussion Session (Feedback)"] <- "1"
df[df$`Online Discussion Session (Feedback)`=="Bad", "Online Discussion Session (Feedback)"] <- "2"
df[df$`Online Discussion Session (Feedback)`=="Not sure", "Online Discussion Session (Feedback)"] <- "3"
df[df$`Online Discussion Session (Feedback)`=="Acceptable", "Online Discussion Session (Feedback)"] <- "4"
df[df$`Online Discussion Session (Feedback)`=="Good", "Online Discussion Session (Feedback)"] <- "5"
df[df$`Online Discussion Session (Feedback)`=="Excellent", "Online Discussion Session (Feedback)"] <- "6"

df[df$`Interaction with Teaching Assistant (Feedback)`=="Extremely bad", "Interaction with Teaching Assistant (Feedback)"] <- "1"
df[df$`Interaction with Teaching Assistant (Feedback)`=="Bad", "Interaction with Teaching Assistant (Feedback)"] <- "2"
df[df$`Interaction with Teaching Assistant (Feedback)`=="Not sure", "Interaction with Teaching Assistant (Feedback)"] <- "3"
df[df$`Interaction with Teaching Assistant (Feedback)`=="Acceptable", "Interaction with Teaching Assistant (Feedback)"] <- "4"
df[df$`Interaction with Teaching Assistant (Feedback)`=="Good", "Interaction with Teaching Assistant (Feedback)"] <- "5"
df[df$`Interaction with Teaching Assistant (Feedback)`=="Excellent", "Interaction with Teaching Assistant (Feedback)"] <- "6"


df[df$`Quality of Workshop`=="Extremely bad", "Quality of Workshop"] <- "1"
df[df$`Quality of Workshop`=="Bad", "Quality of Workshop"] <- "2"
df[df$`Quality of Workshop`=="Not sure", "Quality of Workshop"] <- "3"
df[df$`Quality of Workshop`=="Acceptable", "Quality of Workshop"] <- "4"
df[df$`Quality of Workshop`=="Good", "Quality of Workshop"] <- "5"
df[df$`Quality of Workshop`=="Excellent", "Quality of Workshop"] <- "6"

# 1.13) Cleaning the positive workshop feedback based questions and setting the values in the range Strongly Disagree to Strongly Agree to the range 1 to 5. 
df[df$`Exposure To New Knowledge`=="Strongly Disagree", "Exposure To New Knowledge"] <- "1"
df[df$`Exposure To New Knowledge`=="Disagree", "Exposure To New Knowledge"] <- "2"
df[df$`Exposure To New Knowledge`=="Neither Disagree Nor Agree", "Exposure To New Knowledge"] <- "3"
df[df$`Exposure To New Knowledge`=="Agree", "Exposure To New Knowledge"] <- "4"
df[df$`Exposure To New Knowledge`=="Strongly Agree", "Exposure To New Knowledge"] <- "5"
df[df$`Exposure To New Knowledge`=="Not Applicable", "Exposure To New Knowledge"] <- "1"

df[df$`Willingness To Participate in Activities`=="Strongly Disagree", "Willingness To Participate in Activities"] <- "1"
df[df$`Willingness To Participate in Activities`=="Disagree", "Willingness To Participate in Activities"] <- "2"
df[df$`Willingness To Participate in Activities`=="Neither Disagree Nor Agree", "Willingness To Participate in Activities"] <- "3"
df[df$`Willingness To Participate in Activities`=="Agree", "Willingness To Participate in Activities"] <- "4"
df[df$`Willingness To Participate in Activities`=="Strongly Agree", "Willingness To Participate in Activities"] <- "5"
df[df$`Willingness To Participate in Activities`=="Not Applicable", "Willingness To Participate in Activities"] <- "1"

df[df$`Will Recommend Workshop`=="Strongly Disagree", "Will Recommend Workshop"] <- "1"
df[df$`Will Recommend Workshop`=="Disagree", "Will Recommend Workshop"] <- "2"
df[df$`Will Recommend Workshop`=="Neither Disagree Nor Agree", "Will Recommend Workshop"] <- "3"
df[df$`Will Recommend Workshop`=="Agree", "Will Recommend Workshop"] <- "4"
df[df$`Will Recommend Workshop`=="Strongly Agree", "Will Recommend Workshop"] <- "5"
df[df$`Will Recommend Workshop`=="Not Applicable", "Will Recommend Workshop"] <- "1"

# 1.14) Cleaning the negative workshop feedback based questions and setting the values in the range Strongly Disagree to Strongly Agree to the range 5 to 1. 

df[df$`Did Not Learn Much`=="Strongly Disagree", "Did Not Learn Much"] <- "5"
df[df$`Did Not Learn Much`=="Disagree", "Did Not Learn Much"] <- "4"
df[df$`Did Not Learn Much`=="Neither Disagree Nor Agree", "Did Not Learn Much"] <- "3"
df[df$`Did Not Learn Much`=="Agree", "Did Not Learn Much"] <- "2"
df[df$`Did Not Learn Much`=="Strongly Agree", "Did Not Learn Much"] <- "1"
df[df$`Did Not Learn Much`=="Not Applicable", "Did Not Learn Much"] <- "1"

df[df$`Unhappy With Workshop Format`=="Strongly Disagree", "Unhappy With Workshop Format"] <- "5"
df[df$`Unhappy With Workshop Format`=="Disagree", "Unhappy With Workshop Format"] <- "4"
df[df$`Unhappy With Workshop Format`=="Neither Disagree Nor Agree", "Unhappy With Workshop Format"] <- "3"
df[df$`Unhappy With Workshop Format`=="Agree", "Unhappy With Workshop Format"] <- "2"
df[df$`Unhappy With Workshop Format`=="Strongly Agree", "Unhappy With Workshop Format"] <- "1"
df[df$`Unhappy With Workshop Format`=="Not Applicable", "Unhappy With Workshop Format"] <- "1"

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 2) Part 2: Making scale of all questions uniform.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 2.1) Reversing the scales of spoken tutorial questions to make 1 represent "extremely difficult to understand and follow" and 5 as "extremely easy to understand and follow" so that 1 represents bad feedback and 5 represents good feedback as specified in our data labelling convention.
df[df$`(Spoken Tutorial 1) Intro To Jmol Application`=="5", "(Spoken Tutorial 1) Intro To Jmol Application"] <- "1"
df[df$`(Spoken Tutorial 1) Intro To Jmol Application`=="4", "(Spoken Tutorial 1) Intro To Jmol Application"] <- "2"
df[df$`(Spoken Tutorial 1) Intro To Jmol Application`=="3", "(Spoken Tutorial 1) Intro To Jmol Application"] <- "3"
df[df$`(Spoken Tutorial 1) Intro To Jmol Application`=="2", "(Spoken Tutorial 1) Intro To Jmol Application"] <- "4"
df[df$`(Spoken Tutorial 1) Intro To Jmol Application`=="1", "(Spoken Tutorial 1) Intro To Jmol Application"] <- "5"
df[df$`(Spoken Tutorial 1) Intro To Jmol Application`=="Not Attempted", "(Spoken Tutorial 1) Intro To Jmol Application"] <- "3"
df[df$`(Spoken Tutorial 1) Intro To Jmol Application`=="Not Applicable", "(Spoken Tutorial 1) Intro To Jmol Application"] <- "3"

df[df$`(Spoken Tutorial 2) Create and Edit Molecular Models`=="5", "(Spoken Tutorial 2) Create and Edit Molecular Models"] <- "1"
df[df$`(Spoken Tutorial 2) Create and Edit Molecular Models`=="4", "(Spoken Tutorial 2) Create and Edit Molecular Models"] <- "2"
df[df$`(Spoken Tutorial 2) Create and Edit Molecular Models`=="3", "(Spoken Tutorial 2) Create and Edit Molecular Models"] <- "3"
df[df$`(Spoken Tutorial 2) Create and Edit Molecular Models`=="2", "(Spoken Tutorial 2) Create and Edit Molecular Models"] <- "4"
df[df$`(Spoken Tutorial 2) Create and Edit Molecular Models`=="1", "(Spoken Tutorial 2) Create and Edit Molecular Models"] <- "5"
df[df$`(Spoken Tutorial 2) Create and Edit Molecular Models`=="Not Attempted", "(Spoken Tutorial 2) Create and Edit Molecular Models"] <- "3"
df[df$`(Spoken Tutorial 2) Create and Edit Molecular Models`=="Not Applicable", "(Spoken Tutorial 2) Create and Edit Molecular Models"] <- "3"

df[df$`(Spoken Tutorial 3) Modify Display and View`=="5", "(Spoken Tutorial 3) Modify Display and View"] <- "1"
df[df$`(Spoken Tutorial 3) Modify Display and View`=="4", "(Spoken Tutorial 3) Modify Display and View"] <- "2"
df[df$`(Spoken Tutorial 3) Modify Display and View`=="3", "(Spoken Tutorial 3) Modify Display and View"] <- "3"
df[df$`(Spoken Tutorial 3) Modify Display and View`=="2", "(Spoken Tutorial 3) Modify Display and View"] <- "4"
df[df$`(Spoken Tutorial 3) Modify Display and View`=="1", "(Spoken Tutorial 3) Modify Display and View"] <- "5"
df[df$`(Spoken Tutorial 3) Modify Display and View`=="Not Attempted", "(Spoken Tutorial 3) Modify Display and View"] <- "3"
df[df$`(Spoken Tutorial 3) Modify Display and View`=="Not Applicable", "(Spoken Tutorial 3) Modify Display and View"] <- "3"

df[df$`(Spoken Tutorial 4) Measurements and Labeling`=="5", "(Spoken Tutorial 4) Measurements and Labeling"] <- "1"
df[df$`(Spoken Tutorial 4) Measurements and Labeling`=="4", "(Spoken Tutorial 4) Measurements and Labeling"] <- "2"
df[df$`(Spoken Tutorial 4) Measurements and Labeling`=="3", "(Spoken Tutorial 4) Measurements and Labeling"] <- "3"
df[df$`(Spoken Tutorial 4) Measurements and Labeling`=="2", "(Spoken Tutorial 4) Measurements and Labeling"] <- "4"
df[df$`(Spoken Tutorial 4) Measurements and Labeling`=="1", "(Spoken Tutorial 4) Measurements and Labeling"] <- "5"
df[df$`(Spoken Tutorial 4) Measurements and Labeling`=="Not Attempted", "(Spoken Tutorial 4) Measurements and Labeling"] <- "3"
df[df$`(Spoken Tutorial 4) Measurements and Labeling`=="Not Applicable", "(Spoken Tutorial 4) Measurements and Labeling"] <- "3"

df[df$`(Spoken Tutorial 5) Script Console and Script Commands`=="5", "(Spoken Tutorial 5) Script Console and Script Commands"] <- "1"
df[df$`(Spoken Tutorial 5) Script Console and Script Commands`=="4", "(Spoken Tutorial 5) Script Console and Script Commands"] <- "2"
df[df$`(Spoken Tutorial 5) Script Console and Script Commands`=="3", "(Spoken Tutorial 5) Script Console and Script Commands"] <- "3"
df[df$`(Spoken Tutorial 5) Script Console and Script Commands`=="2", "(Spoken Tutorial 5) Script Console and Script Commands"] <- "4"
df[df$`(Spoken Tutorial 5) Script Console and Script Commands`=="1", "(Spoken Tutorial 5) Script Console and Script Commands"] <- "5"
df[df$`(Spoken Tutorial 5) Script Console and Script Commands`=="Not Attempted", "(Spoken Tutorial 5) Script Console and Script Commands"] <- "3"
df[df$`(Spoken Tutorial 5) Script Console and Script Commands`=="Not Applicable", "(Spoken Tutorial 5) Script Console and Script Commands"] <- "3"

df[df$`(Spoken Tutorial 6) Surfaces and Orbitals`=="5", "(Spoken Tutorial 6) Surfaces and Orbitals"] <- "1"
df[df$`(Spoken Tutorial 6) Surfaces and Orbitals`=="4", "(Spoken Tutorial 6) Surfaces and Orbitals"] <- "2"
df[df$`(Spoken Tutorial 6) Surfaces and Orbitals`=="3", "(Spoken Tutorial 6) Surfaces and Orbitals"] <- "3"
df[df$`(Spoken Tutorial 6) Surfaces and Orbitals`=="2", "(Spoken Tutorial 6) Surfaces and Orbitals"] <- "4"
df[df$`(Spoken Tutorial 6) Surfaces and Orbitals`=="1", "(Spoken Tutorial 6) Surfaces and Orbitals"] <- "5"
df[df$`(Spoken Tutorial 6) Surfaces and Orbitals`=="Not Attempted", "(Spoken Tutorial 6) Surfaces and Orbitals"] <- "3"
df[df$`(Spoken Tutorial 6) Surfaces and Orbitals`=="Not Applicable", "(Spoken Tutorial 6) Surfaces and Orbitals"] <- "3"

df[df$`(Spoken Tutorial 7) Crystal Structure and Unit Cell`=="5", "(Spoken Tutorial 7) Crystal Structure and Unit Cell"] <- "1"
df[df$`(Spoken Tutorial 7) Crystal Structure and Unit Cell`=="4", "(Spoken Tutorial 7) Crystal Structure and Unit Cell"] <- "2"
df[df$`(Spoken Tutorial 7) Crystal Structure and Unit Cell`=="3", "(Spoken Tutorial 7) Crystal Structure and Unit Cell"] <- "3"
df[df$`(Spoken Tutorial 7) Crystal Structure and Unit Cell`=="2", "(Spoken Tutorial 7) Crystal Structure and Unit Cell"] <- "4"
df[df$`(Spoken Tutorial 7) Crystal Structure and Unit Cell`=="1", "(Spoken Tutorial 7) Crystal Structure and Unit Cell"] <- "5"
df[df$`(Spoken Tutorial 7) Crystal Structure and Unit Cell`=="Not Attempted", "(Spoken Tutorial 7) Crystal Structure and Unit Cell"] <- "3"
df[df$`(Spoken Tutorial 7) Crystal Structure and Unit Cell`=="Not Applicable", "(Spoken Tutorial 7) Crystal Structure and Unit Cell"] <- "3"

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 3) Part 3: Converting data type of all columns to uniform type.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 3.1) Casting all the numeric data as numeric data type as this is required for EFA analysis.
df <- data.frame(apply(df, 2, function(x) as.numeric(as.character(x))))

# 3.2) Resetting the column names as the type casting removes the new column names
colnames(df) <- c(    "Target Audience",  "Pre-Workshop Training",  "Already using Modelling Software in Organization",    "Used Jmol Before", "Difficulty in Teaching/Learning Without 3D Viewer","Jmol Usefulness in Teaching/Learning",  "Jmol Difficulty for Teaching",  "3D Visualization Will Create Interest",     "Jmol Usefulness in Assessing Students",    "(Spoken Tutorial 1) Intro To Jmol Application",  "(Spoken Tutorial 2) Create and Edit Molecular Models",  "(Spoken Tutorial 3) Modify Display and View",  "(Spoken Tutorial 4) Measurements and Labeling",  "(Spoken Tutorial 5) Script Console and Script Commands",  "(Spoken Tutorial 6) Surfaces and Orbitals",  "(Spoken Tutorial 7) Crystal Structure and Unit Cell",  "(Assignment 1) Intro To Jmol Application",  "(Assignment 2) Create and Edit Molecular Models",  "(Assignment 3) Modify Display and View",  "(Assignment 4) Measurements and Labelling",  "(Assignment 5) Script Console and Script Commands","(Assignment 6) Surfaces and Orbitals", "(Assignment 7) Crystal Structure and Unit Cell",  "(Concept 1) Jmol 3D Modelling Knowledge Before Workshop",  "(Concept 1) Jmol 3D Modelling Knowledge After Workshop",  "(Concept 2) Jmol 3D Model Create Edit Knowledge Before Workshop",  "(Concept 2) Jmol 3D Model Create Edit Knowledge After Workshop",  "(Concept 3) Jmol Bond Measure Knowledge Before Workshop",  "(Concept 3) Jmol Bond Measure Knowledge After Workshop",  "(Concept 4) Jmol Orbital Create Knowledge Before Workshop",  "(Concept 4) Jmol Orbital Create Knowledge After Workshop",  "(Concept 5) Jmol Center of Axis Knowledge Before Workshop",  "(Concept 5) Jmol Center of Axis Knowledge After Workshop",  "(Concept 6) Jmol Point Groups Knowledge Before Workshop",  "(Concept 6) Jmol Point Groups Knowledge After Workshop",  "(Concept 7) Jmol Script CMD 3D Model Knowledge Before Workshop",  "(Concept 7) Jmol Script CMD 3D Model Knowledge After Workshop",  "(Concept 8) Jmol Crystal Display Knowledge Before Workshop",  "(Concept 8) Jmol Crystal Display Knowledge After Workshop",  "Quality of Instructional Material",  "Self Learning Experience",  "Spoken Tutorial Forum Experience",  "Online Discussion Session (Feedback)",  "Interaction with Teaching Assistant (Feedback)",  "Quality of Workshop",  "Exposure To New Knowledge",  "Unhappy With Workshop Format",  "Willingness To Participate in Activities",  "Did Not Learn Much",  "Will Recommend Workshop")

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 4) Part 4: Grouping columns into meaningful groups for group-wise EFA.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 4.1) Grouping the data into 4 convenient chunks for processing: all columns, spoken tutorial and assignments related, concepts related and overall workshop feedback.
df_all <- df
df_spoken <- subset(df,select = c(10,11,12,13,14,15,16,17,18,19,20,21,22,23))
df_concepts <- subset(df,select = c(24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39))
df_overall <- subset(df,select = c(1,2,3,5,4,6,7,8,9,40,41,42,43,44,45,46,47,48,49,50))

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 5) Part 5: Clearing all the R objects created in this script from the environment, except for the dataframes needed in the next script.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 5.1) Removing all objects except dataframes.
rm(list=setdiff(ls(),c("df","df_all","df_spoken","df_concepts","df_overall")))


