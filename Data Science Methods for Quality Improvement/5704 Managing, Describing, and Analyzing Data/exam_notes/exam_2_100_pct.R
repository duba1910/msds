require(lolcat)
ro<-round.object
nqtr<-function(x,d){noquote(t(round.object(x, d)))}


alpha<-0.025
beta<-0.01
deltamu<-5
sd<-2

# Sigma unknown, non-directional, one sample
sample.size.mean.t.onesample(effect.size = deltamu
                             , variance.est = sd^2
                             , alpha = alpha
                             , beta = beta
                             , alternative = "two.sided")



sigma0<-2 # 4 variance
sigma1<-3 # 9 variance
sigma2<-1 # 1 variance
alpha<-0.025
beta<-0.01

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



