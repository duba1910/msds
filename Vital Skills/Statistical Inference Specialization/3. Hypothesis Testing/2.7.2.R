sample <- c(179, 156, 167, 183, 178, 165)
n <- length(sample)
sample_var <- var(sample)
sample_mean <- mean(sample)
true_sd <- 4.2
true_var <- true_sd^2

h_zero <- 170

z_crit <- qnorm(.8)

normalized_mean <- (sample_mean-h_zero)/(true_sd/sqrt(n))

pnorm(sample_mean, h_zero, true_sd/sqrt(n), lower.tail = FALSE)
pnorm(normalized_mean, lower.tail = FALSE)

