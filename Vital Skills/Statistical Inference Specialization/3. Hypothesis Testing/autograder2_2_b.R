n <- 100
sample_mean <- 220
true_sd <- 100
true_var <- true_sd^2
mu_zero <- 250

test_stat <- (sample_mean-mu_zero)/
  sqrt(true_var/n)

pnorm(test_stat)
