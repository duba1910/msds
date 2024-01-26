deg_of_free <- (4-1)

candy_d <- c(6, 9, 8, 10, 9, 11)
candy_c <- c(11, 12, 15, 10, 13, 14)
candy_b <- c(18, 20, 14, 15, 17, 14)
candy_a <- c(14, 10, 13, 15, 11, 11)

test_stat <- (((sum(candy_a)-75)^2)/75)+
  (((sum(candy_b)-75)^2)/75)+
  (((sum(candy_c)-75)^2)/75)+
  (((sum(candy_d)-75)^2)/75)


p2.b = round(pchisq(test_stat, deg_of_free, lower.tail = FALSE), 3)

test_stat
p2.b

p2.b>.05
