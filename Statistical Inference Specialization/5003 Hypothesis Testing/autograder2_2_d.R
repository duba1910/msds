n <- 100
sample_mean <- 175

true_sd <- 100
true_var <- true_sd^2
mu_zero <- 250

test_stat <- (sample_mean-mu_zero)/
  sqrt(true_var/n)

pnorm(test_stat)

# 1 = 0.00134989803163009
# 2 = 3.1908916729109e-14
# 3 = 1.01727730727222e-07
# 4 = 6.93672895269885e-39  