require(lolcat)
body <- read.table( "body.txt", header = TRUE)

cor(body$height, body$weight, method="pearson")

