# Example 1
# Generating dataset, use the min_max_range function to obtain range and
# use the norm_min_max function with scaler argument equal to transform

data <- matrix(c(25, 30, 40, 70, 20, 10), nrow=2, ncol=3)
inf <- min_max_range(data)
norm_min_max(data, inf, scaler='transform')
