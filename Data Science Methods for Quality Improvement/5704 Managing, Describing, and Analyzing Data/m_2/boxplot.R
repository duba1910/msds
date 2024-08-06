require(lolcat)
castings <- read.table( "castings.txt", header = TRUE)
castings3 <- read.table( "castings3.txt", header = TRUE)
summary(castings$weight)

boxplot(castings$weight, main="Boxplot of Casting Weight", ylab="Weight")

boxplot(castings$weight, main="Boxplot of Casting Weight", ylab="Weight", notch=T)

boxplot(weight ~ mold, data = castings3, main="Boxplot of Casting Weight by Mold", ylab="Weight") 
