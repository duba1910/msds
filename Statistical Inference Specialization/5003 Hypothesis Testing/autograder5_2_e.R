deg_of_free <- (4-1)
alpha = .05

candy_d <- c(6, 9, 8, 10, 9, 11)
candy_c <- c(11, 12, 15, 10, 13, 14)
candy_b <- c(18, 20, 14, 15, 17, 14)
candy_a <- c(14, 10, 13, 15, 11, 11)

test_stat <- (((sum(candy_a)-(300*.25))^2)/(300*.25))+
  (((sum(candy_b)-(300*.35))^2)/(300*.35))+
  (((sum(candy_c)-(300*.25))^2)/(300*.25))+
  (((sum(candy_d)-(300*.15))^2)/(300*.15))



p2.e.pval = round(pchisq(test_stat, deg_of_free, lower.tail = FALSE), 3)
p2.e = p2.e.pval > alpha


test_stat
round(pchisq(test_stat, deg_of_free, lower.tail = FALSE), 3)
p2.e.pval > alpha