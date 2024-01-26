```R
# Load Required Packages
library(testthat)
```

# Problem 1

Your friend Chip claims to have "superhuman predictive skills." To test his claims, you decide to set up an experiment with coins, where Chip will guess the result of the flip, then you will flip the coin and record whether Chip guessed correctly. Assume all coins are fair.

Let $p$ be the proportion of flips that are guessed correctly. In the assignment for module 1, we discerned the null and alternative hypotheses to be:

\begin{align*}
    H_0:&\qquad p = 1/2 \\
    H_1:&\qquad p > 1/2
\end{align*}

**Part A)** Suppose we want to perform our hypothesis test at a significance level $\alpha=0.05$. Which type of test will we perform and which critical region should we use? Save the integer of the correct answer into `p1.a`.

1. Upper Tailed Test with critical region above $z_{0.05}$.
2. Upper Tailed Test with critical region above $z_{0.95}$.
3. Lower Tailed Test with critical region below $z_{0.05}$.
4. Lower Tailed Test with critical region below $z_{0.95}$.
5. None of the above.


```R
p1.a = 1

# your code here

```


```R
# Hidden Test Cell
```

**Part B)** You and Chip sit down, perform the experiment, and find that Chip correctly predicted the results of 60 out of 100 flips. At the $\alpha=0.05$ significance level, would the test indicate that Chip is or is not psychic? Into variable `p1.b`, save `TRUE` if the test says Chip is psychic and `FALSE` if the test says he is not psychic.

Hint: The sample proportion $\widehat{p}=60/100$ is a sample mean for a sample of size $100$ from the Bernoulli distribution. Use the Central Limit Theorem for a test on a mean.


```R
alpha = 0.05
z_crit <- qnorm(1-alpha)
n <- 100
yes <- 60
p_hat <- yes/n

p_value <- pnorm(.5, p_hat, sqrt((p_hat*(1-p_hat))/n))


p1.b = p_value < alpha

# your code here

```


```R
# Hidden Test Cell
```

**Part C)** Suppose that the null hypothesis is actually false. If we where to decrease the significance level to $\alpha=0.01$, what would happen to the power and to the probability of a Type II error? 

1. Both the power and the probability of Type II error would increase.
2. Both the power and the probability of Type II error would decrease.
3. The power would increase and the probability of Type II error would decrease.
4. The power would decrease and the probability of Type II error would increase.

Save the integer of the correct answer into variable `p1.c`.


```R
p1.c = 4

# your code here

```


```R
# Hidden Test Cell
```

**Part D)** Out of the 100 flips, what is the minimum number of flips that Chip would need to guess correctly in order to reject the null hypothesis at the $\alpha=0.01$ significance level? Save your answer as `p1.d`. Round your answer to the nearest whole number.


```R
alpha = 0.01
z_crit <- qnorm(1-alpha)
n <- 100
yes <- 62
p_hat <- yes/n

p_value <- pnorm(.5, p_hat, sqrt((p_hat*(1-p_hat))/n))
p_value<alpha

p1.d = yes

# your code here

```


TRUE



```R
qnorm(0.99, 0.5, sqrt((62/100)*(1 - 62/100)/100)) * 100
```


61.291777220422



```R
# Hidden Test Cell
```

# Problem 2

The same model of car is constructed at two different assembly plants, Plant A and Plant B. After extensive research, the life expentancy of cars from Plant A was found to follow a normal distribution, with an average of 250 thousand miles and a standard deviation of 100 thousand miles. Cars from plant B were harder to locate, and you where only able to amass a sample of 100 cars, the sample mean of which was 220 thousand miles. 

**Part A)** You want to determine if cars from Plant B actually have a shorter life expectancy than those from Plant A. Let $\mu$ be the true mean life expectancy of cars from Plant B. From the list below, which is the correct hypothesis test for this situation?

1. $H_0: \mu = 220 \qquad H_1: \mu < 220$
2. $H_0: \mu = 220 \qquad H_1: \mu \ne 220$
3. $H_0: \mu = 250 \qquad H_1: \mu < 250$
4. $H_0: \mu = 250 \qquad H_1: \mu \ne 250$
5. None of the above.

Save the interger of your selected choice into variable `p2.a`.


```R
p2.a = 3

# your code here

```


```R
# Hidden Test Cell
```

**Part B)** Determine the p-value of the test you chose in **Part A**. Save your answer as `p2.b`. Round your answer to four decimal places.


```R
h_zero <- 250
true_sd <- 100

n <- 100
sample_mean <- 220

p_val <- pnorm(sample_mean, h_zero, true_sd/sqrt(n))
round(p_val, 4)

p2.b = round(p_val, 4)

# your code here

```


0.0013



```R
# Hidden Test Cell
```

**Part C)** Based on your p-value, do cars produced at Plant B have a shorter expected lifespan than cars produced at plant A? Use a significance level of $\alpha = 0.01$. Into variable `p2.c`, enter `TRUE` if there is a statistically significant difference or enter `FALSE` if there is not a statistically significant difference.


```R
alpha <- .01
p2.c = p2.b<alpha

# your code here

```


```R
# Hidden Test Cell
```

**Part D)** Suppose that we have not yet collected information on cars from plant B, but still know the values for cars from Plant A. Which of the situations below would result in the test with the highest power?

1. You use a sample size of $n=100$, and the true mean lifespand of cars from plant B is $220$ thousand miles.
2. You use a sample size of $n=100$, and the true mean lifespand of cars from plant B is $175$ thousand miles.
3. You use a sample size of $n=300$, and the true mean lifespand of cars from plant B is $220$ thousand miles.
4. You use a sample size of $n=300$, and the true mean lifespand of cars from plant B is $175$ thousand miles.
5. All the above would have the same power.

Save the integer associated with your answer into variable `p2.d`.


```R
h_zero <- 250
true_sd <- 100

n <- 100
sample_mean <- 175

p_val <- pnorm(sample_mean, h_zero, true_sd/sqrt(n))

p_val

# 1 = 0.00134989803163009
# 2 = 3.1908916729109e-14
# 3 = 1.01727730727222e-07
# 4 = 6.93672895269885e-39  

p2.d = 4

# your code here

```


3.1908916729109e-14



```R
# Hidden Test Cell
```
