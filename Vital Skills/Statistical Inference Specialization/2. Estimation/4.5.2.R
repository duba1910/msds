n_one <- 10
n_two <- 12
x_bar_one <- 2.7
x_bar_two <- 3.2
s_squared_one <- .73
s_squared_two <- .8
deg_of_freedom <- n_one+n_two-2

t_crit <- qt(.95, deg_of_freedom)

pooled_var <- (((n_one-1)*s_squared_one)+((n_two-1)*s_squared_two))/deg_of_freedom


upper <- (x_bar_one-x_bar_two)+ (t_crit*sqrt(pooled_var*((1/n_one)+(1/n_two))))
lower <- (x_bar_one-x_bar_two)- (t_crit*sqrt(pooled_var*((1/n_one)+(1/n_two))))
upper
lower