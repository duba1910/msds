require(lolcat)
viscosity <- read.table( "viscosity.txt", header = TRUE)

frequency.dist.grouped(viscosity$centistokes)
hist.grouped(viscosity$centistokes)
boxplot(viscosity$centistokes)
summary(viscosity$centistokes)
