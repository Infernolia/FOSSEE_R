#install.packages("descr")
library("descr")

# Reading Data from csv or xls
df <- read.csv("C:/Users/Aboli/Desktop/FOSSEE/Code/data.csv")

# Changing the column names to more relevant, shorter names
colnames(df) <- c("Name", 
                  "Institute", 
                  "Audience", 
                  "Age", 
                  "Background", 
                  "Other Background",                    
                  "Software other than R", 
                  "Other software from list", 
                  "other software not in list", 
                  "Use time of stat software", 
                  "Using R in institute",
                  "Purpose for R in institute",
                  "Other purpose for R in institute", 
                  "Reasons to learn R", 
                  "Other reasons to learn R",                  
                  "Pre training duration",
                  "Spoken tutorial well made",
                  "Spoken tutorial need improvement(R)",
                  "Spoken tutorial are unclear(R)",
                  "Learned a lot via spoken tutorial",              
                  "How to use setwd",
                  "How to use ggplot", 
                  "How to use ggplot aes",
                  "How to use dplyr",
                  "How to use pipe",
                  "How to use import",
                  "How to use rstudio",
                  "How to use rscript",
                  "How to use dataframe",
                  "How to use matrices",
                  "How to use manipulate",
                  "How to use hist and pie",
                  "How to use bar and scatter",
                  "How to use function of dplyr",
                  "Spoken tutorial useful for practice problem",
                  "practice problem improved r programming",
                  "Practice problem improved R explanation",
                  "Practice Problem difficult",    
                  "Experience with Pedagogy of workshop",
                  "Experience of learning basic stat1",
                  "Experience improved by textbook companion",
                  "Experience of learning basic stat2",
                  "Experience with animation in R",
                  "Experience with creating R markdown",
                  "Experience with modelling cancer",
                  "Experience with cluster and classification learning",
                  "Motivation to use classification and clustering",
                  "Quality of instruction",
                  "Quality of spoken tutorial",
                  "Interacting with FOSSEE team",
                  "Live session learning",
                  "Overall quality",
                  "Pace of Workshop",
                  "Helpful to know topic in advance",
                  "Overall exposure", 
                  "Did not learn much(R)",
                  "Recommend using R",
                  "Will recommend workshop for friend",
                  "Happy with format",
                  "Workshop was crowded(R)",
                  "Selective admission for less crowd(R)",
                  "Apply fee so the crowd decrease(R)",
                  "Knowledge before workshop",
                  "knowledge after workshop",
                  "Most liked aspect",
                  "Most disliked aspect(R)",
                  "Joined spoken tutorial forum",
                  "Posted Question on spoken tutorial forum",
                  "Answered question on spoken tutorial forum",
                  "Doubts already answered on spoken tutorial forum",
                  "Spoken tutorial forum useful after workshop",
                  "Spoken tutorial forum benefit all",
                  "Spoken tutorial forum helpful in conducting workshop",
                  "Spoken tutorial provide personal recognition",
                  "Will recommend spoken tutorial forum",
                  "like most about spoken tutorial forum",  
                  "Remote Team Help and Spoken Tutorial Forum Support",
                  "Spoken tutorial Forum support is enough",
                  "No help required from FOSSEE",
                  "Interesting activity", 
                  "Other Suggestion")

# Cleaning the age column

df$Age <- apply(as.data.frame(df$Age),1,function(x){substr(x, start = 1, stop = 2)})

#Number of unique rows
sum(!duplicated(df))

#Making the unique id
df$Id <- paste0("" , as.integer(rownames(df)))
df_text$Id <- paste0("" , as.integer(rownames(df_text)))



#Bringing Id as the first column
df <- df[,c(82,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81)]

#Now that we have IDed the survey participants we can remove the names to ensure privacy of participants
df <- subset(df, select = -c(2,3) )

#Cleaning the R_Workshop_Experience__Yes__Number_of_Days_Attended___No__0_days column
df$`Pre training duration` <- gsub("[^0-9.-]", "", df$`Pre training duration`)
df[df$`Pre training duration`=="2-4", "Pre training duration"] <- 3

#Let's separate the columns that have text based answers into a new dataframe called df_text and remove them from the original dataframe
df_text <- subset(df, select = c(4,5,7,8,9,11,12,13,14,36,64,65,69,75,79,80) )
df <- subset(df, select = -c(4,5,7,8,9,11,12,13,14,36,64,65,69,75,79,80) )



#Now we will only be working with the numerical data
#Note: Extensive analysis can include NLP for the text-based data ;)


#Section 1: Label Encoding
# Recode Profession label to numeric, student to 1 and faculty to 2
df$Audience <- ifelse(df$Audience=="Student", 1, 5)

# Recode Background__Statistical_Computation_Software___Yes_No_Other label to numeric, yes to 1 and no to 0
df$`Software other than R` <- ifelse(df$`Software other than R`=="Yes", 5, 1)

