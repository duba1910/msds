# Run this cell to load necesary libraries for autograder
library(testthat)

n.1 = 500
n.2 = 400
phat.1 = 385/n.1
phat.2 = 267/n.2 
confidence_level = .95
z_value <- qnorm(1-(1-confidence_level)/2)

margin_of_error = z_value *sqrt((phat.1*(1-phat.1)/n.1) + (phat.2*(1-phat.2)/n.2))

ci_lower <- (phat.1-phat.2)-margin_of_error
ci_higher <- (phat.1-phat.2)+margin_of_error


# Replace each NA with your answers after you work out code to solve the problem below.
p1.a.lower = ci_lower
p1.a.upper = ci_higher 
p1.a.are_different = ci_higher < 0 || ci_lower > 0 #Replace this NA with either TRUE or FALSE

# your code here


sqrt((phat.1*(1-phat.1)/n.1) + (phat.2*(1-phat.2)/n.2))

# Hidden Test Cell

# Replace the NA with your answer after you work out code to solve the problem below.
new.level = .9994

# your code here


# Hidden Test Cell

# Run this cell
times.A = c(44.84, 44.17, 38.2, 45.2, 38.83, 
            47.38, 42.36, 38.1, 36.51, 35.1, 
            35.52, 33.43, 44.86, 43.49, 39.05)

# Run this cell
qqnorm(times.A)
qqline(times.A)

# Placeholders for your answers
p2.a.lower = 3.21
p2.a.upper = 6.91

# your code here


# Hidden Test Cell

#wrong

# Placeholder for your answer
#23.68
#26.12
#27.77
#10.30
#47.78
#11.35
#10.29
p2.b.upper =(length(times.A) - 1) *  var(times.A) / qchisq(0.05, length(times.A) - 1) 

# your code here


# Hidden Test Cell

times.B = c(35.22, 45.46, 34.32, 51.75, 39, 52.07, 
            39.52, 36.17, 42.15, 42.16, 31.92, 48.32,
            35.28, 44.01, 44.97, 42.83, 41.29, 43.19
)

p2.c.lower = .21 
p2.c.upper = 1.68

# your code here


# Hidden Test Cell

# PLaceholder for answer. Ignore "Code here". No code is required
p2.d = TRUE

# your code here


# Hidden Test Cell
