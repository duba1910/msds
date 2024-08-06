require(lolcat)

cfm<-c(68,72,72,74,72,69,75,75,72,73,70,71,71,72,73,72,70,72,73,74)
fans<-data.frame(cfm)
View(fans)

castings <- read.table( "castings.txt", header = TRUE)
castings3 <- read.table( "castings3.txt", header = TRUE)

### Run Chart ####

#Run chart
spc.run.chart(chart.series = fans$cfm, main = "Run Chart: Computer Fans"
              ,ylab = "CFM",pch = 19, cex=1.5, col="blue", lty=1, lwd=2
              ,type = "o")
mean(fans$cfm)
abline(h=72)

###Frequency Distributions ####

#Ungrouped Frequency Distribution
frequency.dist.ungrouped(fans$cfm)

#Grouped Frequency Distribution
frequency.dist.grouped(castings$weight)

#### Frequency Polygon and Histogram  ####
frequency.dist.ungrouped(fans$cfm)
frequency.polygon.ungrouped(fans$cfm, main="Ungrouped Freq Polygon: Fans Data",xlab="CFM")
frequency.polygon.grouped(castings$weight, main="Grouped Frequency Polygon: Casting Weight",xlab="Casting Weight")

hist.ungrouped(fans$cfm, main="Ungrouped Histogram",xlab="CFM")
hist.grouped(castings$weight, main="Grouped Histogram: Castings",xlab="Weight")

#### Density Plots ####
hist.grouped(castings$weight, xlab="Weight", freq=F)
lines(density(castings$weight))

plot(density(castings$weight), main="Density Plot of Casting Weight", xlab="Weight")

dp<-density(castings$weight)
plot(dp, main="Density Plot of Casting Weight", xlab="Weight")
polygon(dp, col="red", border="black")


#### Boxplots ####
boxplot(castings$weight, main="Boxplot of Casting Weight", ylab="Weight")
boxplot(castings$weight, main="Boxplot of Casting Weight", ylab="Weight", notch=T)
boxplot(weight ~ mold, data = castings3, main="Boxplot of Casting Weight by Mold", ylab="Weight") 

#### Central Tendency ####
# Create data file
weight<-c(65,67,36,37,36,57,53,39,38,58)
preform<-data.frame(weight)
View(preform)

# Calculate the mean of the ungrouped data
mean(preform$weight)

# Calculate the mean from grouped data
# Assign the output of the grouped frequency distribution
# to a variable called "fdcast"
(fdcast<-frequency.dist.grouped(castings$weight))

# Look at the structure of fdcast
str(fdcast)

# Create a vector of the midpoints of each class
# interval in the frequency distribution
# (put in parentheses to view output)
(midpts<-fdcast$midpoint)

# Create a vector of the frequency of each class
# interval in the frequency distribution
# (put in parentheses to view output)
(freq<-fdcast$freq)

# Use the weighted mean command in the base package
# to calculate the  mean of the grouped data
weighted.mean(x = midpts, w = freq)

# For comparison, calculate the ungrouped mean of the 
# Casting Weight data
mean(castings$weight)

# Weighted Mean
wt<-c(0.2, 0.4, 0.4)
x<-c(88, 85, 92)
weighted.mean(x = x, w = wt)

# Median
median(preform$weight)

# Mode 
table(preform$weight)
sample.mode(preform$weight)


# What if there are 2 modes? Add in another 57
weight<-c(65,67,36,37,36,57,53,39,38,58,57)
preform<-data.frame(weight)
View(preform)

# Calculate the Mode
sample.mode(preform$weight)

#### Position ####
# Create data file
weight<-c(65,67,36,37,36,57,53,39,38,58)
preform<-data.frame(weight)
View(preform)

# Find the minimum (lowest) value in the data set
min(preform$weight)

# Find the maximum (highest) value in the data set
max(preform$weight)

# Find the minimum and maximum in the data set
summary(preform$weight)

# Find the 30th percentile of the preform data
quantile(x = preform$weight, probs = 0.30)


#####Dispersion####
# Create data file
weight<-c(65,67,36,37,36,57,53,39,38,58)
preform<-data.frame(weight)
View(preform)

# Find the range of values in the data set
range(preform$weight)
rng<-range(preform$weight)
rng[2]-rng[1]

# Find the Interquartile Range of the data set
IQR(preform$weight)

# Find the standard deviation of the data set
sd(preform$weight)
round.object(sd(preform$weight),2)


#####Shape####
# Calculate skewness for the castings data
skewness(castings$weight)
round.object(skewness(castings$weight),3)

# Calculate kurtosis for the castings data
kurtosis(castings$weight)
round.object(kurtosis(castings$weight),3)

# Calculate descriptive statistics using the summary.continuous command
summary.continuous(castings$weight, stat.sd=T)
round.object(summary.continuous(castings$weight, stat.sd=T),3)

# Transpose the output and remove the quotes
t(round.object(summary.continuous(castings$weight, stat.sd=T),3))
noquote(t(round.object(summary.continuous(castings$weight, stat.sd=T),3)))

# Create a function to round, transpose and remove the quotes
nqtr<-function(x,d){noquote(t(round.object(x, d)))}
nqtr(summary.continuous(castings$weight),3)

### Relationship ###
# Transform castings3 data from independent to dependent format
castnew<-transform.independent.format.to.dependent.format(fx = weight~mold, data = castings3)

# View current column names
colnames(castnew)

# Rename column headings
colnames(castnew)[1:3] <-c("Mold_1","Mold_2", "Mold_3")

# View new column heading names
View(castnew)

# Calculate Pearson Product-Moment Correlation Coefficient
cor(x = castnew$Mold_1, y = castnew$Mold_2, method = "pearson")