require(lolcat)
ro<-round.object
nqtr<-function(x,d){noquote(t(round.object(x, d)))}
Point_Estimates <- read.table( "Point_Estimates.dat", header = TRUE)

#### Sampling Error ####

# Create four random samples of size n=30 with Mu = 100, sigma = 10
d1<-rnorm(n = 30,mean = 100, sd = 10)
d2<-rnorm(n = 30,mean = 100, sd = 10)
d3<-rnorm(n = 30,mean = 100, sd = 10)
d4<-rnorm(n = 30,mean = 100, sd = 10)

# Create a dataframe of all variables
normdata<-data.frame(d1,d2,d3,d4)
View(normdata)

# Review summary statistics of all variables
summary.all.variables(normdata, stat.sd=T)

# Make output easier to read
nqtr(summary.all.variables(normdata, stat.sd=T),3)

# Create histograms of each variable in one plot
# Set parameters for graphical output, and create a matrix of nrows x ncols 
par(mfrow=c(2,2))
hist.grouped(normdata$d1)
hist.grouped(normdata$d2)
hist.grouped(normdata$d3)
hist.grouped(normdata$d4)

# Set parameters back to one graph
par(mfrow=c(1,1))
randoexp<-rexp(n = 100, rate = 1/10)
hist.grouped(randoexp)


#### Random Sampling Distributions ####
# Random Sampling Distribution Simulation

# First, set seed so we will get the same results
set.seed(133)

# Create a distribution with mean of 10 and standard deviation of 2
pop<-rnorm(n = 50000, mean = 10, sd = 2)

# Create a histogram of the population distribution
hist.grouped(pop, anchor.value = 0)

# Calculate the descriptive statistics of the population distribution
nqtr(summary.continuous(pop, stat.sd=T),5)

# Next, create / simulate a random sampling distribution
# Set the sample size equal to 4
n<-4

# Create the number of repetitions 
# (number of times we will take a sample of size 4)
reps<-5000

# Take the random samples from a population with a mean of 10 and 
# standard deviation of 2
samples <- replicate(reps, rnorm(n, mean = 10, sd = 2))
View(samples)

# Calculate the averages of each sample of 4
sampleavgs <- colMeans(samples)

# Calculate the descriptive statistics of the RSD
nqtr(summary.continuous(sampleavgs, stat.sd=T),5)

# Create 2 histograms of the population and sample averages 
# using the same axis to compare

# Create a 1 x 2 matrix
dev.off() # turns off the default
layout(matrix(1:2, nrow=2)) 

# Create both histograms
hist.grouped(pop, xlim=c(0,22), xaxt='n', width.consider = 1)
axis(side = 1, at = seq(0,22,2), labels = seq(0,22,2))

hist.grouped(sampleavgs, xlim=c(0,22), xaxt='n', width.consider = 1)
axis(side = 1, at = seq(0,22,2), labels = seq(0,22,2))

#### Central Limit Theorem ####
# Random Sampling Distribution Simulation

# First, set seed so we will get the same results
set.seed(101)

# Create an exponential distribution with mean of 10
popexp<-rexp(n = 50000, rate = 1/10)

# Create a histogram of the population distribution
hist.grouped(popexp)

# Calculate the descriptive statistics of the population distribution
nqtr(summary.continuous(popexp, stat.sd=T),5)

# Next, create / simulate a random sampling distribution
set.seed(102)

# Set the sample size equal to 100
n<-100

# Create the number of repetitions 
# (number of times we will take a sample of size 100)
reps<-1000

# Take the random samples from an exponential population with a  
# mean of 10 (lambda = 1/10)
samplesexp <- replicate(reps, rexp(n, rate = 1/10))
View(samplesexp)

# Calculate the averages of each sample of 100
sampleavgsexp <- colMeans(samplesexp)

# Calculate the descriptive statistics of the RSD of the means
nqtr(summary.continuous(sampleavgsexp, stat.sd=T),5)

# Create a histogram for the RSD of the means from the
# exponential population
hist.grouped(sampleavgsexp)

# Create 2 histograms of the population and sample averages 
# using the same axis to compare

# Create a 1 x 2 matrix
dev.off() # turns off the default
layout(matrix(1:2, nrow=2)) 

# Create both histograms
hist.grouped(popexp, xlim=c(0,50), xaxt='n', width.consider = 2)
axis(side = 1, at = seq(0,50,5), labels = seq(0,50,5))

hist.grouped(sampleavgsexp, xlim=c(0,50), xaxt='n', width.consider = 2)
axis(side = 1, at = seq(0,50,5), labels = seq(0,50,5))

