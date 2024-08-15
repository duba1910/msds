library(lolcat)
require(lolcat)


ro<-round.object
nqtr<-function(x,d){noquote(t(round.object(x, d)))}
temper <- read.table( "Temper.dat", header = TRUE)

cor(temper$before, temper$after)

variance.test.twosample.dependent.simple(sample.variance.g1 = var(temper$before)
                                         ,sample.variance.g2 = var(temper$after)
                                         ,sample.size = length(temper$before)
                                         ,rho.estimate = cor(temper$before, temper$after)
                                         ,conf.level = 0.95)


ro(t.test.twosample.dependent.simple.meandiff(sample.mean.g1 = mean(temper$before)
                                              ,sample.mean.g2 = mean(temper$after)
                                              ,sample.variance.g1 =var(temper$before)
                                              ,sample.variance.g2 = var(temper$after)
                                              ,sample.size = length(temper$before)
                                              ,rho.estimate = cor(temper$before, temper$after)),4)