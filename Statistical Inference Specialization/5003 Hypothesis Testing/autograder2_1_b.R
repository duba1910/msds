alpha = 0.05
z_crit <- qnorm(1-alpha)
n <- 100
yes <- 60
p_hat <- yes/n
h_zero <- .5

test_stat <- (p_hat-h_zero)/sqrt(
  (h_zero*(1-h_zero))/n
)

p_value <- pnorm(test_stat, lower.tail = FALSE)


p1.b = p_value < alpha
p_value
alpha
p_value < alpha

