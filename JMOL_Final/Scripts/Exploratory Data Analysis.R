
# Purpose of script: To visualize the dataset in order to gather insights.

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
#1) Part 1: Importing necessary libraries for analysis.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 1.1) The ggplot2 library will be used for plotting figures and graphs.
# 1.2) The DataExplorer library will be used for exploring features of dataset.
# 1.3) The gridExtra library will be used for combining multiple figures in a grid.

#install.packages("ggplot2")
#install.packages("DataExplorer")
#install.packages("gridExtra")

library(ggplot2)
library(DataExplorer)
library(gridExtra)


#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 2) Part 2: Loading the necessary data files for the analysis.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 2.1) Reading data from previously cleaned file and storing in R dataframe object df. 
# Note: Ensure that the working directory is first set to the directory that contains the data file before running the R script.
df <- read.csv("data_efa_all.csv")
# 2.2) Removing the extra column that gets added while reading data.
df <- df[,-c(1)]
df <- data.frame(apply(df, 2, function(x) as.numeric(as.character(x))))
# 2.3) Setting the column names again as the names with spaces get converted to . while reading from csv in R.
colnames(df) <- c("Target Audience","Pre-Workshop Training","Already Using Modelling Software in Org","Used Jmol Before","Difficulty in Teaching/Learning Without 3D Viewer","Jmol Usefulness in Teaching/Learning","Jmol Difficulty for Teaching","3D Visualization Will Create Interest","Jmol Usefulness in Assessing Students","(Spoken Tutorial 1) Intro To Jmol Application","(Spoken Tutorial 2) Create and Edit Molecular Models","(Spoken Tutorial 3) Modify Display and View","(Spoken Tutorial 4) Measurements and Labeling","(Spoken Tutorial 5) Script Console and Script Commands","(Spoken Tutorial 6) Surfaces and Orbitals","(Spoken Tutorial 7) Crystal Structure and Unit Cell","(Assmt 1) Intro To Jmol Application","(Assmt 2) Create and Edit Molecular Models","(Assmt 3) Modify Display and View","(Assmt 4) Measurements and Labelling","(Assmt 5) Script Console and Script Commands","(Assmt 6) Surfaces and Orbitals","(Assmt 7) Crystal Structure and Unitcell","(Concept 1) Jmol 3D Modelling Knowledge Before Workshop","(Concept 1) Jmol 3D Modelling Knowledge After Workshop","(Concept 2) Jmol 3D Model Create Edit Knowledge Before Workshop","(Concept 2) Jmol 3D Model Create Edit Knowledge After Workshop","(Concept 3) Jmol Bond Measure Knowledge Before Workshop","(Concept 3) Jmol Bond Measure Knowledge After Workshop","(Concept 4) Jmol Orbital Create Knowledge Before Workshop","(Concept 4) Jmol Orbital Create Knowledge After Workshop","(Concept 5) Jmol Center of Axis Knowledge Before Workshop","(Concept 5) Jmol Center of Axis Knowledge After Workshop","(Concept 6) Jmol Point Groups Knowledge Before Workshop","(Concept 6) Jmol Point Groups Knowledge After Workshop","(Concept 7) Jmol Script Cmd 3D Model Knowledge Before Workshop","(Concept 7) Jmol Script Cmd 3D Model Knowledge After Workshop","(Concept 8) Jmol Crystal Display Knowledge Before Workshop","(Concept 8) Jmol Crystal Display Knowledge After Workshop","Quality Instructional Material","Self Learning Experience","Spoken Tutorial Forum Experience","Online Discussion Session Feedback","Interaction With Teaching Assistant Feedback","Quality of Workshop","Exposure To New Knowledge","Unhappy With Workshop Format","Willingness To Participate in Activities","Did Not Learn Much","Will Recommend Workshop")
# 2.4) Exploring the features like missing data and complete entries original dataframe.
png("eda_data.png",width = 1200, height = 1200)
plot_intro(df)
dev.off()

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 3) Part 3: Visualizing data distribution using histograms.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 3.1) Plotting the histograms of all columns in 3 separate image files in 4x4, 4x4 and 4x5 grids, to ensure readability of images.

