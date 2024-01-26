n_one <- 10
n_two <- 12
x_bar_one <- 2.7
x_bar_two <- 3.2
var <- .8

z_crit <- qnorm(.95)

upper <- (x_bar_one-x_bar_two) + z_crit*(sqrt((var/n_one)+(var/n_two)))
lower <- (x_bar_one-x_bar_two) - z_crit*(sqrt((var/n_one)+(var/n_two)))
upper
lower