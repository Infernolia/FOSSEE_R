#install.packages("descr")
library("descr")

# Reading Data from csv or xls
df <- read.csv("C:/Users/Aboli/Desktop/FOSSEE/Code/data.csv")

# Changing the column names to more relevant, shorter names
colnames(df) <- c("Name",
                  "Institute",
                  "Profession",
                  "Age",
                  "Background",
                  "Background__Other",
                  "Background__Statistical_Computation_Software___Yes_No_Other",
                  "Background__Statistical_Computation_Software____Yes_Name_of_Software___No__Never_used_before",
                  "Background__Statistical_Computation_Software___Other___Reason_",
                  "Background__Statistical_Computation_Software____Yes__Duration___No__Never_used_before",
                  "Background__R___Yes_No_Other",
                  "Background__R___Yes__Purpose___No__NAN",
                  "Background__R___Other___Reason",
                  "Motivation_For_Learning_R",
                  "Motivation_For_Learning_R__Other",
                  "R_Workshop_Experience__Yes__Number_of_Days_Attended___No__0_days",
                  "Spoken_Tutorial_To_Learn_R__Rating___Statment___Tutorials_are_well_made_and_self__explanatory___1_5__Strongly_Disagree_to_Strongly_Agree",
                  "Spoken_Tutorial_To_Learn_R__Rating___Statment___Tutorials_need_improvement__1_5__Strongly_Disagree_to_Strongly_Agree",
                  "Spoken_Tutorial_To_Learn_R__Rating___Statment___Various_aspects_are_unclear_and_need_further_explanation__1_5__Strongly_Disagree_to_Strongly_Agree",
                  "Spoken_Tutorial_To_Learn_R__Rating___Statment___I_learnt_a_lot_using_spoken_Tutorials__1_5__Strongly_Disagree_to_Strongly_Agree",
                  "The_tutorials_were_useful_in_learning_the_following_concepts.__Rating___Concept__How_to_set_working_directories_in_RStudio___1_5__Totally_Useless_to_Extremely_Useful",
                  "The_tutorials_were_useful_in_learning_the_following_concepts.__Rating___Concept__How_to_use_ggplot2_package_for_data_visualization__1_5__Totally_Useless_to_Extremely_Useful",
                  "The_tutorials_were_useful_in_learning_the_following_concepts.__Rating___Concept__How_to_use_Aesthetic_Mapping_in_ggplot2__1_5__Totally_Useless_to_Extremely_Useful",
                  "The_tutorials_were_useful_in_learning_the_following_concepts.__Rating___Concept__Data_Manipulation_using_dplyr_Package__1_5__Totally_Useless_to_Extremely_Useful",
                  "The_tutorials_were_useful_in_learning_the_following_concepts.__Rating___Concept__Use_of_Pipe_Operator__1_5__Totally_Useless_to_Extremely_Useful",
                  "The_tutorials_were_useful_in_learning_the_following_concepts.__Rating___Concept__How_to_Merge_and_Import_data__1_5__Totally_Useless_to_Extremely_Useful",
                  "The_tutorials_were_useful_in_learning_the_following_concepts.__Rating___Concept__Introduction_to_RStudio___1_5__Totally_Useless_to_Extremely_Useful",
                  "The_tutorials_were_useful_in_learning_the_following_concepts.__Rating___Concept__Introduction_to_R_Script__1_5__Totally_Useless_to_Extremely_Useful",
                  "The_tutorials_were_useful_in_learning_the_following_concepts.__Rating___Concept__How_to_create_data_frames_in_R__1_5__Totally_Useless_to_Extremely_Useful",
                  "The_tutorials_were_useful_in_learning_the_following_concepts.__Rating___Concept__Creating_Matrices_using_Data_Frames__1_5__Totally_Useless_to_Extremely_Useful",
                  "The_tutorials_were_useful_in_learning_the_following_concepts.__Rating___Concept__Operations_on_Matrices_and_Data_Frames__1_5__Totally_Useless_to_Extremely_Useful",
                  "The_tutorials_were_useful_in_learning_the_following_concepts.__Rating___Concept__Plotting_Histograms_and_Pie_Chart___1_5__Totally_Useless_to_Extremely_Useful",
                  "The_tutorials_were_useful_in_learning_the_following_concepts.__Rating___Concept__Plotting_Bar_Charts_and_Scatter_Plot__1_5__Totally_Useless_to_Extremely_Useful",
                  "The_tutorials_were_useful_in_learning_the__following_concepts.__Rating___Concept__More__Functions_in_dplyr_Package__1_5__Totally_Useless_to_Extremely_Useful",
                  "Were_the_spoken_tutorials_used_during_the_workshop_helpful_in_solving_practice_problems___Yes_No_Somewhat",
                  "Did_the_practice_problem_help_you_to_improve_your_R_programming_skill___Yes_No_Somewhat",
                  "Did_the_practice_problem_help_you_to_improve_your_R_programming_skill___Reason",
                  "Difficulty_of_Practice_Problems__Rating___1_5__Difficult_Easy",
                  "How_would_you_rate_your_experience_of_live_sessions___Rating___Session__Pedagogy_in_the_conduct_of_this_workshop___1_5__Totally_Useless_Extremely_Useful",
                  "How_would_you_rate_your_experience_of_live_sessions___Rating___Session__Basic_Statistics_in_R__part_I___1_5__Totally_Useless_Extremely_Useful",
                  "How_would_you_rate_your_experience_of_live_sessions___Rating___Session__R_Textbook_Companion___1_5__Totally_Useless_Extremely_Useful",
                  "How_would_you_rate_your_experience_of_live_sessions___Rating___Session__Basic_Statistics_in_R__part_II___1_5__Totally_Useless_Extremely_Useful",
                  "How_would_you_rate_your_experience_of_live_sessions___Rating___Session__Animation_in_R___1_5__Totally_Useless_Extremely_Useful",
                  "How_would_you_rate_your_experience_of_live_sessions___Rating___Session__Creating_Rmarkdown_file_in_R___1_5__Totally_Useless_Extremely_Useful",
                  "How_would_you_rate_your_experience_of_live_sessions___Rating___Session__Modelling_survival_in_prostate_cancer_using_pathology_images_and_R___1_5__Totally_Useless_Extremely_Useful",
                  "How_would_you_rate_your_experience_of_live_sessions___Rating___Session__Get_an_exposure_to_clustering_and_classification___1_5__Totally_Useless_Extremely_Useful",
                  "How_would_you_rate_your_experience_of_live_sessions___Rating___Session__Motivation_to_classification_and_clustering___1_5__Totally_Useless_Extremely_Useful",
                  "Rate_the_following_aspects_of_the_workshop__Rating___Aspect__Quality_of_instructional_material_presented_to_you___1_5__Extremely_Bad_Excellent",
                  "Rate_the_following_aspects_of_the_workshop__Rating___Aspect__Learning_through_Spoken_Tutorials___1_5__Extremely_Bad_Excellent",
                  "Rate_the_following_aspects_of_the_workshop__Rating___Aspect__Interaction_with_the_R_FOSSEE_team___1_5__Extremely_Bad_Excellent",
                  "Rate_the_following_aspects_of_the_workshop__Rating___Aspect__Learning_through_live_sessions___1_5__Extremely_Bad_Excellent",
                  "Rate_the_following_aspects_of_the_workshop__Rating___Aspect__Overall_quality_of_the_online_workshop___1_5__Extremely_Bad_Excellent",
                  "Pace__Very_slow_slow_Acceptable_Fast_Very_Fast",
                  "How_useful_it_was_to_know_the_topics_to_be_covered_in_the_workshop_in_advance___Not_at_all_useful_Somewhat_useful_Useful_Very_Useful_Extremely_Useful",
                  "Overall_View_Of_Workshop__Rating___Statement__The_workshop_exposed_me_to_new_knowledge_and_practices___1_5__Strongly_Disagree_Strongly_Agree",
                  "Overall_View_Of_Workshop__Rating___Statement__I_did_not_learn_much_from_this_workshop___1_5__Strongly_Disagree_Strongly_Agree_",
                  "Overall_View_Of_Workshop__Rating___Statement__I_will_recommend_my_friends_and_colleagues_to_use_R___1_5__Strongly_Disagree_Strongly_Agree",
                  "Overall_View_Of_Workshop__Rating___Statement__I_will_recommend_my_friends_and_colleagues_to_attend_similar_workshops___1_5__Strongly_Disagree_Strongly_Agree",
                  "Format_of_Workshop__Rating___Statement__I_am_happy_with_the_format_of_this_workshop___1_5__Strongly_Disagree_Strongly_Agree",
                  "Format_of_Workshop__Rating___Statement__There_were_too_many_participants___1_5__Strongly_Disagree_Strongly_Agree",
                  "Format_of_Workshop__Rating___Statement__Even_if_some_people_will_be_denied_admission_it_is_better_to_have_less_number_of_participants_in_the_workshop___1_5__Strongly_Disagree_Strongly_Agree",
                  "Format_of_Workshop__Rating___Statement__Given_that_this_project_has_to_work_for_self_sufficiency_it_is_better_to_charge_a_larger_fee_and_conduct_workshop_with_smaller_number_of_students___1_5__Strongly_Disagree_Strongly_Agree",
                  "Level_of_R_knowledge__Before_Workshop___Rating___1_5__Beginner_Expert",
                  "Level_of_R_knowledge__After_Workshop___Rating___1_5__Beginner_Expert",
                  "What_aspect_s__about_the_workshop_did_you_like_the_most",
                  "What_aspect_s__about_the_workshop_did_you_dislike_the_most",
                  "Did_you_register_yourself_on_the_Spoken_Tutorial_Forums_as_asked_in_the_guideline_email_sent_before_the_workshop___Yes_No",
                  "Did_you_post_questions_on_the_Spoken_Tutorial_Forum_during_the_workshop___Yes_No",
                  "Did_you_answer_anybodys_questions_on_the_Spoken_Tutorial_Forum_during_the_workshop___Yes_No",
                  "Were_your_doubts_already_answered_in_the_Spoken_Tutorial_Forum___Yes_No",
                  "Spoken_Tutorial_Forum_Response__Rating___Statement__Discussion_on_the_ST_Forum_will_be_useful_even_after_the_workshop____1_5__Strongly_Disagree__Strongly_Agree",
                  "Spoken_Tutorial_Forum_Response__Rating___Statement__Answers_on_the_ST_Forum_will_be_available_also_to_those_who_do_not_attend_this_workshop___1_5__Strongly_Disagree__Strongly_Agree",
                  "Spoken_Tutorial_Forum_Response__Rating___Statement__Forum_based_support_by_the_FOSSEE_team_will_be_useful_if_you_decide_to_conduct_a_workshop_using_Spoken_Tutorials___1_5__Strongly_Disagree__Strongly_Agree",
                  "Spoken_Tutorial_Forum_Response__Rating___Statement__Your_answers_on_the_ST_Forum_will_provide_recognition_of_your_capabilities___1_5__Strongly_Disagree__Strongly_Agree",
                  "Spoken_Tutorial_Forum_Response__Rating___Statement__I_will_recommend_my_friends_and_colleagues_to_use_the_Spoken_Tutorial_Forum___1_5__Strongly_Disagree__Strongly_Agree",
                  "What_aspect_s__about_the_ST_Forum_did_you_like_the_most",
                  "We_have_provided_you_R_Spoken_Tutorials_and_many_other_learning_materials_in_this_workshop._What_else_is_required_for_you_to_conduct_a_similar_workshop_in_your_institution_by_yourself____Rating___Statement___a__Remote_help_of_a_FOSSEE_expert__b__Spoken_Tutorial_Forum_support___1_5__Strongly_Disagree__Strongly_Agree",
                  "We_have_provided_you_R_Spoken_Tutorials_and_many_other_learning_materials_in_this_workshop._What_else_is_required_for_you_to_conduct_a_similar_workshop_in_your_institution_by_yourself____Rating___Statement__Spoken_Tutorial_Forum_support_alone_is_enough____1_5__Strongly_Disagree__Strongly_Agree",
                  "We_have_provided_you_R_Spoken_Tutorials_and_many_other_learning_materials_in_this_workshop._What_else_is_required_for_you_to_conduct_a_similar_workshop_in_your_institution_by_yourself____Rating___Statement__I_dont_need_any_other_help___1_5__Strongly_Disagree__Strongly_Agree",
                  "Activities_of_FOSSEE_R_Team_Participated_In",
                  "Suggestions_For_Improvement")

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
df$R_Workshop_Experience__Yes__Number_of_Days_Attended___No__0_days <- gsub("[^0-9.-]", "", df$R_Workshop_Experience__Yes__Number_of_Days_Attended___No__0_days)
df[df$R_Workshop_Experience__Yes__Number_of_Days_Attended___No__0_days=="2-4", "R_Workshop_Experience__Yes__Number_of_Days_Attended___No__0_days"] <- 3
  
