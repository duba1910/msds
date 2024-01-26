x_bar <- 53.87
n <- 15
sample_sd <- 6.82
sample_var <- sample_sd^2
m_not <- 50

t_crit <- qt(.95, n-1)

test_stat <- (x_bar-m_not)/sqrt(sample_var/n)

test_stat > t_crit 