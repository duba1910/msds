alpha = 0.05
bird.counts = c(11, 6, 10, 7, 6, 9, 12, 11, 11)
mean(bird.counts)
length(bird.counts)
mean <- mean(bird.counts)
var <- var(bird.counts)
n <- length(bird.counts)
h_zero <- 8
z_crit <- qnorm(1-alpha)
true_sd <- 2
true_var <- true_sd^2
c <- h_zero+(z_crit*sqrt(true_var/n))
mean > c
