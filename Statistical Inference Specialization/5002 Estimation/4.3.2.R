x_bar <- 83.14
sample_sd <- 2.73
n <- 138
z_crit <- qnorm(.95)

lower <- x_bar - (z_crit *(sample_sd/sqrt(n)))
upper  <- x_bar+ (z_crit *(sample_sd/sqrt(n)))
lower
upper

lower <- x_bar - (z_crit *(sqrt((sample_sd^2)/n)))
upper  <- x_bar+ (z_crit *(sqrt((sample_sd^2)/n)))
lower
upper


(z_crit *(sqrt((sample_var)/n)))
