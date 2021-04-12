# Reading Data from csv or xls
df <- read.csv("C:/Users/Aboli/Desktop/FOSSEE/Code/Cleaned_data_2.csv")

#Removing the extra column added while reading and the id column
df <- subset(df, select = -c(1,2) )

#Pearson COrrelation
corrdf <- round(cor(subset(df, select = c(1,2,3,4,5,6,7,8,9,10,11) )),2)
View(corrdf)

png("after_binning.png")
myplot <- hist(df$Age)
print(myplot)
dev.off()
