require(lolcat)

data<-c(6.649, 6.639, 6.629, 6.642, 6.624, 6.616, 6.649, 6.654, 6.649, 6.642, 6.649, 6.637, 6.649, 6.647, 6.644, 6.657, 6.654, 6.634, 6.644, 6.649)
df<-data.frame(data)

mean(df$data)
median(df$data)
sample.mode(df$data)

hist.grouped(df$data, xlab="Weight", freq=F)
lines(density(df$data))

sd(df$data)
var(df$data)
