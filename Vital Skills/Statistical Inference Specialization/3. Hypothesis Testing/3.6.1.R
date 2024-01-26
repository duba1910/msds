n <- 10
x_bar <- 38.8
sample_var <- 2.8
mu_zero <- 40

test_stat <- (x_bar-mu_zero)/(sqrt(sample_var/n))
2*pt(test_stat, n-1)
