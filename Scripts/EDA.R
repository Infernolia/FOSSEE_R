# Reading Data from csv or xls
df <- read.csv("C:/Users/Aboli/Desktop/FOSSEE/Code/cleaned.csv")
df_background <- read.csv("C:/Users/Aboli/Desktop/FOSSEE/Code/cleaned_background.csv")
df_spoken <- read.csv("C:/Users/Aboli/Desktop/FOSSEE/Code/cleaned_spoken.csv")
df_live <- read.csv("C:/Users/Aboli/Desktop/FOSSEE/Code/cleaned_live.csv")
df_overall <- read.csv("C:/Users/Aboli/Desktop/FOSSEE/Code/cleaned_overall.csv")
df_misc <- read.csv("C:/Users/Aboli/Desktop/FOSSEE/Code/cleaned_misc.csv")

#Removing the extra column added while reading and the id column
df <- subset(df, select = -c(1,2) )
df_background <- subset(df_background, select = -c(1) )
df_live <- subset(df_live, select = -c(1) )
df_misc <- subset(df_misc, select = -c(1) )
df_overall <- subset(df_overall, select = -c(1) )
df_spoken <- subset(df_spoken, select = -c(1) )

#Pearson COrrelation
corrdf <- round(cor(df),2)
View(corrdf)

#Checking the distribution of ages across the dataset  after binning the age column

png("age_after_binning.png")
myplot <- hist(df$Age)
print(myplot)
dev.off()

#Comparing knowledge of users before and after workshop
png("knowledge_before_workshop.png")
myplot1 <-hist(df_misc$Level_of_R_knowledge__Before_Workshop___Rating___1_5__Beginner_Expert)
print(myplot1)
dev.off()

png("knowledge_after_workshop.png")
myplot2 <-hist(df_misc$Level_of_R_knowledge__After_Workshop___Rating___1_5__Beginner_Expert)
print(myplot2)
dev.off()



#Trying to find outliers in the data
png(file = "knowledge_outliers.png")
# Plot the chart.
boxplot(Level_of_R_knowledge__Before_Workshop___Rating___1_5__Beginner_Expert~ Age, data = df_background, xlab = "Age",
        ylab = "Before Workshop Knowledge", main = "Background Analysis")
# Save the file.
dev.off()
