#' Split a multivariate dataset sequence into samples
#'
#' @author Catherine Rincon, \email{catherine.rincon@udea.edu.co}
#'
#' @param x features dataset to split into samples as multivariate sequences
#' @param y target dataset with numeric values
#' @param n_steps Number of steps to split into samples
#'
#' @return Returns two data sets: one with the information of the x
#' and another with the information of the y
#'
#' @example examples/example_split_seq.R
#'
#' @export
split_seq <- function(x, y, n_steps) {
  y <- matrix(y, ncol=1)
  n <- nrow(x)
  ini <- 1:(n-(n_steps-1))
  fin <- n_steps:n
  X <- NULL
  Y <- NULL
  for (i in ini) {
    d_x <- x[ini[i]:fin[i], ]
    d_y <- y[fin[i], 1]
    X <- array(c(X, d_x), dim=c(n_steps,ncol(x), i))
    Y <- c(Y, d_y)
  }
  X <- aperm(X, perm=c(3,1,2))

  list(x=X, y=array(Y))
}
