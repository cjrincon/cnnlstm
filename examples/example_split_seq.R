# Example 1
# Generating dataset to split into samples as multivariate dataset

x <- matrix(1:30, nrow=10, ncol=3, byrow=TRUE)
y <- matrix(rpois(n=10, lambda=5), nrow=1)
a <- split_seq(x, y, 3)
