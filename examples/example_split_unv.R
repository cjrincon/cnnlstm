# Example 1
# Generating dataset to split into samples as univariate dataset

data <- matrix(c(25, 30, 40, 70, 20, 10), nrow=2, ncol=3)
split_unv(data, n_steps = 3)
