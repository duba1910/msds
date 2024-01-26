n <- 8
mean <- 14
var <- 4
z <- (14.5-14)/sqrt(var/n)

pnorm(z, lower.tail = FALSE)
