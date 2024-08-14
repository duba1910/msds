library(lolcat)
require(lolcat)
# Set the working directory to where your script and data file are located
setwd("C:/Users/dusti/OneDrive/Documents/GitHub/msds/Data Science Methods for Quality Improvement/5704 Managing, Describing, and Analyzing Data/m_5/")

# Load your R script
source("quiz_two_sample_hyp_testing_toollife.R")

ro<-round.object
nqtr<-function(x,d){noquote(t(round.object(x, d)))}
toollife <- read.table( "ToolLife.dat", header = TRUE)
Straight <- read.table( "Straight", header = TRUE)

aggregate(life ~ vendor, data = toollife, FUN = mean)
aggregate(life ~ vendor, data = toollife, FUN = var)

