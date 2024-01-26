test_stat <- (((292-300)^2)/300)+
  (((190-175)^2)/175)+
  (((18-25)^2)/25)

round(pchisq(test_stat, 2, lower.tail = FALSE), 2)
