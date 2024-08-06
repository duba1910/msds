require(lolcat)
yield <- read.table( "yield.txt", header = TRUE)

skewness(yield$strength)

kurtosis(yield$strength)

