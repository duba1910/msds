n <- 10
sample_sd <- 5.2
sample_var <- sample_sd^2
null_hyp <- 16

test_stat <- ((n-1)*sample_var)/null_hyp

pchisq(test_stat, n-1, lower.tail = FALSE)

