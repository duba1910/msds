n_one <- 200
y_one <- 167
p_hat_one <- y_one/n_one

n_two <- 200
y_two <- 178
p_hat_two <- y_two/n_two

p <- (y_one+y_two)/(n_one+n_two)

test_stat <- (p_hat_one-p_hat_two)/
  sqrt(
    (p*(1-p))*(
      (1/n_one)+(1/n_two)
    )
  )

round(pnorm(test_stat), 3)
