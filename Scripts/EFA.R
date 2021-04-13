#install.packages("psych")
library("psych")
#install.packages("GPArotation")
library("GPArotation")

# Reading Data from csv or xls
df <- read.csv("C:/Users/Aboli/Desktop/FOSSEE/Code/cleaned.csv")
df <- subset(df,select = -c(1,2))
df <- data.frame(apply(df, 2, function(x) as.numeric(as.character(x))))
length(colnames(df))
View(df)

#creating the mahalnobis values
mh_val = mahalanobis(df, colMeans(df, na.rm = T),cov(df, use = "pairwise.complete.obs"))

#cutoff score
cutoff = qchisq(1-.001, ncol(df))
cutoff

#Finding the number of outliers
summary(mh_val < cutoff)
#No outliers found as all true


#Additivity test
corr_df = cor(df, use = "pairwise.complete.obs")
corr_df

#Fake regression analysis
random = rchisq(nrow(df), 7) 
fake = lm(random~., data = df)
standardized = rstudent(fake)
fitted = scale(fake$fitted.values)

#normality
png("standardized.png")
myplot <- hist(standardized)
print(myplot)
dev.off()



#linearity
png("linearity.png")
myplot <-qqnorm(standardized)
abline(0,1)
print(myplot)
dev.off()


#homogeneity
png("homogeneity.png")
myplot <- plot(fitted,standardized)
abline(0,0)
abline(v = 0)
print(myplot)
dev.off()





#Bartlett test
correl = cor(df, use = "pairwise.complete.obs")
cortest.bartlett(correl, n = nrow(df))

#Value is 4719 and p < .001 so the correlations are valid


View(KMO(correl))


#MSA value is 0.3 and not adequate

nofactors = fa.parallel(subset(df,select = -c(1)), fm="ml", fa="fa")


#the scree  plot shows that we need 3 factors

#Kaiser criterion
sum(nofactors$fa.values > 1.0) ##old kaiser criterion
sum(nofactors$fa.values > .7) ##new kaiser criterion

colnames(df) <- c("a1","a2","a3","a4","a5","a6","a7","a8","a9","a10","a11","a12","a13","a14","a15","a16","a17","a18","a19","a20","a21","a22","a23","a24","a25","a26","a27","a28","a29","a30","a31","a32","a33","a34","a35","a36","a37","a38","a39","a40","a41","a42","a43","a44","a45","a46","a47","a48","a49","a50","a51","a52","a53","a54","a55","a56","a57","a58","a59","a60","a61","a62","a63")



round1 = fa(df, nfactors=3, rotate = "oblimin", fm = "ml")
round1

factanal(df, factors = 3, rotation = "promax")

fa.diagram(round1)