png("eda_histogram_1.png",width = 1200, height = 1200)
par(mfrow = c(4,4))
for (col in 1:ncol(df[,c(1:16)])) {
  hist(df[,col],main = names(df[col]))
}
dev.off()

png("eda_histogram_2.png",width = 1200, height = 1200)
par(mfrow = c(4,4))
for (col in 1:ncol(df[,c(17:32)])) {
  hist(df[,col],main = names(df[col]))
}
dev.off()

png("eda_histogram_3.png",width = 1200, height = 1200)
par(mfrow = c(4,5))
for (col in 1:ncol(df[,c(33:50)])) {
  hist(df[,col],main = names(df[col]))
}
dev.off()

# Observations: As expected, all the data is purely categorical.

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 4) Part 4: Visualizing survey feedback for different knowledge level of participants before and after workshop.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 4.1) Plotting bar plots for each knowledge concept taught in the workshop, and storing all plots in one image file in a 4x4 grid.
png("eda_before_and_after.png",width = 1200, height = 1200)
par(mfrow = c(4,4))

barplot(table(df$`(Concept 1) Jmol 3D Modelling Knowledge Before Workshop`),
        main="Jmol 3D Modelling Knowledge",
        xlab="Knowledge Before Workshop",
        ylab="Count",
        border="blue",
        col="red",
        density=10
)

barplot(table(df$`(Concept 1) Jmol 3D Modelling Knowledge After Workshop`),
        main="Jmol 3D Modelling Knowledge",
        xlab="Knowledge After Workshop",
        ylab="Count",
        border="blue",
        col="darkgreen",
        density=10
)




barplot(table(df$`(Concept 2) Jmol 3D Model Create Edit Knowledge Before Workshop`),
        main="Jmol 3D Model Create Edit Knowledge",
        xlab="Knowledge Before Workshop",
        ylab="Count",
        border="blue",
        col="red",
        density=10
)

barplot(table(df$`(Concept 2) Jmol 3D Model Create Edit Knowledge After Workshop`),
        main="Jmol 3D Model Create Edit Knowledge",
        xlab="Knowledge After Workshop",
        ylab="Count",
        border="blue",
        col="darkgreen",
        density=10
)



barplot(table(df$`(Concept 3) Jmol Bond Measure Knowledge Before Workshop`),
        main="Jmol Bond Measure Knowledge",
        xlab="Knowledge Before Workshop",
        ylab="Count",
        border="blue",
        col="red",
        density=10
)

barplot(table(df$`(Concept 3) Jmol Bond Measure Knowledge After Workshop`),
        main="Jmol Bond Measure Knowledge",
        xlab="Knowledge After Workshop",
        ylab="Count",
        border="blue",
        col="darkgreen",
        density=10
)





barplot(table(df$`(Concept 4) Jmol Orbital Create Knowledge Before Workshop`),
        main="Jmol Orbital Create Knowledge",
        xlab="Knowledge Before Workshop",
        ylab="Count",
        border="blue",
        col="red",
        density=10
)

barplot(table(df$`(Concept 4) Jmol Orbital Create Knowledge After Workshop`),
        main="Jmol Orbital Create Knowledge",
        xlab="Knowledge After Workshop",
        ylab="Count",
        border="blue",
        col="darkgreen",
        density=10
)




barplot(table(df$`(Concept 5) Jmol Center of Axis Knowledge Before Workshop`),
        main="Jmol Center of Axis Knowledge",
        xlab="Knowledge Before Workshop",
        ylab="Count",
        border="blue",
        col="red",
        density=10
)

barplot(table(df$`(Concept 5) Jmol Center of Axis Knowledge After Workshop`),
        main="Jmol Center of Axis Knowledge",
        xlab="Knowledge After Workshop",
        ylab="Count",
        border="blue",
        col="darkgreen",
        density=10
)





barplot(table(df$`(Concept 6) Jmol Point Groups Knowledge Before Workshop`),
        main="Jmol Point Groups Knowledge",
        xlab="Knowledge Before Workshop",
        ylab="Count",
        border="blue",
        col="red",
        density=10
)

