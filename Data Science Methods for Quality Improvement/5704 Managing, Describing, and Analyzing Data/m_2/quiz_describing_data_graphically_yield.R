require(lolcat)
yield <- read.table( "yield.txt", header = TRUE)

hist.grouped(yield$strength, freq=F)
lines(density(yield$strength))