#### Probability with RSD ####
# Using the RSD to solve probability problems
# Example 1
# Drawing a random sample of 25 units, what is the probability of finding an 𝑋ത of 1.433 or more 
# or the sample if no change has occurred in the mean or dispersion of the process?
# Define the variables in the problem
mu1<-1.325
sigma1<-0.045
n1<-25
xbar1<-1.433
stderror1<-sigma1/sqrt(n1) #Standard Error= SD/sqrt(n)
#zcore = x bar - mu / standard error

# Calculate the area under the normal curve using the pnorm function
pnorm(q = xbar1, mean = mu1,sd = stderror1, lower.tail = F)

# Create the normal curve
x=seq(1.28,1.45,length=200)
y=dnorm(x,mean=mu1,sd=stderror1)
plot(x,y,type="l")

# Indicate the location of the xbar of 1.433
abline(v=1.433)

# Example 2
# Drawing a random sample of 16 units, what is the probability of finding an 𝑋ത of 55 or more 
# or the sample if no change has occurred in the mean or dispersion of the process?
# Define the variables in the problem
mu2<-50
sigma2<-14.4
n2<-16
xbar2<-55
stderror2<-sigma2/sqrt(n2)

# Calculate the area under the normal curve using the pnorm function
pnorm(q = xbar2, mean = mu2,sd = stderror2, lower.tail = F)

# Create the normal curve
x=seq(30,70,length=200)
y=dnorm(x,mean=mu2,sd=stderror2)
plot(x,y,type="l")

# Shade the upper tail area
x=seq(55,70,length=100)
y=dnorm(x,mean=mu2,sd=stderror2)
polygon(c(55,x,70),c(0,y,0),col="red")

# Indicate the location of the xbar of 55
abline(v=55)

#### Point Estimates ####

View(Point_Estimates)

(xbar<-mean(Point_Estimates$Weight))
(sd<-sd(Point_Estimates$Weight))

(prop<-mean(Point_Estimates$Proportion))

(count<-mean(Point_Estimates$Count))


# Confidence Intervals for the Mean and Variance ####

options(scipen=999)

# Confidence Interval for the Mean (Sigma is Known) -----------------------
# Example 1
n<-150
xbar<-20
sd<-5
conf<-0.95

z.test.onesample.simple(sample.mean = xbar
                        ,known.population.variance = sd^2
                        ,sample.size = n
                        ,conf.level = conf)

# Round the output
ro(z.test.onesample.simple(sample.mean = xbar
                           ,known.population.variance = sd^2
                           ,sample.size = n
                           ,conf.level = conf),2)


# Confidence Interval for the Mean (Sigma is Unknown) ---------------------
# Example 2
n<-14
xbar<-15000
sd<-500
conf<-0.95

t.test.onesample.simple(sample.mean = xbar
                        ,sample.variance = sd^2
                        ,sample.size = n
                        ,conf.level = conf)


# Confidence Interval for the Variance ------------------------------------
# Example 3
sd<-10
n<-25
conf<-0.95

(ci.var<-variance.test.onesample.simple(sample.variance = sd^2
                                       ,sample.size = n
                                       ,conf.level = conf))

# Confidence Interval for the Variance
ci.var$conf.int

# Confidence Interval for the Standard Deviation
sqrt(ci.var$conf.int)

# Generate Confidence Intervals using a file
# Using the point estimate file, calculate the 95% confidence interval 
# estimates for the mean, variance and standard deviation for the Weight data

# Test for normality
summary.continuous(Point_Estimates$Weight)

# Calculate confidence intervals
t.test.onesample(Point_Estimates$Weight, conf.level = 0.95)

#### Confidence Intervals for Proportions and Poisson Counts ####

options(scipen=999)

# Confidence Interval for a Proportion -----------------------
# Example 1
ro(proportion.test.onesample.exact.simple(sample.proportion = 0.12
                                          ,sample.size = 100
                                          , conf.level = 0.95),4)

# Using the Point Estimate File, calculate the 90% confidence interval for the 
# Proportion

(prop<-mean(Point_Estimates$Proportion)) # average proportion
(n<-length(Point_Estimates$Proportion)) # sample size

# Proportion (Exact) 
ro(proportion.test.onesample.exact.simple(sample.proportion = 0.03525
                                          ,sample.size = 20
                                          ,conf.level = 0.90),4)


# Confidence Interval for Poisson Counts ---------------------
# Using the Point Estimate File, calculate the 99% confidence interval for the 
# Poisson Counts

# Make sure data are Poisson distributed
poisson.dist.test(Point_Estimates$Count)

# Get Total Counts in the Sample
(counts<-sum(Point_Estimates$Count))

# Get Sample Size
(n<-length(Point_Estimates$Count))

poisson.test.onesample.simple(sample.count = counts
                              ,sample.size = n
                              ,conf.level = 0.95)



