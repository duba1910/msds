n <- 12
x_bar <- 82.17
mu_zero <- 81
true_sd <- 2.2
true_var <- true_sd^2


z_crit_upper <- qnorm(.975)
z_crit_lower <- qnorm(.025)
test_stat <- (x_bar - mu_zero)/
  sqrt(true_var/n)

c_upper <- mu_zero + (
  z_crit_upper* sqrt(true_var/n)
)

c_lower <- mu_zero + (
  z_crit_lower* sqrt(true_var/n)
)

c_upper
c_lower

