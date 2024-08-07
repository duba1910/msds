require(lolcat)
ro<-round.object
nqtr<-function(x,d){noquote(t(round.object(x, d)))}

set.seed(145)
vector <- rnorm(n = 10000,mean = 5, sd = 1)
round(mean(vector), 4)


set.seed(100)
n<-100
reps<-5000
samplesexp <- replicate(reps, rexp(n, rate = 1/5))
sampleavgsexp <- colMeans(samplesexp)
nqtr(summary.continuous(sampleavgsexp, stat.sd=T),4)


mean<-150
sd<-10
n<-15
round((stderror<-sd/sqrt(n)), 4)

mean <- 1.575
sd <- 0.01
n <- 5
stderror<-sd/sqrt(n)
x_bar <- 1.580
round(pnorm(q = x_bar, mean = mean, sd = stderror, lower.tail = F), 4)

mean <- 1.575
sd <- 0.01
n <- 10
stderror<-sd/sqrt(n)
x_bar <- 1.572
round(pnorm(q = x_bar, mean = mean, sd = stderror, lower.tail = T), 4)
