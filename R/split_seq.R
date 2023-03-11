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
#'
#'
#' @export
split_seq <- function(x, y, n_steps){
  y <- matrix(y, ncol=1)
  if (nrow(x) != nrow(y))
    stop(paste(x, 'must be the same rows as', y))

  n <- nrow(x)
  ini <- 1:(n-(n_steps-1))
  fin <- n_steps:n
  X <- NULL
  Y <- NULL
  for (i in ini) {
    X[[i]] <- x[ini[i]:fin[i], ]
    Y[[i]] <- y[fin[i], 1]
  }

  list('x'= X, 'y' = Y)
}
