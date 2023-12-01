# Example 1
# Generating dataset to obtain range: minimum and maximum

data <- matrix(c(25, 30, 40, 70, 20, 10, 10, 15, 50), nrow=3, ncol=3)
min_max_range(data)


# Example 2
# Obtaining the range: data NASA

data(data_NASA)
min_max_range(data_NASA$cycle)