#Let's separate the columns that have text based answers into a new dataframe called df_text and remove them from the original dataframe
df_text <- subset(df, select = c(4,5,7,8,9,11,12,13,14,36,64,65,69,75,79,80) )
df <- subset(df, select = -c(4,5,7,8,9,11,12,13,14,36,64,65,69,75,79,80) )




#Now we will only be working with the numerical data
#Note: Extensive analysis can include NLP for the text-based data ;)


#Section 1: Label Encoding
# Recode Profession label to numeric, student to 1 and faculty to 2
df$Profession <- ifelse(df$Profession=="Student", 1, 2)

# Recode Background__Statistical_Computation_Software___Yes_No_Other label to numeric, yes to 1 and no to 0
df$Background__Statistical_Computation_Software___Yes_No_Other <- ifelse(df$Background__Statistical_Computation_Software___Yes_No_Other=="Yes", 1, 0)

#Recoding Background__R___Yes_No_Other column which has 3 values: Yes 2, Not Sure 1, No 0
df[df$Background__R___Yes_No_Other=="Yes", "Background__R___Yes_No_Other"] <- 2
df[df$Background__R___Yes_No_Other=="Not sure", "Background__R___Yes_No_Other"] <- 1
df[df$Background__R___Yes_No_Other=="No", "Background__R___Yes_No_Other"] <- 0

