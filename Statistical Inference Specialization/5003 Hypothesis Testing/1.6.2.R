n <- 73
x_bar <- 18.86 
sd <- 8.6
var <- sd^2
z_crit <- qnorm(.1)
h_zero <- 20


c <- h_zero+(z_crit*(sd/sqrt(n)))
x_bar < c

test_stat <- (x_bar - h_zero)/sqrt(var/n)
p_value <- pnorm(test_stat)

p_value < alpha
