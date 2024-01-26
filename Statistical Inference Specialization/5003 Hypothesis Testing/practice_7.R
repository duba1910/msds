h_zero <- 2

n <- 15
d_o_f <- 14
x_bar <- 3.87
sample_sd <- 1.45
sample_var <- sample_sd^2
chi_sq_crit <- qchisq(.95, d_o_f)

(chi_sq_crit*h_zero)/d_o_f