barplot(table(df$`(Concept 6) Jmol Point Groups Knowledge After Workshop`),
        main="Jmol Point Groups Knowledge",
        xlab="Knowledge After Workshop",
        ylab="Count",
        border="blue",
        col="darkgreen",
        density=10
)





barplot(table(df$`(Concept 7) Jmol Script Cmd 3D Model Knowledge Before Workshop`),
        main="Jmol Script Cmd 3D Model Knowledge",
        xlab="Knowledge Before Workshop",
        ylab="Count",
        border="blue",
        col="red",
        density=10
)

barplot(table(df$`(Concept 7) Jmol Script Cmd 3D Model Knowledge After Workshop`),
        main="Jmol Script Cmd 3D Model Knowledge",
        xlab="Knowledge After Workshop",
        ylab="Count",
        border="blue",
        col="darkgreen",
        density=10
)




barplot(table(df$`(Concept 8) Jmol Crystal Display Knowledge Before Workshop`),
        main="Jmol Crystal Display Knowledge",
        xlab="Knowledge Before Workshop",
        ylab="Count",
        border="blue",
        col="red",
        density=10
)

barplot(table(df$`(Concept 8) Jmol Crystal Display Knowledge After Workshop`),
        main="Jmol Crystal Display Knowledge",
        xlab="Knowledge After Workshop",
        ylab="Count",
        border="blue",
        col="darkgreen",
        density=10
)
dev.off()

par(mfrow = c(1, 1))

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 5) Part 5: Visualizing how the survey data differs in values based on background details.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 5.1) Plotting histograms for feedback answers with different colours representing different Target Audience. All images are saved in a 4x3 grid in an image file.

png("eda_background_based.png",width = 1200, height = 1200)

#5.1.1) The numerical values of the column need to be converted back to string labels for the plotting function to recognize.
df[df$`Target Audience`==1, "Target Audience"] <- "Student"
df[df$`Target Audience`==5, "Target Audience"] <- "Teacher"

p1 <- ggplot(df, aes(x=`Pre-Workshop Training`, fill=`Target Audience`)) +
  geom_histogram(bins = 6  )


p2 <- ggplot(df, aes(x=`Quality Instructional Material`, fill=`Target Audience`)) +
  geom_histogram(bins = 6 )

p3 <- ggplot(df, aes(x=`Self Learning Experience`, fill=`Target Audience`)) +
  geom_histogram(bins = 6  )

p4 <- ggplot(df, aes(x=`Spoken Tutorial Forum Experience`,fill=`Target Audience`)) +
  geom_histogram(bins = 6  )


p5 <- ggplot(df, aes(x=`Online Discussion Session Feedback`, fill=`Target Audience`)) +
  geom_histogram(bins = 6  )

p6 <- ggplot(df, aes(x=`Interaction With Teaching Assistant Feedback`, fill=`Target Audience`)) +
  geom_histogram(bins = 6  )

p7 <- ggplot(df, aes(x=`Quality of Workshop`, fill=`Target Audience`)) +
  geom_histogram(bins = 6  )


p8 <- ggplot(df, aes(x=`Exposure To New Knowledge`, fill=`Target Audience`)) +
  geom_histogram(bins = 6  )

p9 <- ggplot(df, aes(x=`Unhappy With Workshop Format`, fill=`Target Audience`)) +
  geom_histogram(bins = 6  )

p10 <- ggplot(df, aes(x=`Willingness To Participate in Activities`, fill=`Target Audience`)) +
  geom_histogram(bins = 6  )


p11 <- ggplot(df, aes(x=`Did Not Learn Much`, fill=`Target Audience`)) +
  geom_histogram(bins = 6  )

p12 <- ggplot(df, aes(x=`Will Recommend Workshop`, fill=`Target Audience`)) +
  geom_histogram(bins = 6  )

plist <- list(p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12)

grid.arrange(grobs = plist, ncol = 4, nrow = 3)

dev.off()


