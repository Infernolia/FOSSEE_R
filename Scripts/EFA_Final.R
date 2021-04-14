#install.packages("psych")
library("psych")
#install.packages("GPArotation")
library("GPArotation")

# Reading Data from csv or xls
df <- read.csv("C:/Users/Aboli/Desktop/FOSSEE/Code/cleaned_misc.csv")
df <- subset(df,select = -c(1))
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

noout = subset(df, mh_val < cutoff)

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

nofactors = fa.parallel(noout, fm="ml", fa="fa")


#the scree  plot shows that we need 3 factors

#Kaiser criterion
sum(nofactors$fa.values > 1.0) ##old kaiser criterion
sum(nofactors$fa.values > .7) ##new kaiser criterion

i <- 1
t <- c()

while(i<=length(colnames(noout)))
{
  
  t <- c(t,paste("a_",as.character(i),separator=""))
  i <- i + 1
}

colnames(noout) <- t


round1 = fa(noout, nfactors=2, rotate = "oblimin", fm = "ml")
round1

factanal(noout, factors = 2, rotation = "promax")

fa.diagram(round1)