#Recoding Background__R___Yes_No_Other column which has 3 values: Yes 2, Not Sure 1, No 0
df[df$`Using R in institute`=="Yes", "Using R in institute"] <- 5
df[df$`Using R in institute`=="Not sure","Using R in institute"] <- 3
df[df$`Using R in institute`=="No", "Using R in institute"] <- 1

View(df)



#There are some columns which contain rating followed by unnecessary text. We will extract only numeric rating from it.
df$`How to use setwd` <- apply(as.data.frame(df$`How to use setwd`),1,function(x){substr(x, start = 1, stop = 1)})
df$`How to use ggplot` <- apply(as.data.frame(df$`How to use ggplot`),1,function(x){substr(x, start = 1, stop = 1)})
df$`How to use ggplot aes` <- apply(as.data.frame(df$`How to use ggplot aes`),1,function(x){substr(x, start = 1, stop = 1)})
df$`How to use dplyr` <- apply(as.data.frame(df$`How to use dplyr`),1,function(x){substr(x, start = 1, stop = 1)})
df$`How to use pipe` <- apply(as.data.frame(df$`How to use pipe`),1,function(x){substr(x, start = 1, stop = 1)})
df$`How to use import` <- apply(as.data.frame(df$`How to use import`),1,function(x){substr(x, start = 1, stop = 1)})
df$`How to use rstudio` <- apply(as.data.frame(df$`How to use rstudio`),1,function(x){substr(x, start = 1, stop = 1)})
df$`How to use rscript` <- apply(as.data.frame(df$`How to use rscript`),1,function(x){substr(x, start = 1, stop = 1)})
df$`How to use dataframe` <- apply(as.data.frame(df$`How to use dataframe`),1,function(x){substr(x, start = 1, stop = 1)})
df$`How to use matrices` <- apply(as.data.frame(df$`How to use matrices`),1,function(x){substr(x, start = 1, stop = 1)})
df$`How to use manipulate` <- apply(as.data.frame(df$`How to use manipulate`),1,function(x){substr(x, start = 1, stop = 1)})
df$`How to use hist and pie` <- apply(as.data.frame(df$`How to use hist and pie`),1,function(x){substr(x, start = 1, stop = 1)})
df$`How to use bar and scatter` <- apply(as.data.frame(df$`How to use bar and scatter`),1,function(x){substr(x, start = 1, stop = 1)})
df$`How to use function of dplyr` <- apply(as.data.frame(df$`How to use function of dplyr`),1,function(x){substr(x, start = 1, stop = 1)})





#Recoding Were_the_spoken_tutorials_used_during_the_workshop_helpful_in_solving_practice_problems___Yes_No_Somewhat column which has 3 values: Yes 2, Somewhat 1, No 0
df[df$`Spoken tutorial useful for practice problem`=="Yes", "Spoken tutorial useful for practice problem"] <- 5
df[df$`Spoken tutorial useful for practice problem`=="Somewhat", "Spoken tutorial useful for practice problem"] <- 3
df[df$`Spoken tutorial useful for practice problem`=="No", "Spoken tutorial useful for practice problem"] <- 1

#Recoding Did_the_practice_problem_help_you_to_improve_your_R_programming_skill___Yes_No_Somewhat column which has 3 values: Yes 2, Not Sure 1, No 0
df[df$`practice problem improved r programming`=="Yes", "practice problem improved r programming"] <- 5
df[df$`practice problem improved r programming`=="Not sure", "practice problem improved r programming"] <- 3
df[df$`practice problem improved r programming`=="No", "practice problem improved r programming"] <- 1


#Recoding Pace__Very_slow_slow_Acceptable_Fast_Very_Fast column into 3 values: 2 for Acceptable,  1 for Fast or Slow,  0 for Very Fast and Very Slow
df[df$`Pace of Workshop`=="Acceptable", "Pace of Workshop"] <- 5
df[df$`Pace of Workshop`=="Fast", "Pace of Workshop"] <- 3
df[df$`Pace of Workshop`=="Slow", "Pace of Workshop"] <- 3
df[df$`Pace of Workshop`=="Very fast", "Pace of Workshop"] <- 1
df[df$`Pace of Workshop`=="Very slow", "Pace of Workshop"] <- 1


#Recoding How_useful_it_was_to_know_the_topics_to_be_covered_in_the_workshop_in_advance___Not_at_all_useful_Somewhat_useful_Useful_Very_Useful_Extremely_Useful column as 1-5 for Totally Useless to Extremely Useful
df[df$`Helpful to know topic in advance`=="Not at all useful", "Helpful to know topic in advance"] <- 1
df[df$`Helpful to know topic in advance`=="Somewhat useful", "Helpful to know topic in advance"] <- 2
df[df$`Helpful to know topic in advance`=="Useful", "Helpful to know topic in advance"] <- 3
df[df$`Helpful to know topic in advance`=="Very useful", "Helpful to know topic in advance"] <- 4
df[df$`Helpful to know topic in advance`=="Extremely useful", "Helpful to know topic in advance"] <- 5







