require(lolcat)
ro<-round.object
nqtr<-function(x,d){noquote(t(round.object(x, d)))}
defectives <- read.table( "defectives.dat", header = TRUE)
defects <- read.table( "defects.dat", header = TRUE)
height <- read.table( "height.dat", header = TRUE)


summary.continuous(height$inches)

pnorm(q = 4.802, mean = mean(height$inches), sd = sd(height$inches), lower.tail = T)*100

dpois(x = 3, lambda = 100)
ppois(q = 3, lambda = mean(defectives$cans), lower.tail = F)
round(dpois(x = 0, lambda = mean(defectives$cans)*50), 4)
round(mean(height$inches), 3)

n<-length(height$inches)
xbar<-mean(height$inches)
sd<-sd(height$inches)
var(height$inches)
conf<-0.95

z.test.onesample.simple(sample.mean = xbar
                        ,known.population.variance = var(height$inches)
                        ,sample.size = n
                        ,conf.level = conf)

round(mean(defectives$cans), 4)

n<-length(defectives$cans)
xbar<-mean(defectives$cans)
sd<-sd(defectives$cans)
conf<-0.90

z.test.onesample.simple(sample.mean = xbar
                        ,known.population.variance = sd^2
                        ,sample.size = n
                        ,conf.level = conf)
