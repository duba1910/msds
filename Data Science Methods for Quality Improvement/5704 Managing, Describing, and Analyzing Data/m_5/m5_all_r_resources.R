require(lolcat)
ro<-round.object
nqtr<-function(x,d){noquote(t(round.object(x, d)))}
CapPull2 <- read.table( "CapPull2.dat", header = TRUE)
Noise <- read.table( "Noise.dat", header = TRUE)
Eddycur <- read.table( "Eddycur.dat", header = TRUE)
##### Calculating Power####
options(scipen=999)


# Example 1 - Calculating Power for Changes in Means
power.mean.t.onesample(sample.size = 9
                       ,effect.size = 10
                       ,variance.est = 10^2
                       ,alpha = 0.05
                       ,alternative = "two.sided")

# Example 2 - Calculating Power for Changes in Variance

# Power to detect an increase in variance
power.variance.onesample(sample.size = 9
                         ,null.hypothesis.variance = 10^2
                         ,alternative.hypothesis.variance = 12^2
                         ,alpha = 0.05
                         ,alternative = "two.sided")

# Power to detect a decrease in variance
power.variance.onesample(sample.size = 9
                         ,null.hypothesis.variance = 10^2
                         ,alternative.hypothesis.variance = 8^2
                         ,alpha = 0.05
                         ,alternative = "two.sided")



#### Calculating Sample Size ####

options(scipen=999)


# Calculating Sample Size -------------------------------------------------
# Sample Size Calculations for Changes in Means ---------------------------

alpha<-0.05
beta<-0.02
deltamu<-1
sd<-2

# Sigma unknown, non-directional, one sample
sample.size.mean.t.onesample(effect.size = 1
                             , variance.est = 2^2
                             , alpha = 0.05
                             , beta = 0.02
                             , alternative = "two.sided")


# Sample Size Calculations for Changes in Variance ---------------------------
# Sample Size, one sample
sigma0<-2 # 4 variance
sigma1<-3 # 9 variance
sigma2<-1 # 1 variance
alpha<-0.05
beta<-0.02

# Two sided, one sample (testing for a change in either direction)
# In this situation, I use the two.sided test for both the larger and smaller variance,
# and take the larger sample size of the two.
sample.size.variance.onesample(null.hypothesis.variance = sigma0^2
                               ,alternative.hypothesis.variance = sigma1^2
                               ,alpha = alpha
                               ,beta = beta
                               ,alternative = "two.sided")

sample.size.variance.onesample(null.hypothesis.variance = sigma0^2
                               ,alternative.hypothesis.variance = sigma2^2
                               ,alpha = alpha
                               ,beta = beta
                               ,alternative = "two.sided")

# Sample Size Calculations for Changes in Proportions ---------------------------
# Sample size for Proportions
pi0<-0.2
pi1<-0.3
pi2<-0.1
alpha<-0.05
beta<-0.10

# One sided, one sample
nqtr(sample.size.proportion.test.onesample.exact(null.hypothesis.proportion = pi0
                                                 ,alternative.hypothesis.proportion = pi2
                                                 ,alpha = alpha
                                                 ,beta = beta
                                                 ,alternative = "less"),4)

nqtr(sample.size.proportion.test.onesample.exact(null.hypothesis.proportion = pi0
                                                 ,alternative.hypothesis.proportion = pi1
                                                 ,alpha = alpha
                                                 ,beta = beta
                                                 ,alternative = "greater"),4)

# Two sided, one sample (testing for a change in either direction)
# In this situation, I use the two.sided test for both the larger and smaller proportion,
# and take the larger sample size of the two.

nqtr(sample.size.proportion.test.onesample.exact(null.hypothesis.proportion = pi0
                                                 ,alternative.hypothesis.proportion = pi1
                                                 ,alpha = alpha
                                                 ,beta = beta
                                                 ,alternative = "two.sided"),4)

nqtr(sample.size.proportion.test.onesample.exact(null.hypothesis.proportion = pi0
                                                 ,alternative.hypothesis.proportion = pi2
                                                 ,alpha = alpha
                                                 ,beta = beta
                                                 ,alternative = "two.sided"),4)





#### Two Independent Sample Tests for Means ###

# Startup Code

# Two Sample t Test, Equal Variance ---------------------------------------
#Look at the p-value
# Use simple when all parameter estimates are given
ro(t.test.twosample.independent.simple(sample.mean.g1 = 0.0060
                                       ,sample.variance.g1 = 0.0015^2
                                       ,sample.size.g1 = 25
                                       ,sample.mean.g2 = 0.0090
                                       ,sample.variance.g2 = 0.0013^2
                                       ,sample.size.g2 = 30
                                       ,conf.level = 0.95),6)

t.test.twosample.independent(g1 = CapPull2$pull[CapPull2$mold==1]
                             ,g2 = CapPull2$pull[CapPull2$mold==2])

# Make factors
str(CapPull2)
CapPull2$mold<-as.factor(CapPull2$mold)
str(CapPull2)

# Descriptive Summary
summary.continuous(fx = pull~mold, data = CapPull2)

# Use when you want to use a formula of y~x and have 
# a data file with factors
t.test.twosample.independent.fx(fx = pull~mold
                                ,data = CapPull2)
# Data visualization
boxplot(pull~mold, data = CapPull2, col="red")

process.group.plot(fx = pull~mold,data = CapPull2)

