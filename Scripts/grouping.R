# Reading Data from csv or xls
df <- read.csv("C:/Users/Aboli/Desktop/FOSSEE/Code/cleaned.csv")

df <- subset(df,select = -c(1))

length(colnames(df))



df_background <- subset(df,select = c(1,2,3,4,5,6,52))
df_spoken <- subset(df,select = c(7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,54,55,56,57,58,59,60,61))
df_live <- subset(df,select = c(28,29,30,31,32,33,34,35,36))
df_overall <- subset(df,select = c(37,38,39,40,41,42,43,44,45,46,47,48,49,50,51))
df_misc <- subset(df,select = c(52,53,62,63,64))

length(colnames(df_background)) 
length(colnames(df_spoken)) 
length(colnames(df_live)) 
length(colnames(df_overall)) 
length(colnames(df_misc))

View(df)
View(df_background)
View(df_spoken)
View(df_live)
View(df_overall)
View(df_misc)


#finally lets save the cleaned dataframes in a csv file
write.csv(df_background,"C:/Users/Aboli/Desktop/FOSSEE/Code/cleaned_background.csv")
write.csv(df_spoken,"C:/Users/Aboli/Desktop/FOSSEE/Code/cleaned_spoken.csv")
write.csv(df_live,"C:/Users/Aboli/Desktop/FOSSEE/Code/cleaned_live.csv")
write.csv(df_overall,"C:/Users/Aboli/Desktop/FOSSEE/Code/cleaned_overall.csv")
write.csv(df_misc,"C:/Users/Aboli/Desktop/FOSSEE/Code/cleaned_misc.csv")
