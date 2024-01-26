# Module 1 Programming Assignment


```R
# Load Required Libraries
library(testthat)
```

# Problem 1

Your friend Chip claims to have psychic abilities, and "superhuman predictive skills." To test this theory, you create an experiment with coins, where Chip guesses the result of the flip, then you flip the coin, and record whether he was right. Assume the coin is fair.

**Part A)** Let $p$ be the proportion of flips that are guessed correctly. From the list below, which null and alternative hypotheses are associated with Chip being **better** at predicting than a normal person? Save the interger of your selected answer into `p1.a`.

1. $H_0: p=0, \qquad H_1: p < 0$
2. $H_0: p=0, \qquad H_1: p>0$
3. $H_0: p=1/2, \qquad H_1: p > 1/2$
4. $H_0: p=1/2, \qquad H_1: p < 1/2$


```R
p1.a = 3

# your code here

```


```R
# Hidden Test Cell
# Note: Any cell marked with "Hidden Test Cell" contains tests that will check your answers.
# You may or may not see these tests. If you do not see the tests, that means they are hidden.
# You won't see the results of hidden tests until you submit your assignment.
```

**Part B)** There are four possibilities for the result of the test:
1. The test indicates that Chip is psychic, and in reality Chip is psychic.
2. The test indicates that Chip is psychic, and in reality Chip is not psychic.
3. The test indicates that Chip is not psychic, and in reality Chip is psychic.
4. The test indicates that Chip is not psychic, and in reality Chip is not psychic.

Each of these cases correspond to one of the following results:

a. We correctly reject the null hypothesis.  
b. We correctly fail to reject the null hypothesis.  
c. We commit Type I error.  
d. We commit Type II error.  

Match the corresponding cases together into variables `p1.b.1`, `p1.b.2`, `p1.b.3` and `p1.b.4`. That is, if result $1$ matches with $a$, then your answer to `p1.b.1` would be `"a"` $\rightarrow$ `p1.b.1="a"`.


```R
p1.b.1 = "a"
p1.b.2 = "c"
p1.b.3 = "d"
p1.b.4 = "b"

# your code here

```


```R
# Hidden Test Cell
test_that("Make sure your answers are strings!", {expect_is(p1.b.1, "character")
                                                  expect_is(p1.b.2, "character")
                                                  expect_is(p1.b.3, "character")
                                                  expect_is(p1.b.4, "character")})
```


```R
# Hidden Test Cell
```


```R
# Hidden Test Cell
```


```R
# Hidden Test Cell
```

Keep this problem in mind, we will continue it in the next module!

# Problem 2

The Normal distribution will become very important in the upcoming modules, so it's a good idea to review it now, and make sure we understand it before moving forward. As well, we can also review R's distribution functions.

**Part A)** Suppose $X \sim N(10, 4)$. What is $P(X \le 9)$? Save your answer as `p2.CDF` and round your answer to two decimal places.  

**Hint:** Use the `pnorm()` function. Be careful about the parameters!


```R
mean <- 10
var <- 4
sd <- sqrt(var)
z <- (9-10)/sd

pnorm(9, mean, sd)
pnorm(z)

p2.CDF = round(pnorm(9, mean, sd), 2)

# your code here

```


0.308537538725987



0.308537538725987



```R
# Hidden Test Cell
```

**Part B)** Given the same $X$ as in **Part A**, what is the value $k$ such that $P(X \le k) = 0.75$? Save your answer as `p2.invCDF` and round your answer to two decimal places.

**Hint:** Use the `qnorm()` function. Be careful with the parameters!


```R
mean <- 10
var <- 4
sd <- sqrt(var)
z_crit <- .75

qnorm(.75, mean, sd)
p2.invCDF = round(qnorm(.75, mean, sd), 2)

# your code here

```


11.3489795003922



```R
# Hidden Test Cell
```

**Part C)** Convert $X$ to a standard normal random variable $Z \sim N(0, 1)$ and calculate the values for **Part A** and **Part B** again, but using the transformed random variable. Save your answers as `p2.c.CDF` and `p2.c.invCDF` and round your answers to two decimal places. What do you notice?

Note that transforming $X$ will also transform the values within each equality. That is, the $9$ from **Part A** will be transformed to $y$, and you must solve for $P(Z \le y)$. Likewise, the $k$ from **Part B** will be transformed to $\ell$, and you must solve for $\ell$ such that $P(Z \le \ell)=0.75$.


```R
mean <- 10
var <- 4
sd <- sqrt(var)
round(pnorm(-.5), 2)
round(qnorm(.75,), 2)
p2.c.CDF = round(pnorm(-.5), 2)
p2.c.invCDF = round(qnorm(.75,), 2)

# your code here

```


0.31



0.67



```R
# Hidden Test Cell
```

**Part D)** Suppose $X_1, \dots, X_8 \stackrel{\text{iid}}{\sim} N(14, 4)$. What is $P(\bar{X} \ge 14.5)$? Save your answer as `p2.d` and round your answer to two decimal places.


```R
n <- 8
mean <- 14
var <- 4

1-pnorm(14.5, mean, sqrt(var/n))

p2.d = round(1-pnorm(14.5, mean, sqrt(var/n)), 2)

# your code here

```


0.239750061093477



```R
# Hidden Test Cell
```

**Part E)** There are two distribution functions that we haven't used yet: `dnorm()` and `rnorm()`. So let's use them!

Generate 500 samples from a standard normal distribution (Hint: Use `rnorm()` to sample these values) and plot a histogram of their values. Make sure your histogram is displaying densities, not frequencies. Then use the `lines()` function to plot the PDF of the standard normal (Hint: Use `dnorm()` to get the PDF) ontop of the histogram. Save your histogram as `p2.hist`.


```R
data<-rnorm(500)

p2.hist=hist(data,freq=FALSE)

x <- seq(-5, 5, length=100000)
lines(x,dnorm(x))


# your code here

```


![png](output_27_0.png)



```R
# Hidden Test Cell
```

# Problem 3

Over the last few weeks, you have gone birdwatching at your local park and recording the number of distinct bird species that you saw each day. Your recorded counts where $(11, 6, 10, 7, 6, 9, 12, 11, 11)$. However, when walking through the park, you found a sign which stated that visitors should only expect to see 8 bird species each day.

Use hypothesis testing to determine whether this claim is accurate, based on the data you've seen. Use a significance level of $\alpha =0.05$. Assume all random variables are normally distributed, and that the true standard deviation of bird species is $2$. Save `TRUE` into `p3` if you reject the null hypothesis, and `FALSE` if you fail to reject the null hypothesis.


```R

alpha = 0.05
bird.counts = c(11, 6, 10, 7, 6, 9, 12, 11, 11)
mean(bird.counts)
length(bird.counts)
mean <- mean(bird.counts)
var <- var(bird.counts)
n <- length(bird.counts)
h_zero <- 8
z_crit <- qnorm(1-alpha)
var <- 2
c <- h_zero+(z_crit*sqrt(var/n))
c<mean



p3 = c<mean

# your code here

```


9.22222222222222



9



FALSE



```R
# Hidden Test Cell
```