# Two Sample t Test, Unequal Variance ---------------------------------------

ro(t.test.twosample.independent.simple(sample.mean.g1 = 75
                                       ,sample.variance.g1 = 20^2
                                       ,sample.size.g1 = 12
                                       ,sample.mean.g2 = 82
                                       ,sample.variance.g2 = 9^2
                                       ,sample.size.g2 = 12
                                       ,conf.level = 0.90),4)


#### Two Dependent Sample Tests for Means ####


# Paired t test for Means (Dependent by Nature) -------------------------------------------------
summary.continuous(Noise)[-1,]

# Calculate difference between Old and New
Noise$Diff<-Noise$Old-Noise$New

summary.continuous(Noise)[-1,]

# Drop first and fourth column
Noise<-Noise[-c(1,4)]

# Transpose data
Noise.I<-transform.dependent.format.to.independent.format(data = Noise)
Noise.I
str(Noise.I)
Noise.I$cell<-as.factor(Noise.I$cell)

# Paired t test
t.test.twosample.dependent(x1 = Noise$Old
                           ,x2 = Noise$New)

# Calculate difference between Old and New
Noise$Diff<-Noise$Old-Noise$New

# Dbar method
# Used when we only have the difference between the two
t.test.twosample.dependent.simple.dbar(pair.differences.mean = mean(Noise$Diff)
                                       ,pair.differences.variance = var(Noise$Diff)
                                       ,sample.size = 10)

# Calculate the Pearson Product Moment Correlation Coefficient
# must have a corelaiton >0
cor(Noise$Old, Noise$New)
# is this signicicant?
cor.pearson.r.onesample(x = Noise$Old, y = Noise$New)


# Matched Pairs t test (Dependendent by Design) ---------------------------
cor.pearson.r.onesample.simple(sample.r = 0.60, sample.size = 30)

ro(t.test.twosample.dependent.simple.meandiff(sample.mean.g1 = 35.24
                                              ,sample.mean.g2 = 38.02
                                              ,sample.variance.g1 = 5.18^2
                                              ,sample.variance.g2 = 5.63^2
                                              ,sample.size = 30
                                              ,rho.estimate = 0.60),4)

#### Two Sample Tests for Variances ####
# (Assuming a Normally Distributed Population)

# Startup Code

# Two Independent Sample F Test for Variances -----------------------------------------

ro(variance.test.twosample.independent.simple(sample.variance.g1 = 0.0015^2
                                              ,sample.size.g1 = 25
                                              ,sample.variance.g2 = 0.0013^2
                                              ,sample.size.g2 = 30),7)

# Compare results to t test for means
ro(t.test.twosample.independent.simple(sample.mean.g1 = 0.0060
                                       ,sample.variance.g1 = 0.0015^2
                                       ,sample.size.g1 = 25
                                       ,sample.mean.g2 = 0.0090
                                       ,sample.variance.g2 = 0.0013^2
                                       ,sample.size.g2 = 30
                                       ,conf.level = 0.95),7)

# Matched Pairs (dependancy) t test for Variances --------------------------------------
cor.pearson.r.onesample.simple(sample.r = 0.60, sample.size = 30)

variance.test.twosample.dependent.simple(sample.variance.g1 = 5.18^2
                                         ,sample.variance.g2 = 5.63^2
                                         ,sample.size = 30
                                         ,rho.estimate = 0.60
                                         ,conf.level = 0.95)


#### Two Sample Tests for Proportions ####

# Two Sample Tests for Proportions ----------------------------------------

# Fisher's Exact Test for indepandant groups
proportion.test.twosample.exact.simple(sample.proportion.g1 = 0.18
                                       ,sample.size.g1 = 750
                                       ,sample.proportion.g2 = 0.12
                                       ,sample.size.g2 = 750
                                       ,conf.level = 0.99)

# McNemar's Test for Change - Dependent Proportions -----------------------
# table format
# - Pass - Fail
# Pass - a - b
# Fail - c - d
# Contingency table format = ct<-(a,c,b,d)
ct<-c(56,56,4,4)

# Create Contingency Table
(ct.new<-matrix(ct,nrow = 2
                , dimnames = list("Before Maint" = c("Pass", "Fail"),
                                  "After Maint" = c("Pass", "Fail"))))

# Perform McNemar's Test
(mcnemar.out<-proportion.test.mcnemar.simple(b = 4, c = 56))

mcnemar.test(ct.new)


#### Two Independent Sample Tests for Poisson Counts ###


# Two Sample Independent Tests for Poisson Rates (Counts) -----------------

# Descriptive Summary
summary.impl(Eddycur$Before, stat.n = T, stat.mean = T)
summary.impl(Eddycur$After, stat.n = T, stat.mean = T)

# Test for Poisson distribution
poisson.dist.test(Eddycur$Before) #P >.05
poisson.dist.test(Eddycur$After) #P >.05

# Poisson test
# Remember that sample count has to be 
# n times lambda
(count_before<-sum(Eddycur$Before))
(n_before<-length(Eddycur$Before))

(count_after<-sum(Eddycur$After))
(n_after<-length(Eddycur$After))

poisson.test.twosample.simple(sample.count.g1 = count_before
                              ,sample.size.g1 = n_before
                              ,sample.count.g2 = count_after
                              ,sample.size.g2 = n_after)



