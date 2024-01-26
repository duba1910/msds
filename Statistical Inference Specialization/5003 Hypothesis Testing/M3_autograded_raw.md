# Module 3 Autograded Assignment


```R
# Load required libraries
library(testthat)
```

# Problem 1

For each of the following questions, decide which of the following tests would be most appropriate.

1. z-test
2. t-test
3. The test is not possible.

For each answer, save the **integer** corresponding to the correct answer.

**Part A)** You are measuring the average calorie intake across teenage boys and teenage girls. You get two samples, one of boys and one of girls. The sample of boys has 12 participants, and leads to a sample mean of 2637 calories with a sample standard deviation of 1138. The sample of girls has 11 participants, has a sample mean of 2258 calories and a sample standard deviation of 1519. At an $\alpha = 0.05$ significance level, do boys consume more than girls by at least 200 calories per day? Assume that the sampling distribution is normal.

Select the **integer** of the test should be used for this situation. Save your answer as `p1.a`.


```R
p1.a = NA

# your code here

```


```R
# Hidden Test Cell
```

**Part B)** You repeat the same experiment as **Part A)**, but have more time to collect larger sample sizes. The sample of boys has a sample size of 63, with a sample mean of 2663 calories and a sample standard deviation of 895. The sample of girls has a sample size of 71, with a sample mean of 2190 with a sample standard deviation of 1448. At an $\alpha=0.05$ significance level, do boys consume more than girls by at least 200 calories per day? Assume that the sampling distribution is normal.

Select the **integer** of the test should be used for this situation. Save your answer as `p1.b`.


```R
p1.b = NA

# your code here

```


```R
# Hidden Test Cell
```

**Part C)** You spend some more time analyzing the data from **Part B**, and eventually come to the conclusion that the sampling distribution is not normal, it actually follows a Gamma distribution.

Select the **integer** corresponding to the test should be used for this situation. Save your answer as `p1.c`.


```R
p1.c = NA

# your code here

```


```R
# Hidden Test Cell
```

**Part D)** Suppose that in an alternate universe, instead of spending time gathering a larger sample, you spent that time researching the "true" distributions of teenagers' calorie consumption. In that research, you found that boys have a true standard deviation of 932 calories and girls have a true standard deviation of 1071 calories. You have the same sample values as in **Part A)**.

Select the **integer** of the test should be used for this situation. Save your answer as `p1.d`.


```R
p1.d = NA

# your code here

```


```R
# Hidden Test Cell
```

# Problem 2

Recently, Ralphie has been feeling sluggish during her regular "Running With Ralphie" event. She knows there are things that she could do to potentially improve her responsiveness, such as drinking coffee or taking a nap, but she wants to be sure. Being the Data Scientist that she is, she decides to create a experiment to test whether the different situations actually improve her reaction time. For each method, she does as the method requires, and a few hours later she has her handlers record her reaction time. These values are recorded in the `nap` and `coffee` variables. She tested the coffee method 10 times and the nap method 12 times. 

Ralphie also knows, from her supreme buffalo intuition, that her average reaction time is 490 units and that her reaction time measurements are normally distributed.


```R
# Sample size of each test
n.coffee = 10
n.nap = 12
# The reaction time data for each method
coffee = c(485.77, 490.86, 460.79, 528.74, 483.47, 526.24, 504.78, 460.7, 587.08, 484.13)
nap = c(598.15, 518.69, 601.49, 598.62, 555.73, 458, 488.57, 520.26, 534.71, 655.23, 573.18, 495.05)
```

**Part A)** Determine, at the $\alpha=0.05$ significance level, if drinking coffee improved Ralphie's reaction time. For this, you will need to calculate an appropriate test statistic. Store this value as `p2.a.stat` and round the value to two decimal places. Then calculate the p-value for this test statistic. Store this value in `p2.a.p` and round it to two decimal places.


```R
p2.a.stat = NA
p2.a.p = NA

# your code here



```


```R
# Hidden Test Cell
```

**Part B)** Based on your answers to **Part A**, does drinking coffee improve Ralphie's reaction time at the $\alpha=0.05$ significance level? Your answer should be the boolean `TRUE` if coffee improves her reaction time, and `FALSE` if it does not. Save your answer into variable `p2.b`. 


