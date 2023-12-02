# Example 1
# Generating dataset to split into samples as univariate dataset

data <- matrix(c(25, 30, 40, 70, 20, 10), nrow=6, ncol=1)
split_unv(data, n_steps = 3)

# Example 2
# Generating dataset with data NASA, split the temperature with split_unv
# function to obtain samples as univariate dataset

data(data_NASA)
temperature <- data_NASA$temperature_measured
split_unv(temperature, n_steps = 3)
