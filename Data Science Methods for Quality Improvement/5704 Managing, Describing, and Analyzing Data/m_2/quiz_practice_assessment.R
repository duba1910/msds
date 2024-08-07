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
airline_df <- transform(airline_df, 
                        Price = as.numeric(Price), 
                        Number_of_Hours_Late = as.numeric(Number_of_Hours_Late), 
                        Number_Cancelled_per_Day_per_500 = as.numeric(Number_Cancelled_per_Day_per_500), 
                        Bag_Delivery_Time = as.numeric(Bag_Delivery_Time), 
                        Number_Lost_Bags = as.numeric(Number_Lost_Bags))

# Calculate the mean of the Price column
mean(airline_df$Price, na.rm = TRUE)
var(airline_df$Price, na.rm = TRUE)
IQR(airline_df$Price, na.rm = TRUE)
range(airline_df$Price, na.rm = TRUE)
rng <- range(airline_df$Price, na.rm = TRUE)
rng[2] - rng[1]
skewness(airline_df$Price)
kurtosis(airline_df$Price)
