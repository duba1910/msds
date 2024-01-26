n <- 250
yes <- 112
zcrit <- qnorm(.975)
p_hat <- (yes/n)

upper <- p_hat + (zcrit*sqrt((p_hat*(1-p_hat))/n))
lower <- p_hat - (zcrit*sqrt((p_hat*(1-p_hat))/n))
upper
lower
