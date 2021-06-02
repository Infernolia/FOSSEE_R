
# Purpose of script: To conduct statistical tests to support the usability of data for exploratory factor analysis and perform exploratory factor analysis.

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 1) Part 1: Importing necessary libraries for analysis.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 1.1) The psych package is used for factor analysis.
# install.packages("psych")
library("psych")
# 1.2) The GPArotation package is used for performing Gradient Projection Algorithm (GPA)  Rotation for factor analysis.
# install.packages("GPArotation")
library("GPArotation")

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 2) Part 2: Loading the data for analysis.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 2.1) Reading all features of survey data from csv file processed in the earlier scripts.
# 2.2) User input is required at this step!
# 2.2.1) Plug in the dataframe which you want to load in Section 2. Use:
#  a.	df_all: For all original features
#  b.	df_spoken: For all spoken tutorial and assignment features.
#  c.	df_concepts For the before and after workshop concept specific features.
#  d.	df_overall: Overall background and workshop related features.
df1 <- df_spoken
# 2.3) Removing the extra column that gets added while reading data.
df1 <- subset(df1,select = -c(1))
# 2.4) Casting all the numeric data as numeric data type as this is required for EFA analysis.
df1 <- data.frame(apply(df1, 2, function(x) as.numeric(as.character(x))))

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 3) Part 3: Removing outliers from data as a part of exploratory factor analysis.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 3.1) Generating the Mahalnobis values for outlier detection.
mh_val = mahalanobis(df1, colMeans(df1, na.rm = T),cov(df1, use = "pairwise.complete.obs"))
# 3.2) Defining a cutoff score to remove outliers above this value.
cutoff = qchisq(1-.001, ncol(df1))
cutoff
# 3.3) Finding the number of outliers.
summary(mh_val < cutoff)
# 3.4) Removing outliers by creating a subset of values below cutoff score and saving the data.
noout = subset(df1, mh_val < cutoff)

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 4) Part 4: Performing the additivity test.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 4.1) Calculating correlation scores using Pearson correlation coefficient. Make sure that the input variables are not too correlated.
corr_df = cor(df1, use = "pairwise.complete.obs")
corr_df

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 5) Part 5: Running a fake regression analysis.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 5.1) Generating the values for fake regression, for fitting the data on.
random = rchisq(nrow(df1), 7) 
fake = lm(random~., data = df1)
standardized = rstudent(fake)
fitted = scale(fake$fitted.values)

# 5.2) Saving the statistical test plots in one image file for observation and analysis.
png("efa_stat_tests.png",width = 800, height = 400)
par(mfrow = c(1,3))

#5.3) Conducting the normality test. The residual errors are assumed to be normally distributed.
hist(standardized)


#5.4) Conducting the linearity test. The data should fit the line roughly.
myplot <-qqnorm(standardized)
abline(0,1)

#5.5) Conducting the homogeneity test. Goodness of fit shows homogeneity. Same plot also shows if data is clumped together. Horizontal line with equally spread points is a good indication of homoscedasticity.
myplot <- plot(fitted,standardized,main="Homogeneity Test")
abline(0,0)
abline(v = 0)
dev.off()
par(mfrow = c(1,1))

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 6) Part 6: Performing the prerequisite tests for EFA: Bartlett and KMO test.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 6.1) Running the Bartlett test on input data. p <0.05 indicates correlation adequacy.
correl = cor(df1, use = "pairwise.complete.obs")
cortest.bartlett(correl, n = nrow(df1))

# 6.2) Running the KMO test on input data. KMO MSA value should ideally be above 0.7 to determine if sample is large enough.
View(KMO(correl))

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 7) Part 7: Performing Scree plot and Kaiser Criterion  analysis to determine optimal number of factors for dataset.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 7.1) Generating Scree plot to observe and determine optimal number of factors by determining position of elbow in plot. Saving the plot in an image file.
png("efa_scree.png",width = 800, height = 400)
nofactors = fa.parallel(noout, fm="ml", fa="fa")
dev.off()
# 7.2) Running both old and new Kaiser Criterion tests for determining optimal number of factors.
# 7.2.1) Old Kaiser Criterion for determining optimal number of factors.
sum(nofactors$fa.values > 1.0)
# 7.2.2) New Kaiser Criterion for determining optimal number of factors.
sum(nofactors$fa.values > .7) 

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 8) Part 8: Factor analysis and diagram for cleaned and processed dataset.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# 8.1) User input is required at this step!
# 8.1.1) Enter the number of factors determined in Section 7 here in the factors_no variable.
factors_no <- 2
# 8.2) Running the factor analysis function with optimal number of factors, oblimin rotation and maximum likelihood model.
round1 = fa(noout, nfactors=factors_no, rotate = "oblimin", fm = "ml")
round1
# 8.3) Generating the factor analysis diagram with optimal number of factors, promax rotation and saving the diagram in png file.
png("efa_factor_diagram.png",width = 1200, height = 1200)
factanal(noout, factors = factors_no, rotation = "promax")
fa.diagram(round1)
dev.off()

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 9) Part 9: Clearing all the R objects created in this script from the environment, except for the dataframes.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 9.1) Removing all objects except dataframes.
rm(list=ls()[! ls() %in% c("df","df_all","df_spoken","df_concepts","df_overall")])