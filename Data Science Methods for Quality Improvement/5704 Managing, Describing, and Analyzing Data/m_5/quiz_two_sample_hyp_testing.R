require(lolcat)
ro<-round.object
nqtr<-function(x,d){noquote(t(round.object(x, d)))}


# If management has initially identified the requirements of a hardness
# test to be ⍺ = 0.01, Δ𝛍 = 1, n = 20 and 𝛔 was estimated to be 2.0,
# what would the power be for to detect a change in the Mean? 

power.mean.t.onesample(sample.size = 20
                       ,effect.size = 1
                       ,variance.est = 2^2
                       ,alpha = 0.01
                       ,alternative = "two.sided")


# If management has initially identified the requirements of a hardness
# test to be ⍺ = 0.01, β = 0.05, Δ𝛍 = 1, and 𝛔 was estimated to be 2.0,
# what would be the minimum sample size needed to to detect a change in the Mean? 
alpha<-0.01
beta<-0.05
deltamu<-1
sd<-2


sample.size.mean.t.onesample(effect.size = deltamu
                             , variance.est = sd^2
                             , alpha = alpha
                             , beta = alpha
                             , alternative = "two.sided")