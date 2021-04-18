# Reading Data from csv or xls
df <- read.csv("C:/Users/Aboli/Desktop/FOSSEE/Code/cleaned.csv")

df <- subset(df,select = -c(1))

length(colnames(df))



df_background <- subset(df,select = c(1,2,3,4,5,6,52,53,62,63,64))
df_spoken <- subset(df,select = c(7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,54,55,56,57,58,59,60,61))
df_live <- subset(df,select = c(28,29,30,31,32,33,34,35,36))
df_overall <- subset(df,select = c(37,38,39,40,41,42,43,44,45,46,47,48,49,50,51))


length(colnames(df_background)) 
length(colnames(df_spoken)) 
length(colnames(df_live)) 
length(colnames(df_overall)) 

View(df)
View(df_background)
View(df_spoken)
View(df_live)
View(df_overall)
