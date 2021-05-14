#-------------------------------------------------------------------------------------------------------------#
#1) Part 1: Importing necessary libraries
#-------------------------------------------------------------------------------------------------------------#

#install.packages("psych")
library("psych")
#install.packages("GPArotation")
library("GPArotation")

#-------------------------------------------------------------------------------------------------------------#
#2) Part 2: Loading data
#-------------------------------------------------------------------------------------------------------------#

# Reading Data from csv or xls
setwd("C:/Users/Aboli/Desktop/tmp/FOSSEE/Code/jmol")
df <- read.csv("data_all.csv")
df <- subset(df,select = -c(1))
df <- data.frame(apply(df, 2, function(x) as.numeric(as.character(x))))

#-------------------------------------------------------------------------------------------------------------#
#3) Part 3: Removing Outliers
#-------------------------------------------------------------------------------------------------------------#

#creating the mahalnobis values
mh_val = mahalanobis(df, colMeans(df, na.rm = T),cov(df, use = "pairwise.complete.obs"))

#cutoff score
cutoff = qchisq(1-.001, ncol(df))
cutoff

#Finding the number of outliers
summary(mh_val < cutoff)
#No outliers found as all true

noout = subset(df, mh_val < cutoff)

#-------------------------------------------------------------------------------------------------------------#
#4) Part 4: Additivity test
#-------------------------------------------------------------------------------------------------------------#

corr_df = cor(df, use = "pairwise.complete.obs")
corr_df

#-------------------------------------------------------------------------------------------------------------#
#5) Part 5: Fake regression analysis
#-------------------------------------------------------------------------------------------------------------#

random = rchisq(nrow(df), 7) 
fake = lm(random~., data = df)
standardized = rstudent(fake)
fitted = scale(fake$fitted.values)

#normality test
png("standardized.png")
myplot <- hist(standardized)
print(myplot)
dev.off()

#linearity test
png("linearity.png")
myplot <-qqnorm(standardized)
abline(0,1)
print(myplot)
dev.off()

#homogeneity test
png("homogeneity.png")
myplot <- plot(fitted,standardized)
abline(0,0)
abline(v = 0)
print(myplot)
dev.off()

#-------------------------------------------------------------------------------------------------------------#
#6) Part 6: Prerequisites for EFA: Bartlett and KMO test
#-------------------------------------------------------------------------------------------------------------#

#Bartlett test
correl = cor(df, use = "pairwise.complete.obs")
cortest.bartlett(correl, n = nrow(df))

#KMO test
View(KMO(correl))

#-------------------------------------------------------------------------------------------------------------#
#7) Part 7: Scree Plot and Kaiser Criterion to determine number of factors
#-------------------------------------------------------------------------------------------------------------#

#Scree Plot
nofactors = fa.parallel(noout, fm="ml", fa="fa")

#Kaiser criterion
sum(nofactors$fa.values > 1.0) ##old kaiser criterion
sum(nofactors$fa.values > .7) ##new kaiser criterion

#-------------------------------------------------------------------------------------------------------------#
#8) Part 8: Factor analysis and diagram
#-------------------------------------------------------------------------------------------------------------#

round1 = fa(noout, nfactors=2, rotate = "oblimin", fm = "ml")
round1
factanal(noout, factors = 2, rotation = "promax")
fa.diagram(round1)
