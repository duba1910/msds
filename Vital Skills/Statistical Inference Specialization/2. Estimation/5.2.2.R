n_a <- 150
yes_a <- 78
n_b <- 150
yes_b <- 92

z_crit <- qnorm(.975)

p_hat_a <- yes_a/n_a
p_hat_b <- yes_b/n_b

upper <- (p_hat_b-p_hat_a) +
  (z_crit*sqrt(((p_hat_a*(1-p_hat_a))/n_a)+((p_hat_b*(1-p_hat_b))/n_b)))
lower <- (p_hat_b-p_hat_a) -
  (z_crit*
     sqrt(
       ((p_hat_a*(1-p_hat_a))/n_a)+
         ((p_hat_b*(1-p_hat_b))/n_b)
     ))
upper
lower