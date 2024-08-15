library(lolcat)
require(lolcat)


ro<-round.object
nqtr<-function(x,d){noquote(t(round.object(x, d)))}
toollife <- read.table( "ToolLife.dat", header = TRUE)
Straight <- read.table( "Straight.dat", header = TRUE)

aggregate(life ~ vendor, data = toollife, FUN = mean)
aggregate(life ~ vendor, data = toollife, FUN = var)

# Perform a paired t-test
paired_t_test <- t.test(Straight$before, Straight$after, paired = TRUE, alternative = "greater")

# Display the results
print(paired_t_test)