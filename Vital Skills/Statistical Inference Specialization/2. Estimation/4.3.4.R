n <- 12
var <- 25.1
sd <- sqrt(var)
sample_mean <- 23.7
alpha <- .2
z_cv <- qnorm(1-(alpha/2))

lower <- sample_mean - (z_cv*(sd/sqrt(n)))
upper <- sample_mean + (z_cv*(sd/sqrt(n)))
lower
upper
