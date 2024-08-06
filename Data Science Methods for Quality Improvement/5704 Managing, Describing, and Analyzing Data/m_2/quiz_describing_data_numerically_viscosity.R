require(lolcat)
viscosity <- read.table( "viscosity.txt", header = TRUE)

summary(viscosity$centistokes)
range(viscosity$centistokes)
frequency.dist.ungrouped(viscosity$centistokes)

range(viscosity$centistokes)[2]-range(viscosity$centistokes)[1]

quantile(viscosity$centistokes, probs = .45)
  
quantile(viscosity$centistokes, probs = .25)
summary(viscosity$centistokes)