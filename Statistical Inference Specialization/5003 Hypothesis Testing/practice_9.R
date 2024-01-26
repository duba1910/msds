test_stat <- (((26-22)^2)/22)+
  (((18-22)^2)/22)+
  (((29-33)^2)/33)+
  (((37-33)^2)/33)

pchisq(test_stat, 1, lower.tail = FALSE)
