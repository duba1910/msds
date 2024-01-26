# Sample size of each test
n.coffee = 10
n.nap = 12
# The reaction time data for each method
coffee = c(485.77, 490.86, 460.79, 528.74, 483.47, 526.24, 504.78, 460.7, 587.08, 484.13)
nap = c(598.15, 518.69, 601.49, 598.62, 555.73, 458, 488.57, 520.26, 534.71, 655.23, 573.18, 495.05)

alpha <- .05
coffee_sample_mean <- mean(coffee)
nap_sample_mean <- mean(nap)

coffee_sample_var <- var(coffee)
nap_sample_var <- var(nap)
m_not <- 490




test_stat <- round((coffee_sample_mean-m_not)/sqrt(coffee_sample_var/n.coffee), 2)
test_stat

p_value <- round(pt(test_stat,n.coffee-1, lower.tail = FALSE), 2)
p_value

p_value < alpha
