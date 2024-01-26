# Sample size of each test
n_coffee = 10
n_nap = 12
# The reaction time data for each method
coffee = c(485.77, 490.86, 460.79, 528.74, 483.47, 526.24, 504.78, 460.7, 587.08, 484.13)
nap = c(598.15, 518.69, 601.49, 598.62, 555.73, 458, 488.57, 520.26, 534.71, 655.23, 573.18, 495.05)

alpha <- .05
mean_coffee <- mean(coffee)
mean_nap <- mean(nap)

var_coffee <- var(coffee)
var_nap <- var(nap)

deg_of_free <- n_nap + n_coffee - 2

# Calculate the pooled standard deviation
pooled_var <- (((n_nap - 1) * var_nap) + ((n_coffee - 1) * var_coffee))/ (deg_of_free)


t_stat <- (mean_nap - mean_coffee) / sqrt(pooled_var * ((1 / n_nap) + (1 / n_coffee)))
p_value <- pt(t_stat, deg_of_free, lower.tail = TRUE)
t_stat
p_value
p_value < alpha