#There are some columns which contain rating followed by unnecessary text. We will extract only numeric rating from it.
df$The_tutorials_were_useful_in_learning_the_following_concepts.__Rating___Concept__How_to_set_working_directories_in_RStudio___1_5__Totally_Useless_to_Extremely_Useful <- apply(as.data.frame(df$The_tutorials_were_useful_in_learning_the_following_concepts.__Rating___Concept__How_to_set_working_directories_in_RStudio___1_5__Totally_Useless_to_Extremely_Useful),1,function(x){substr(x, start = 1, stop = 1)})
df$The_tutorials_were_useful_in_learning_the_following_concepts.__Rating___Concept__How_to_use_ggplot2_package_for_data_visualization__1_5__Totally_Useless_to_Extremely_Useful <- apply(as.data.frame(df$The_tutorials_were_useful_in_learning_the_following_concepts.__Rating___Concept__How_to_use_ggplot2_package_for_data_visualization__1_5__Totally_Useless_to_Extremely_Useful),1,function(x){substr(x, start = 1, stop = 1)})
df$The_tutorials_were_useful_in_learning_the_following_concepts.__Rating___Concept__How_to_use_Aesthetic_Mapping_in_ggplot2__1_5__Totally_Useless_to_Extremely_Useful <- apply(as.data.frame(df$The_tutorials_were_useful_in_learning_the_following_concepts.__Rating___Concept__How_to_use_Aesthetic_Mapping_in_ggplot2__1_5__Totally_Useless_to_Extremely_Useful),1,function(x){substr(x, start = 1, stop = 1)})
df$The_tutorials_were_useful_in_learning_the_following_concepts.__Rating___Concept__Data_Manipulation_using_dplyr_Package__1_5__Totally_Useless_to_Extremely_Useful <- apply(as.data.frame(df$The_tutorials_were_useful_in_learning_the_following_concepts.__Rating___Concept__Data_Manipulation_using_dplyr_Package__1_5__Totally_Useless_to_Extremely_Useful),1,function(x){substr(x, start = 1, stop = 1)})
df$The_tutorials_were_useful_in_learning_the_following_concepts.__Rating___Concept__Use_of_Pipe_Operator__1_5__Totally_Useless_to_Extremely_Useful <- apply(as.data.frame(df$The_tutorials_were_useful_in_learning_the_following_concepts.__Rating___Concept__Use_of_Pipe_Operator__1_5__Totally_Useless_to_Extremely_Useful),1,function(x){substr(x, start = 1, stop = 1)})
df$The_tutorials_were_useful_in_learning_the_following_concepts.__Rating___Concept__How_to_Merge_and_Import_data__1_5__Totally_Useless_to_Extremely_Useful <- apply(as.data.frame(df$The_tutorials_were_useful_in_learning_the_following_concepts.__Rating___Concept__How_to_Merge_and_Import_data__1_5__Totally_Useless_to_Extremely_Useful),1,function(x){substr(x, start = 1, stop = 1)})
df$The_tutorials_were_useful_in_learning_the_following_concepts.__Rating___Concept__Introduction_to_RStudio___1_5__Totally_Useless_to_Extremely_Useful <- apply(as.data.frame(df$The_tutorials_were_useful_in_learning_the_following_concepts.__Rating___Concept__Introduction_to_RStudio___1_5__Totally_Useless_to_Extremely_Useful),1,function(x){substr(x, start = 1, stop = 1)})
df$The_tutorials_were_useful_in_learning_the_following_concepts.__Rating___Concept__Introduction_to_R_Script__1_5__Totally_Useless_to_Extremely_Useful <- apply(as.data.frame(df$The_tutorials_were_useful_in_learning_the_following_concepts.__Rating___Concept__Introduction_to_R_Script__1_5__Totally_Useless_to_Extremely_Useful),1,function(x){substr(x, start = 1, stop = 1)})
df$The_tutorials_were_useful_in_learning_the_following_concepts.__Rating___Concept__How_to_create_data_frames_in_R__1_5__Totally_Useless_to_Extremely_Useful <- apply(as.data.frame(df$The_tutorials_were_useful_in_learning_the_following_concepts.__Rating___Concept__How_to_create_data_frames_in_R__1_5__Totally_Useless_to_Extremely_Useful),1,function(x){substr(x, start = 1, stop = 1)})
df$The_tutorials_were_useful_in_learning_the_following_concepts.__Rating___Concept__Creating_Matrices_using_Data_Frames__1_5__Totally_Useless_to_Extremely_Useful <- apply(as.data.frame(df$The_tutorials_were_useful_in_learning_the_following_concepts.__Rating___Concept__Creating_Matrices_using_Data_Frames__1_5__Totally_Useless_to_Extremely_Useful),1,function(x){substr(x, start = 1, stop = 1)})
df$The_tutorials_were_useful_in_learning_the_following_concepts.__Rating___Concept__Operations_on_Matrices_and_Data_Frames__1_5__Totally_Useless_to_Extremely_Useful <- apply(as.data.frame(df$The_tutorials_were_useful_in_learning_the_following_concepts.__Rating___Concept__Operations_on_Matrices_and_Data_Frames__1_5__Totally_Useless_to_Extremely_Useful),1,function(x){substr(x, start = 1, stop = 1)})
df$The_tutorials_were_useful_in_learning_the_following_concepts.__Rating___Concept__Plotting_Histograms_and_Pie_Chart___1_5__Totally_Useless_to_Extremely_Useful <- apply(as.data.frame(df$The_tutorials_were_useful_in_learning_the_following_concepts.__Rating___Concept__Plotting_Histograms_and_Pie_Chart___1_5__Totally_Useless_to_Extremely_Useful),1,function(x){substr(x, start = 1, stop = 1)})
df$The_tutorials_were_useful_in_learning_the_following_concepts.__Rating___Concept__Plotting_Bar_Charts_and_Scatter_Plot__1_5__Totally_Useless_to_Extremely_Useful <- apply(as.data.frame(df$The_tutorials_were_useful_in_learning_the_following_concepts.__Rating___Concept__Plotting_Bar_Charts_and_Scatter_Plot__1_5__Totally_Useless_to_Extremely_Useful),1,function(x){substr(x, start = 1, stop = 1)})
df$The_tutorials_were_useful_in_learning_the__following_concepts.__Rating___Concept__More__Functions_in_dplyr_Package__1_5__Totally_Useless_to_Extremely_Useful <- apply(as.data.frame(df$The_tutorials_were_useful_in_learning_the__following_concepts.__Rating___Concept__More__Functions_in_dplyr_Package__1_5__Totally_Useless_to_Extremely_Useful),1,function(x){substr(x, start = 1, stop = 1)})

