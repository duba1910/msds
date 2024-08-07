require(lolcat)
Daily.Production <- read.table( "Daily_Production.txt", header = FALSE)


#### Probability Distributions ###
# Example of Binomial Probability Distribution
table.dist.binomial(n = 2, p = 0.2)

# Barplot of Binomal Probability Distribution
n<-2
P<-0.2
data<-dbinom(x = 0:n, size = n, prob = P)
names(data)<-0:n
barplot(data, xlab = "# of Defectives", ylab = "P(D)", ylim = c(0,1))

# Probability Distribution for Discrete Random Variable
(freqdistdp<-round.object(frequency.dist.grouped(Daily.Production$V1),3))
(probdistdp<-freqdistdp[,c("min","freq","rel.freq")])
colnames(probdistdp)<-c("Daily Production", "#of Days", "P(DP)")
View(probdistdp)

# Probability Distribution (Histogram)
hist.grouped(Daily.Production$V1, freq = F, anchor.value=50, ylim=c(0,0.20))

# Expected Value of a Discrete Random Variable
x<-probdistdp$`Daily Production`
y<-probdistdp$`P(DP)`
weighted.mean(x,y)

# Alternatively
mean(Daily.Production$V1)


#### Binomial ####
# Binomial Example - manual calculation
p<-0.80
q<-0.20
r<-45
n<-50

factorial(n)/(factorial(r)*factorial(n-r))*(p^r)*(q^(n-r))

# Binomial Example - dbinom
dbinom(x = 45, size = 50, prob = 0.8)

# Binomial Example - table
round.object(table.dist.binomial(n = 50, p = 0.80),5)

# Barplot of Binomal Probability Distribution
n<-50
P<-0.8
data<-dbinom(x = 26:n, size = n, prob = P)
names(data)<-26:n
barplot(data, xlab = "# of Good Parts", ylab = "P(G)", ylim = c(0,0.15))
cols <- rep("grey", n + 1)
cols[20:25] <- "red"
barplot(data, col=cols,xlab = "# of Good Parts", ylab = "P(G)", ylim = c(0,0.15))

# Binomial Probability of >=45 
# Note that pbinom gives P[X>x] for upper tail probabilities
pbinom(q = 44, size = 50, prob = 0.80, lower.tail = F)


#### Poisson ###
# Poisson Example - manual calculation
lambda<-25
X<-10

(lambda^X/factorial(X))*exp(-lambda)

# Poisson Example - dpois
dpois(x = 10, lambda = 25)

# Poisson Example - table
round.object(table.dist.poisson(lambda = 25),5)
round.object(table.dist.poisson(lambda = 25)[7:51,],5)

# Barplot of Poisson Probability Distribution
lambda<-25
X<-10

data<-dpois(x = 6:50, lambda = lambda)
names(data)<-6:50
barplot(data, xlab = "Parts per Hour", ylab = "P(X)", ylim = c(0, 0.10))

# Poisson Probability of 10 or fewer 
ppois(q = 10, lambda = 25, lower.tail = T)

# Poisson Probability of at least 20, but no more than 30?
data<-dpois(x = 6:50, lambda = lambda)
names(data)<-6:50
barplot(data, xlab = "Parts per Hour", ylab = "P(X)", ylim = c(0, 0.10))
cols <- rep("grey", n + 1)
cols[15:25] <- "red"
barplot(data, col=cols, xlab = "Parts per Hour", ylab = "P(X)", ylim = c(0, 0.10))

(ft20<-ppois(q = 19, lambda = 25, lower.tail = T))
(ft30<-ppois(q = 30, lambda = 25, lower.tail = T))

ft30-ft20

# Poisson distribution testing
poisdist<-rpois(n = 100, lambda = 25)
poisson.dist.test(poisdist)

#### Normal Distribution ####

#Example 1
# Calculate the area under the normal curve using the Z Score
pnorm(q = -1.6, mean = 0, sd = 1, lower.tail = T)

# Calculate the area under the normal curve using the pnorm function
pnorm(q = 172, mean = 180, sd = 5, lower.tail = TRUE)

#Example 2
# Calculate the area under the normal curve using the Z Score
pnorm(q = -1.0, mean = 0, sd = 1, lower.tail = T)
pnorm(q = 3, mean = 0, sd = 1, lower.tail = F)

# Calculate the area under the normal curve using the pnorm function
pnorm(q = 5.15, mean = 5.20, sd = .05, lower.tail = T)
pnorm(q = 5.35, mean = 5.20, sd = .05, lower.tail = F)

#Create output variables
(lower<-pnorm(q = 5.15, mean = 5.20, sd = .05, lower.tail = T))
(upper<-pnorm(q = 5.35, mean = 5.20, sd = .05, lower.tail = F))

#Add together for total area under the normal curve
(total=lower+upper)
(totalpercent=total*100)
round.object(totalpercent,2)

# Shade areas under the normal curve
# Create the normal curve
x=seq(5,5.45,length=200)
y=dnorm(x,mean=5.22,sd=.05)
plot(x,y,type="l")

# Shade the lower tail area
x=seq(5,5.15,length=100)
y=dnorm(x,mean=5.22,sd=.05)
polygon(c(5,x,5.15),c(0,y,0),col="red")

# Shade the upper tail area
x=seq(5.35,5.45,length=100)
y=dnorm(x,mean=5.22,sd=.05)
polygon(c(5.35,x,5.45),c(0,y,0),col="red")

# Add line at mean
abline(v = 5.22)

# Test for normality when n < 25

normdata<-rnorm(n = 24, mean = 10, sd = 2)
anderson.darling.normality.test(normdata) #normal = p>=.05
shapiro.wilk.normality.test(normdata) #normal = p>=.05
summary.continuous(normdata)

# Test for normality when n >= 25
normdata<-rnorm(n = 25, mean = 10, sd = 2)
(normout<-dagostino.normality.omnibus.test(normdata))#normal = p>=.05
(skkupvals<-c(normout$estimate[6], normout$estimate[12]))#normal = p>=.05
summary.continuous(normdata)

### Exponential ###


nqtr<-function(x,d){noquote(t(round.object(x, d)))}

# Example 1
pexp(q = 60, rate = 1/100, lower.tail = F)

# Shade areas under the exponential curve
# Create the exponential curve
x=seq(0,800,length=200)
y=dexp(x, rate = 1/100)
plot(x,y,type="l")

# Shade the upper tail area
x=seq(60,800,length=100)
y=dexp(x, rate = 1/100)
polygon(c(60,x,800),c(0,y,0),col="red")

# Example 2 when the min is not 0
pexp(q = (20-5),rate = 1/(50-5), lower.tail = T)
pexp.low(q = 20, low = 5, mean = 50, lower.tail = T)

# Shade areas under the exponential curve
# Create the exponential curve
x=seq(0,400,length=200)
y=dexp(x, rate = 1/50)
plot(x,y,type="l")

# Shade the lower tail area from xmin to 20
x=seq(5,20,length=100)
y=dexp(x, rate = 1/50)
polygon(c(5,x,20),c(0,y,0),col="red")

# Test for Exponentiality when n <= 100
expdata<-rexp(n = 100, rate = 1/50)
shapiro.wilk.exponentiality.test(expdata) #exp = p>=.05

# Test for Exponentiality when n > 100
expdata<-rexp(n = 101, rate = 1/50)
shapiro.wilk.exponentiality.test(expdata) # note it doesn't work!
shapetest.exp.epps.pulley.1986(expdata) #exp = p>=.05

