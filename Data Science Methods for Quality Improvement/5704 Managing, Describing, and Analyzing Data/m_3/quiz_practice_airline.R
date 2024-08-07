require(lolcat)
airline <- read.table( "airline.dat", header = FALSE)


# Read the file into a variable
lines <- readLines("airline.dat")

# Initialize an empty list to store fixed lines
fixed_lines <- list()

# Iterate through each line and fix lines with fewer than 5 elements
for (line in lines) {
  elements <- unlist(strsplit(line, "\t"))
  if (length(elements) < 5) {
    elements <- c(elements, rep("0", 5 - length(elements)))
  }
  fixed_lines <- c(fixed_lines, paste(elements, collapse = "\t"))
}

# Convert fixed lines to a data frame
data_matrix <- do.call(rbind, lapply(fixed_lines, function(x) strsplit(x, "\t")[[1]]))
colnames(data_matrix) <- data_matrix[1, ]
data_matrix <- data_matrix[-1, ]
airline_df <- as.data.frame(data_matrix, stringsAsFactors = FALSE)

# Convert appropriate columns to numeric
airline <- transform(airline_df, 
                        Price = as.numeric(Price), 
                        Number_of_Hours_Late = as.numeric(Number_of_Hours_Late), 
                        Number_Cancelled_per_Day_per_500 = as.numeric(Number_Cancelled_per_Day_per_500), 
                        Bag_Delivery_Time = as.numeric(Bag_Delivery_Time), 
                        Number_Lost_Bags = as.numeric(Number_Lost_Bags))

price_data <- airline$Price[0:5400]

(normout<-dagostino.normality.omnibus.test(price_data))#normal = p>=.05
(skkupvals<-c(normout$estimate[6], normout$estimate[12]))#normal = p>=.05

# For the data associated with Ticket Prices: What percentage of the population of the passengers
# flying during the period represented by these data paid less than $930.00 for their ticket?
pnorm(q = 930, mean = mean(price_data), sd = sd(price_data), lower.tail = T)

# For the data associated with Number of Cancelled Flights per Day per 500:
# If I took 20 flights during the period of time represented by these data, 
# what is the probability that I had at least 2 flights canceled?

cancel_data = airline$Number_Cancelled_per_Day_per_500[0:450]
mean_cancel = mean(cancel_data)
prob_cancel = mean_cancel/500
1- pbinom(q = 1 , size = 20 , prob = prob_cancel, lower.tail = T)

# If you and I independently arrived for a flight (different destinations & flights)
# on any given day represented by the period of time associated with these data,
# what is the probability (expressed in a percentage) that both of us would have our flight canceled?

prob_cancel^2


# For the data associated with Baggage Delivery Time at the Carousel: 
# What percentage of the population of the passengers flying during the
# period represented by these data arrived at the carousel, waited 15 minutes, 
# and THEN had to wait at least 25 MORE minutes for their bag to arrive (40 minutes or more total wait time).

bag_data = airline$Bag_Delivery_Time[0:75]
mean_bag_time = mean(bag_data)
pexp(q = 25-15, rate = 1/(mean_bag_time-15), lower.tail = F)

# find p value


# Calculate the probability of exactly 5 lost bags using the Poisson distribution
lost_bag_data = airline$Bag_Delivery_Time[0:50]
mean_lost_bags <- mean(lost_bag_data, na.rm = TRUE)
dpois(5, lambda = mean_lost_bags)

ppois(5, lambda = mean_lost_bags, lower.tail = TRUE)

ppois(9, lambda = mean_lost_bags, lower.tail = FALSE)
