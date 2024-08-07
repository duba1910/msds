require(lolcat)
ro<-round.object
nqtr<-function(x,d){noquote(t(round.object(x, d)))}
push <- read.table( "Push.dat", header = TRUE)
sample_mean <- mean(push$Force)
sample_sd <- sd(push$Force)
n<-length(push$Force)



# On a Point Estimate basis, what is your estimate of the total percentage
# defective that will result if we implement the new process?
lower_spec_limit <- 126
pnorm(lower_spec_limit, mean = sample_mean, sd = sample_sd)

# What is the 90% confidence interval for the mean?
xbar<-sample_mean
sd<-sample_sd
conf<-0.90

t.test.onesample.simple(sample.mean = xbar
                        ,sample.variance = sd^2
                        ,sample.size = n
                        ,conf.level = conf)


# What is the 90% confidence interval for the variance?
conf<-0.90
(ci.var<-variance.test.onesample.simple(sample.variance = sd^2
                                        ,sample.size = n
                                        ,conf.level = conf))
ci.var$conf.int


# Perform a worst case analysis for these data, assuming a Confidence Level of 90%
# for the mean and variance (individually). The worst case for this data is
# where the mean is at the lowest end of its confidence interval, and the variability
# is at the highest end of its confidence interval.
# Based on this analysis, what is your estimate of the 'worst case' percentage defective rate?
pnorm(lower_spec_limit, mean = 118.453, sd = sqrt(128.273))