```R
p2.b = NA

# your code here

```


```R
# Hidden Test Cell
```

**Part C)** Assuming that the true (unknown) variances for nap and coffee reaction times are equal, determine if there sufficient evidence, at the $\alpha = 0.05$ significance level, to conclude that taking a nap promotes faster reaction time than drinking coffee. Again, calculate an appropriate test statistic and save it into variable `p2.c.stat`. Round this value to two decimal places. Then calculate the p-value for this test statistic and save it into variable `p2.c.p`. Round this value to three decimal places.


```R
p2.c.stat = NA
p2.c.p = NA

# your code here


```


```R
# Hidden Test Cell
```

**Part D)** Based on your answers to **Part C)**, is there sufficient evidence at the $\alpha = 0.05$ significance level to conclude that taking a nap promotes faster reaction time in Ralphie than drinking coffee? Save your answer into variable `p2.d`. Save the boolean value `TRUE` if naps do result in Ralphie having a statistically significant faster reaction time than coffee, and `FALSE` otherwise.


```R
p2.d = NA

# your code here

```


```R
# Hidden Test Cell
```

# Question 3

Now that you've learned about hypothesis testing and p-values, you should also be aware that these methods can be used incorrectly. Or, even worse, maliciously. Usually it involves manipulating the data or the test in such a way to produce a desired result. There's many methods for this, and they've got some cool names like [p-hacking and data dredging](https://www.explainxkcd.com/wiki/index.php/882:_Significant). In this problem, we will focus on the idea of using subsets of data to find a desired result.

Nefarian just landed his first data science position as an intern at a new e-commerce company. His project was the design and test a new website layout that would lead to more purchases. To test his new layout, the company gathered four different groups of 50 customers and recorded how many of those ended up purchasing an item. This test was then repeated on multiple days. The effectiveness of Nefarian's layout is measured by the number of customers that made a purchase. This data is stored in the data frame `purchases`.

Nefarian wants to land a permanent position at the company after his internship is over, so he really wants to impress his supervisors with his new layout. He knows that the site has an average purchase rate of $0.8$ and wants to see if his layout is an improvement.


```R
purchases = read.csv("purchases.csv")
purchases = purchases[,-1]
names(purchases) = c("group", "num_purchases")
head(purchases)
```

**Part A)** Use the entire dataset to determine whether Nefarian's layout is an improvement over the original layout. Use an appropriate hypothesis test and a significance level of $\alpha=0.05$. Store the p-value for this test in the variable `p3.a` and round your answer to two decimal places.

**Note**: In case you haven't see a data frame before, think of it like a spreadsheet where each row is an instance each data and each column is a vector of specific values. To access the values in the "num_purchases" column, use `purchases$num_purchases`.


```R

# your code here


```


```R
# Hidden Test Cell
```

**Part B)** Based on your results from **Part A**, is Nefarian's layout an improvement over the original layout? Save your answer as `p3.b`. Save the boolean `TRUE` if it is a statistically significant improvement or `FALSE` if it is not.


```R
p3.b = NA

# your code here

```


```R
# Hidden Test Cell
```

**Part C)** Bummer. But Nefarian *really* wants his design to be an improvement, so what's a little bad science? What if he can find a subset of data that supports his claim? Thinking back, Nefarian remembers that Group C supposedly contained some very impulsive customers. Using the same hypothesis from **Part A**, determine if Nafarian's layout was a statistically significant improvement at the $\alpha=0.05$ significance level, if he only looks at samples from Group C. Save the p-value of this test as `p3.c`, rounded to three decimal places.

**Note:** To filter the dataframe to only contain data for Group C, use `purchases[purchases$group=="c",]`.


```R
p3.c = NA

# your code here

```


```R
# Hidden Test Cell
```

**Part D)** Based on your results from Group C, is Nefarian's layout a statistically significant improvement over the original layout? Save your answer as `p3.d`. Save the boolean `TRUE` if it is a statistically significant improvement and `FALSE` otherwise.


```R
p3.d = NA

# your code here

```


```R
# Hidden Test Cell
```
