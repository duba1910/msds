dog <- c(41, 76, 80, 38)
cat <- c(28, 54, 56, 27)



total <- sum(dog) + sum(cat)

running <- 0
for (i in 1:4) {
  expectd <- (sum(dog)*(dog[i]+cat[i]))/total
  var <- ((dog[i] - expectd)^2)/expectd
  running <- running + var
}
for (i in 1:4) {
  expectd <- (sum(cat)*(dog[i]+cat[i]))/total
  var <- ((cat[i] - expectd)^2)/expectd
  running <- running + var
}
test_stat <- running
deg_of_free <- (4-1)*(2-1)

p_val <- pchisq(test_stat, deg_of_free, lower.tail = FALSE)
alpha = 0.05
p3.b.pval = round(p_val, 4)
p3.b = p3.b.pval > alpha
