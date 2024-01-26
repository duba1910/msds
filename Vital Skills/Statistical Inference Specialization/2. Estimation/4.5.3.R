n_one <- 138
n_two <- 110
sample_mean_one <- 18.17
sample_var_one <- 1.78
sample_mean_two <- 21.66
sample_var_two <- 3.21


z_crit <- qnorm(.975)

upper <- sample_mean_one-sample_mean_two + (z_crit*sqrt((sample_var_one/n_one)+(sample_var_two/n_two)))
lower <- sample_mean_one-sample_mean_two  - (z_crit*sqrt((sample_var_one/n_one)+(sample_var_two/n_two)))
upper
lower