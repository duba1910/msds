n <- 12
x_bar <- 11.3 
var <- 6.43
z_crit <- qnorm(.05)
h_zero <- 15


c <-h_zero+(z_crit*(sqrt(var/n)))
c
x_bar < c
