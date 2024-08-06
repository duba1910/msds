require(lolcat)

data<-c(6.649, 6.639, 6.629, 6.642, 6.624, 6.616, 6.649, 6.654, 6.649, 6.642, 6.649, 6.637, 6.649, 6.647, 6.644, 6.657, 6.654, 6.634, 6.644, 6.649)
df<-data.frame(data)

spc.run.chart(chart.series = df$data) 
frequency.dist.ungrouped(df$data)
frequency.polygon.ungrouped(df$data)