#Recoding Were_the_spoken_tutorials_used_during_the_workshop_helpful_in_solving_practice_problems___Yes_No_Somewhat column which has 3 values: Yes 2, Somewhat 1, No 0
df[df$Were_the_spoken_tutorials_used_during_the_workshop_helpful_in_solving_practice_problems___Yes_No_Somewhat=="Yes", "Were_the_spoken_tutorials_used_during_the_workshop_helpful_in_solving_practice_problems___Yes_No_Somewhat"] <- 2
df[df$Were_the_spoken_tutorials_used_during_the_workshop_helpful_in_solving_practice_problems___Yes_No_Somewhat=="Somewhat", "Were_the_spoken_tutorials_used_during_the_workshop_helpful_in_solving_practice_problems___Yes_No_Somewhat"] <- 1
df[df$Were_the_spoken_tutorials_used_during_the_workshop_helpful_in_solving_practice_problems___Yes_No_Somewhat=="No", "Were_the_spoken_tutorials_used_during_the_workshop_helpful_in_solving_practice_problems___Yes_No_Somewhat"] <- 0

#Recoding Did_the_practice_problem_help_you_to_improve_your_R_programming_skill___Yes_No_Somewhat column which has 3 values: Yes 2, Not Sure 1, No 0
df[df$Did_the_practice_problem_help_you_to_improve_your_R_programming_skill___Yes_No_Somewhat=="Yes", "Did_the_practice_problem_help_you_to_improve_your_R_programming_skill___Yes_No_Somewhat"] <- 2
df[df$Did_the_practice_problem_help_you_to_improve_your_R_programming_skill___Yes_No_Somewhat=="Not sure", "Did_the_practice_problem_help_you_to_improve_your_R_programming_skill___Yes_No_Somewhat"] <- 1
df[df$Did_the_practice_problem_help_you_to_improve_your_R_programming_skill___Yes_No_Somewhat=="No", "Did_the_practice_problem_help_you_to_improve_your_R_programming_skill___Yes_No_Somewhat"] <- 0


