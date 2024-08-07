# A batch of 480 bottles has been produced at a local microbrewery. 
# At various times throughout production, 8 known defective bottles were made. 
# They were accidentally mixed in the good bottles. 
# What is the probability of finding one of the 8 defective bottles 
# if you were to randomly select a bottle from the total lot of 480? 
round(8/480, 4)

# Assume that a batch of incoming parts has a defective rate of 2%  or 0.02 
# (A part is either defective or not defective).
# A sample of 400 parts is drawn and inspected.
# What is the probability of finding 4 or fewer defectives? 
pbinom(q = 4, size = 400, prob = 0.02, lower.tail = T)


# A warehouse team member has been monitoring the daily shipment rate of automobile accessories.
# On average, the number of pallets per day that have been shipped is 65 (lambda).
# The shipment rate has been statistically stable and has been shown to be representative of a Poisson function.
# The warehouse manager recently asked what the probability of shipping 50 pallets or more in a day was.
ppois(q = 49, lambda = 65, lower.tail = F)

# A normally distributed process has typically run at a mean of 153 with a sd of 10.
# The specifications for the part are 159 ± 5 (meaning the upper specification limit is 164
# and the lower specification limit is 154).
# What is the probability that a single part selected at random from a standard lot will be out of specification? 
lower<-pnorm(q = 154, mean = 153, sd = 10, lower.tail = T)
upper<-pnorm(q = 164,mean = 153, sd = 10, lower.tail = F)
total=lower+upper
round.object(total,4)


# A manufacturing company that makes AC motors has recently performed an analysis of their in-service motors.
# They discovered that the mean time to failure (mean) has been found to be 40,000 hours and is exponentially distributed.
# (Xmin=0). What is the probability that a single randomly selected motor will run 10,000 hours or less? 

round(pexp(q = 10000, rate = 1/40000, lower.tail = T), 4)
