n_one <- 120
n_two <- 100
x_bar_one <- 4.1
x_bar_two <- 3.3
sample_sd_one <- 2.1
sample_sd_two <- 1.5
sample_var_one <- sample_sd_one^2
sample_var_two <- sample_sd_two^2
mu_not <- 0

sample_stat <- x_bar_one-x_bar_two

test_stat <- (sample_stat-mu_not)/sqrt(
  (sample_var_one/n_one)+
    (sample_var_two/n_two)
  
)

round(test_stat, 2)