#Recoding Pace__Very_slow_slow_Acceptable_Fast_Very_Fast column into 3 values: 2 for Acceptable,  1 for Fast or Slow,  0 for Very Fast and Very Slow
df[df$Pace__Very_slow_slow_Acceptable_Fast_Very_Fast=="Acceptable", "Pace__Very_slow_slow_Acceptable_Fast_Very_Fast"] <- 2
df[df$Pace__Very_slow_slow_Acceptable_Fast_Very_Fast=="Fast", "Pace__Very_slow_slow_Acceptable_Fast_Very_Fast"] <- 1
df[df$Pace__Very_slow_slow_Acceptable_Fast_Very_Fast=="Slow", "Pace__Very_slow_slow_Acceptable_Fast_Very_Fast"] <- 1
df[df$Pace__Very_slow_slow_Acceptable_Fast_Very_Fast=="Very fast", "Pace__Very_slow_slow_Acceptable_Fast_Very_Fast"] <- 0
df[df$Pace__Very_slow_slow_Acceptable_Fast_Very_Fast=="Very slow", "Pace__Very_slow_slow_Acceptable_Fast_Very_Fast"] <- 0


#Recoding How_useful_it_was_to_know_the_topics_to_be_covered_in_the_workshop_in_advance___Not_at_all_useful_Somewhat_useful_Useful_Very_Useful_Extremely_Useful column as 1-5 for Totally Useless to Extremely Useful
df[df$How_useful_it_was_to_know_the_topics_to_be_covered_in_the_workshop_in_advance___Not_at_all_useful_Somewhat_useful_Useful_Very_Useful_Extremely_Useful=="Not at all useful", "How_useful_it_was_to_know_the_topics_to_be_covered_in_the_workshop_in_advance___Not_at_all_useful_Somewhat_useful_Useful_Very_Useful_Extremely_Useful"] <- 1
df[df$How_useful_it_was_to_know_the_topics_to_be_covered_in_the_workshop_in_advance___Not_at_all_useful_Somewhat_useful_Useful_Very_Useful_Extremely_Useful=="Somewhat useful", "How_useful_it_was_to_know_the_topics_to_be_covered_in_the_workshop_in_advance___Not_at_all_useful_Somewhat_useful_Useful_Very_Useful_Extremely_Useful"] <- 2
df[df$How_useful_it_was_to_know_the_topics_to_be_covered_in_the_workshop_in_advance___Not_at_all_useful_Somewhat_useful_Useful_Very_Useful_Extremely_Useful=="Useful", "How_useful_it_was_to_know_the_topics_to_be_covered_in_the_workshop_in_advance___Not_at_all_useful_Somewhat_useful_Useful_Very_Useful_Extremely_Useful"] <- 3
df[df$How_useful_it_was_to_know_the_topics_to_be_covered_in_the_workshop_in_advance___Not_at_all_useful_Somewhat_useful_Useful_Very_Useful_Extremely_Useful=="Very useful", "How_useful_it_was_to_know_the_topics_to_be_covered_in_the_workshop_in_advance___Not_at_all_useful_Somewhat_useful_Useful_Very_Useful_Extremely_Useful"] <- 4
df[df$How_useful_it_was_to_know_the_topics_to_be_covered_in_the_workshop_in_advance___Not_at_all_useful_Somewhat_useful_Useful_Very_Useful_Extremely_Useful=="Extremely useful", "How_useful_it_was_to_know_the_topics_to_be_covered_in_the_workshop_in_advance___Not_at_all_useful_Somewhat_useful_Useful_Very_Useful_Extremely_Useful"] <- 5

