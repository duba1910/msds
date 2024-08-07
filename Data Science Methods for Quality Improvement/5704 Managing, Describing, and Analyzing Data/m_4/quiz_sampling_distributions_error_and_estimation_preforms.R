require(lolcat)
ro<-round.object
nqtr<-function(x,d){noquote(t(round.object(x, d)))}
preforms <- read.table( "preforms.dat", header = TRUE)
# The point estimate for the mean
mean(preforms$weight)
# Based upon a 95% confidence level, the lower/upper confidence limit of 𝝻 
n<-length(preforms$weight)
xbar<-mean(preforms$weight)
sd<-sd(preforms$weight)
conf<-0.95

t.test.onesample.simple(sample.mean = xbar
                        ,sample.variance = sd^2
                        ,sample.size = n
                        ,conf.level = conf)

# The point estimate for the variance
var(preforms$weight)

# Based on a 90% confidence level, the lower/upper confidence limit of variance

n<-length(preforms$weight)
xbar<-mean(preforms$weight)
sd<-sd(preforms$weight)
conf<-0.9

(ci.var<-variance.test.onesample.simple(sample.variance = sd^2
                                        ,sample.size = n
                                        ,conf.level = conf))
round(ci.var$conf.int, 4)



# A random sample of 500 parts has been collected from a production line.
# The number of nonconforming parts was found to be 15.
# Generate a 95% confidence interval for the proportion nonconforming.

ro(proportion.test.onesample.exact.simple(sample.proportion = 15/500
                                          ,sample.size = 500
                                          , conf.level = 0.95),4)


# A random sample of 250 extruded bars
# (18 feet long and 2 inches in diameter) was inspected for surface defects
# (indications) with an Eddy Current tester.
# The average number of indications per bar was computed to be c = 2.58. 
# Based upon a 90% confidence level, the lower/upper confidence limit

bars<- 250
indications_per_bar <- 2.58
counts <- bars * indications_per_bar
poisson.test.onesample.simple(sample.count = counts
                              ,sample.size = bars
                              ,conf.level = 0.90)

