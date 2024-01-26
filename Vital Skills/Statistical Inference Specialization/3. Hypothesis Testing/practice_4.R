mu_zero <- 4.69

n <- 15
d_o_f <- 14
x_bar <- 3.87
sample_sd <- 1.45
sample_var <- sample_sd^2

t_crit <- qt(.1, d_o_f)

test_stat <- (x_bar-mu_zero)/sqrt(sample_var/n)

pt(test_stat, d_o_f)
