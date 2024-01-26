n <- 20
sample_mean <- 13.8

h_zero <- 14
true_sd <- .08
z_crit <- qnorm(.975)

upper <- h_zero +
  (
    z_crit *
      (true_sd/sqrt(n))
  )

lower <- h_zero -
  (
    z_crit *
      (true_sd/sqrt(n))
  )

upper
lower