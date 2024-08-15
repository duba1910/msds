require(lolcat)
ro<-round.object
nqtr<-function(x,d){noquote(t(round.object(x, d)))}
spa <- read.table( "spa.dat", header = TRUE)

anderson.darling.normality.test(spa$Before) #normal = p>=.05
shapiro.wilk.normality.test(spa$Before) #normal = p>=.05
anderson.darling.normality.test(spa$After) #normal = p>=.05
shapiro.wilk.normality.test(spa$After) #normal = p>=.05
summary.continuous(spa)


var.test(spa$Before, spa$After)

ro(variance.test.twosample.independent.simple(sample.variance.g1 = sd(spa$Before)^2
                                              ,sample.size.g1 = length(spa$Before)
                                              ,sample.variance.g2 = sd(spa$After)^2
                                              ,sample.size.g2 = length(spa$After)),7)

ro(t.test.twosample.independent.simple(sample.mean.g1 = mean(spa$Before)
                                       ,sample.variance.g1 = sd(spa$Before)^2
                                       ,sample.size.g1 = length(spa$Before)
                                       ,sample.mean.g2 = mean(spa$After)
                                       ,sample.variance.g2 = sd(spa$After)^2
                                       ,sample.size.g2 = length(spa$After)
                                       ,conf.level = 0.95),7)