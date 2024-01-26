scores = c(53.02, 69.2, 81.96, 40.62, 76.24, 99.78, 94.49, 71.6, 76.95, 37.68, 37.59, 59.22, 92.44, 81.22, 63.74)

sample_sd <- sd(scores)
sample_var <- var(scores)
n <- length(scores)
d_o_f <- n-1

upper_crit <- qchisq(.975, d_o_f)
lower_crit <- qchisq(.025, d_o_f)

p1.upper = round(sqrt((sample_var*d_o_f)/lower_crit), 2)
p1.lower = round(sqrt((sample_var*d_o_f)/upper_crit), 2)

test_stat = (d_o_f*sample_var)/15^2

p_value <- pchisq(test_stat,d_o_f, lower.tail = FALSE)

p_value>.975 | p_value<.025
