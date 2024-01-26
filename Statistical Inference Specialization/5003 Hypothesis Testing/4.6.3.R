n_one <- 8
sample_var_one <- 13.2
n_two <- 6
sample_var_two <- 15.1
alpha <- .03

test_stat <- sample_var_two/sample_var_one

f_crit <- qf(1-(alpha/2), n_two-1, n_one-1)
pf(test_stat, n_two-1, n_one-1, lower.tail = FALSE)
test_stat
f_crit