#Recoding the final Yes/No Questions
df$Did_you_register_yourself_on_the_Spoken_Tutorial_Forums_as_asked_in_the_guideline_email_sent_before_the_workshop___Yes_No <- ifelse(df$Did_you_register_yourself_on_the_Spoken_Tutorial_Forums_as_asked_in_the_guideline_email_sent_before_the_workshop___Yes_No=="Yes", 1, 0)
df$Did_you_post_questions_on_the_Spoken_Tutorial_Forum_during_the_workshop___Yes_No <- ifelse(df$Did_you_post_questions_on_the_Spoken_Tutorial_Forum_during_the_workshop___Yes_No=="Yes", 1, 0)
df$Did_you_answer_anybodys_questions_on_the_Spoken_Tutorial_Forum_during_the_workshop___Yes_No <- ifelse(df$Did_you_answer_anybodys_questions_on_the_Spoken_Tutorial_Forum_during_the_workshop___Yes_No=="Yes", 1, 0)


#descr(df)

#Finding the number of missing values- As there are none, we will not impute
na_count <-sapply(df, function(y) sum(length(which(is.na(y)))))
na_count <- data.frame(na_count)
na_count



df <- data.frame(apply(df, 2, function(x) as.numeric(as.character(x))))

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

write.csv(df,"C:/Users/Aboli/Desktop/FOSSEE/Code/Cleaned_data_1.csv")
write.csv(df_text,"C:/Users/Aboli/Desktop/FOSSEE/Code/Cleaned_data_text_1.csv")

