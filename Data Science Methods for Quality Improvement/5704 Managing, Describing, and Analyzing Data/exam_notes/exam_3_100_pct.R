require(lolcat)
ro<-round.object
nqtr<-function(x,d){noquote(t(round.object(x, d)))}
pushforce <- read.table( "pushforce.dat", header = TRUE)

dagostino.normality.omnibus.test(pushforce$Force)

ro(variance.test.twosample.independent.simple(sample.variance.g1 = sd(pushforce$Force[pushforce$Line == 1])^2
                                              ,sample.size.g1 = length(pushforce$Force[pushforce$Line == 1])
                                              ,sample.variance.g2 = sd(pushforce$Force[pushforce$Line == 2])^2
                                              ,sample.size.g2 = length(pushforce$Force[pushforce$Line == 2])),7)


ro(t.test.twosample.independent.simple(sample.mean.g1 = mean(pushforce$Force[pushforce$Line == 1])
                                       ,sample.variance.g1 = sd(pushforce$Force[pushforce$Line == 1])^2
                                       ,sample.size.g1 = length(pushforce$Force[pushforce$Line == 1])
                                       ,sample.mean.g2 = mean(pushforce$Force[pushforce$Line == 2])
                                       ,sample.variance.g2 = sd(pushforce$Force[pushforce$Line == 2])^2
                                       ,sample.size.g2 = length(pushforce$Force[pushforce$Line == 2])
                                       ,conf.level = 0.95),7)

   