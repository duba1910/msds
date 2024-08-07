require(lolcat)
ro<-round.object
nqtr<-function(x,d){noquote(t(round.object(x, d)))}
# Create a vector of normally distributed numbers with a sample size of 10,000,
# a mean of 5 and a standard deviation of 1.
# Set the seed value to 145 prior to creating the vector

# What is the mean of the data? 
set.seed(145)
vector <- rnorm(n = 10000,mean = 5, sd = 1)
round(mean(vector), 4)


# Next, set the seed value to 100.
# Take the random samples from an exponential population with a mean of 5,
# a sample size of 100, and repeat 5000 times.
# Calculate the averages for each sample of 100
# 
# What is the value for skewness, g3
# What is the value for kurtosis, g4
set.seed(100)
n<-100
reps<-5000
samplesexp <- replicate(reps, rexp(n, rate = 1/5))
sampleavgsexp <- colMeans(samplesexp)
nqtr(summary.continuous(sampleavgsexp, stat.sd=T),4)

# A process has a mean of 150 and a standard deviation of 10.
# The sample size is n=15. What is the standard error of the mean? 
mean<-150
sd<-10
n<-15
round((stderror<-sd/sqrt(n)), 4)


# A stamping operation presently displays statistical control as
# related to a part’s outer diameter for both location and dispersion.
# The estimated process mean is 1.575” with a standard deviation of 0.01”. 
# 
# Given a sample size of 5, what is the probability of
# drawing a sample with a mean of 1.580” or more?
mean <- 1.575
sd <- 0.01
n <- 5
stderror<-sd/sqrt(n)
x_bar <- 1.580
round(pnorm(q = x_bar, mean = mean, sd = stderror, lower.tail = F), 4)

# A stamping operation presently displays statistical control as related to a
# part’s outer diameter for both location and dispersion. The estimated process mean is 1.575”
# with a standard deviation of 0.01”.
# 
# Given a sample size of 10, what is the probability of
# drawing a sample with a mean of 1.572” or less?
mean <- 1.575
sd <- 0.01
n <- 10
stderror<-sd/sqrt(n)
x_bar <- 1.572
round(pnorm(q = x_bar, mean = mean, sd = stderror, lower.tail = T), 4)
