

samp <- c(2781, 2900, 3013, 2856, 2888)
sample_mean <- mean(samp)
n <- length(samp)

running_total <- 0
for (i in samp) {
  running_total = running_total + (i-sample_mean)^2
}

running_total
sample_var <- running_total/(n-1)
sample_sd <- sqrt(sample_var)
sd(samp)

tcrit <- qt(.025, n-1)

lower <- sample_mean - (tcrit*(sample_sd/sqrt(n)))
upper <- sample_mean + (tcrit*(sample_sd/sqrt(n)))
upper
lower
