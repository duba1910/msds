# Transpose data in rows to data in columns

# Read in file
xbar.r <- read.delim("G:/My Drive/Coursera/Course 2 - Methods for Quality Improvement - Stability and Capability/Module 1 - Process Variation Process Control and Control Charts/xbar-r.dat")
View(xbar.r)

# Drop first 2 columns
xbar.r <- xbar.r[-c(1:2)]

# Transpose data
xbar.r.new<-transform.dependent.format.to.independent.format(data = xbar.r)
View(xbar.r.new)

# Create a sample column
xbar.r.new$sample<-rep(1:26)

# Drop the Cell column
xbar.r.new<-xbar.r.new[-1]

# Sort by sample
xbar.r.column<-xbar.r.new[order(xbar.r.new$sample),]
View(xbar.r.column)
