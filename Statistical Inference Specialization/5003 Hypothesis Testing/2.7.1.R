n <- 100
yes <- 68
z_crit <- qnorm(.97)
h_zero <- .6
p <- h_zero
p_hat <- yes/n
alpha <- .03

c <-(qnorm(1-alpha)*(sqrt((p*(1-p))/n)))+p

z_crit
p_hat > c

p_value <- pnorm((p_hat-h_zero)/(sqrt((p*(1-p))/n)), lower.tail = FALSE)
p_value < alpha
           