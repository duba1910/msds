 samp <- c(9.2229, 8.3665, 8.797058, 10.2195, 6.5629)
 samp_var <- sd(samp)^2
 deg_of_free <- length(samp)-1
 x_sq_crit_upper <- qchisq(.96, deg_of_free)
 x_sq_crit_lower <- qchisq(.04, deg_of_free)

 upper <- (deg_of_free*samp_var)/x_sq_crit_upper
 lower <- (deg_of_free*samp_var)/x_sq_crit_lower
 
 upper
 lower