#Recoding the final Yes/No Questions
df$`Joined spoken tutorial forum` <- ifelse(df$`Joined spoken tutorial forum`=="Yes", 5, 1)
df$`Posted Question on spoken tutorial forum` <- ifelse(df$`Posted Question on spoken tutorial forum`=="Yes", 5, 1)
df$`Answered question on spoken tutorial forum` <- ifelse(df$`Answered question on spoken tutorial forum`=="Yes", 5, 1)



#Finding the number of missing values- As there are none, we will not impute
na_count <-sapply(df, function(y) sum(length(which(is.na(y)))))
na_count <- data.frame(na_count)
na_count

View(df)



#Reversing the order for all negative questions
df[df$`Spoken tutorial need improvement(R)`==5, "Spoken tutorial need improvement(R)"] <- 1
df[df$`Spoken tutorial need improvement(R)`==4, "Spoken tutorial need improvement(R)"] <- 2
df[df$`Spoken tutorial need improvement(R)`==3, "Spoken tutorial need improvement(R)"] <- 3
df[df$`Spoken tutorial need improvement(R)`==2, "Spoken tutorial need improvement(R)"] <- 4
df[df$`Spoken tutorial need improvement(R)`==1, "Spoken tutorial need improvement(R)"] <- 5

df[df$`Spoken tutorial are unclear(R)`==5, "Spoken tutorial are unclear(R)"] <- 1
df[df$`Spoken tutorial are unclear(R)`==4, "Spoken tutorial are unclear(R)"] <- 2
df[df$`Spoken tutorial are unclear(R)`==3, "Spoken tutorial are unclear(R)"] <- 3
df[df$`Spoken tutorial are unclear(R)`==2, "Spoken tutorial are unclear(R)"] <- 4
df[df$`Spoken tutorial are unclear(R)`==1, "Spoken tutorial are unclear(R)"] <- 5

df[df$`Did not learn much(R)`==5, "Did not learn much(R)"] <- 1
df[df$`Did not learn much(R)`==4, "Did not learn much(R)"] <- 2
df[df$`Did not learn much(R)`==3, "Did not learn much(R)"] <- 3
df[df$`Did not learn much(R)`==2, "Did not learn much(R)"] <- 4
df[df$`Did not learn much(R)`==1, "Did not learn much(R)"] <- 5

df[df$`Workshop was crowded(R)`==5, "Workshop was crowded(R)"] <- 1
df[df$`Workshop was crowded(R)`==4, "Workshop was crowded(R)"] <- 2
df[df$`Workshop was crowded(R)`==3, "Workshop was crowded(R)"] <- 3
df[df$`Workshop was crowded(R)`==2, "Workshop was crowded(R)"] <- 4
df[df$`Workshop was crowded(R)`==1, "Workshop was crowded(R)"] <- 5

df[df$`Selective admission for less crowd(R)`==5, "Selective admission for less crowd(R)"] <- 1
df[df$`Selective admission for less crowd(R)`==4, "Selective admission for less crowd(R)"] <- 2
df[df$`Selective admission for less crowd(R)`==3, "Selective admission for less crowd(R)"] <- 3
df[df$`Selective admission for less crowd(R)`==2, "Selective admission for less crowd(R)"] <- 4
df[df$`Selective admission for less crowd(R)`==1, "Selective admission for less crowd(R)"] <- 5

df[df$`Apply fee so the crowd decrease(R)`==5, "Apply fee so the crowd decrease(R)"] <- 1
df[df$`Apply fee so the crowd decrease(R)`==4, "Apply fee so the crowd decrease(R)"] <- 2
df[df$`Apply fee so the crowd decrease(R)`==3, "Apply fee so the crowd decrease(R)"] <- 3
df[df$`Apply fee so the crowd decrease(R)`==2, "Apply fee so the crowd decrease(R)"] <- 4
df[df$`Apply fee so the crowd decrease(R)`==1, "Apply fee so the crowd decrease(R)"] <- 5



#making it numeric
df <- data.frame(apply(df, 2, function(x) as.numeric(as.character(x))))


#As the minimum age is 17 and max is 52, we will bin this column to avoid scaling problems
df$Age[df$Age>10 & df$Age<20] <- 1
df$Age[df$Age>=20 & df$Age<30] <- 2
df$Age[df$Age>=30 & df$Age<40] <- 3
df$Age[df$Age>=40 & df$Age<50] <- 4
df$Age[df$Age>=50 & df$Age<60] <- 5

#Finding the datatype of each column of the dataset
sapply(df, class)

#Generating some basic statistics
descr(df)


# Viewing the cleaned dataframe
View(df)

# Viewing the text dataframe
View(df_text)


length(colnames(df))


length(colnames(df_text))


#finally lets save this cleaned dataframe in a csv file
write.csv(df,"C:/Users/Aboli/Desktop/FOSSEE/Code/cleaned.csv")
