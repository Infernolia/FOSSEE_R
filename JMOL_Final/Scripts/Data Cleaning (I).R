
# Purpose of script: To pinpoint the row entries in survey data that contain inconsistent/meaningless data.

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 1) Part 1: Checking the background details of participants for inconsistent entries.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 1.1) Identifying rows which have provided a use case of Jmol in spite of never having used Jmol before.
temp1 <- which(df$`Used Jmol Before`=="No")
temp2 <- which(!is.na(df$`Used Jmol Before (Purpose)`))
temp3 <- intersect(temp1,temp2)

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 2) Part 2:  Checking the feedback details for inconsistent entries.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 2.1) Declaring vectors for storing the row entry indices of inconsistent entries.
temp4 <- c();temp5 <- c();temp6 <- c();temp7 <- c();temp8 <- c();temp9 <- c();temp10 <- c();temp11 <- c(); temp13 = c(); temp14 = c();

# 2.2) Defining a function that converts level of knowledge to number. Ranges from (Unaware to Expert: 1 to 6).
fun <- function(x) {
  result <- 0
  if (x == "Unaware") { result <- 1 } else if (x == "Novice"){  result <- 2 } else if (x == "Amateur"){ result <- 3  }else if (x == "Competent"){   result <- 4 }else if (x == "Proficient"){   result <- 5  }else if (x == "Expert"){    result <- 6  }
  return(result)
}

# 2.3) Identifying the rows which showed reduced Jmol knowledge for different concepts after workshop than before.
for (i in 1:nrow(df))
{
  # 2.3.1) Subtracting knowledge after workshop from knowledge before workshop and checking for positive values.
  if(fun(df[i,"(Concept 1) Jmol 3D Modelling Knowledge Before Workshop"]) - fun(df[i,"(Concept 1) Jmol 3D Modelling Knowledge After Workshop"])>0){temp4<- c(temp4, i)};  if(fun(df[i,"(Concept 2) Jmol 3D Model Create Edit Knowledge Before Workshop"]) - fun(df[i,"(Concept 2) Jmol 3D Model Create Edit Knowledge After Workshop"])>0){temp5<- c(temp5, i)};  if(fun(df[i,"(Concept 3) Jmol Bond Measure Knowledge Before Workshop"]) - fun(df[i,"(Concept 3) Jmol Bond Measure Knowledge After Workshop"])>0){temp6<- c(temp6, i)};  if(fun(df[i,"(Concept 4) Jmol Orbital Create Knowledge Before Workshop"]) - fun(df[i,"(Concept 4) Jmol Orbital Create Knowledge After Workshop"])>0){temp7<- c(temp7, i)};  if(fun(df[i,"(Concept 5) Jmol Center of Axis Knowledge Before Workshop"]) - fun(df[i,"(Concept 5) Jmol Center of Axis Knowledge After Workshop"])>0){temp8<- c(temp8, i)};  if(fun(df[i,"(Concept 6) Jmol Point Groups Knowledge Before Workshop"]) - fun(df[i,"(Concept 6) Jmol Point Groups Knowledge After Workshop"])>0){temp9<- c(temp9, i)};  if(fun(df[i,"(Concept 7) Jmol Script Cmd 3D Model Knowledge Before Workshop"]) - fun(df[i,"(Concept 7) Jmol Script Cmd 3D Model Knowledge After Workshop"])>0){temp10<- c(temp10, i)};  if(fun(df[i,"(Concept 8) Jmol Crystal Display Knowledge Before Workshop"]) - fun(df[i,"(Concept 8) Jmol Crystal Display Knowledge After Workshop"])>0){temp11<- c(temp11, i)}
}

# temp12 is the collection of unique inconsistent rows identified in section 2.3.
temp12 <- union(union(union(union(union(union(union(temp4,temp5),temp6),temp7),temp8),temp9),temp10),temp11)

# 2.4) Defining a function that converts satisfaction level to number. Ranges from (Strongly Disagree or Extremely Bad to Strongly Agree or Excellent : 1 to 6).
fun1 <- function(x) { 
  result <- 0
  if (x == "Strongly Disagree" || x == "Extremely bad" ) { result <- 1 } else if (x == "Disagree" ||  x == "Bad"){  result <- 2 } else if (x == "Neither Disagree Nor Agree" ||  x == "Not sure"){ result <- 3  }else if (x == "Agree" ||  x == "Acceptable"){   result <- 4 }else if (x == "Strongly Agree" ||  x == "Good"){   result <- 5  }else if (x == "Not Applicable"){    result <- 1  } else if (  x == "Excellent") {result <- 6}
  return(result)
}
# 2.5) Identifying the rows which show positive and negative workshop feedback simultaneously.
for (i in 1:nrow(df))
{
  # 2.5.1) Selecting rows that responded positively to new knowledge acquired and no new knowledge simultaneously.
  if(fun1(df[i,"Exposure To New Knowledge"])>3 && fun1(df[i,"Did Not Learn Much"])>3)  {temp13<- c(temp13, i)}; 
  # 2.5.2) Selecting rows that responded negatively to new knowledge acquired and no new knowledge simultaneously.
  if(fun1(df[i,"Exposure To New Knowledge"])<3 && fun1(df[i,"Did Not Learn Much"])<3)  {temp13<- c(temp13, i)};
  # 2.5.3) Selecting rows that responded positively to negative and positive questions simultaneously.
  if(fun1(df[i,"Quality of Workshop"])>=3 && fun1(df[i,"Will Recommend Workshop"])>=3 && fun1(df[i,"Unhappy With Workshop Format"])>=3 && fun1(df[i,"Did Not Learn Much"])>=3)  {temp14<- c(temp14, i)};  if(fun1(df[i,"Quality of Workshop"])<3 && fun1(df[i,"Will Recommend Workshop"])<3 && fun1(df[i,"Unhappy With Workshop Format"])<3 && fun1(df[i,"Did Not Learn Much"])<3)  {temp14<- c(temp14, i)}
}

# temp15 is the collection of unique inconsistent rows identified in section 2.5.
temp15 <- union(temp13,temp14)

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 3) Part 3:  Collecting all the inconsistent rows found in this script together.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 3.1) Performing union to form the set of unique rows that are inconsistent or meaningless.
rowentries <- union(union(temp12,temp15),temp3)

# Observations: Total of 11 rows out of 63 were found to be inconsistent in the survey data.
