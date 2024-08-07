require(lolcat)
ro<-round.object
nqtr<-function(x,d){noquote(t(round.object(x, d)))}
preforms <- read.table( "preforms.dat", header = TRUE)

mean(preforms$weight)

n<-length(preforms$weight)
xbar<-mean(preforms$weight)
sd<-sd(preforms$weight)
conf<-0.95

t.test.onesample.simple(sample.mean = xbar
                        ,sample.variance = sd^2
                        ,sample.size = n
                        ,conf.level = conf)


var(preforms$weight)

n<-length(preforms$weight)
xbar<-mean(preforms$weight)
sd<-sd(preforms$weight)
conf<-0.9

(ci.var<-variance.test.onesample.simple(sample.variance = sd^2
                                        ,sample.size = n
                                        ,conf.level = conf))

# Confidence Interval for the Variance
ci.var$conf.int



ro(proportion.test.onesample.exact.simple(sample.proportion = 15/500
                                          ,sample.size = 500
                                          , conf.level = 0.95),4)

bars<- 250
indications_per_bar <- 2.58
counts <- bars * indications_per_bar
poisson.test.onesample.simple(sample.count = counts
                              ,sample.size = bars
                              ,conf.level = 0.90)

