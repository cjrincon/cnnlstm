#' Split a univariate dataset into samples
#'
#' @author Catherine Rincon, \email{catherine.rincon@udea.edu.co}
#'
#' @param dataset Dataset to split into samples as univariate dataset
#' @param n_steps Number (integer) of steps to split into samples
#'
#' @return Returns two data sets: one with the information of the x (features)
#' and another with the information of the y (target)
#'
#' @example examples/example_split_unv.R
#'
#' @export
split_unv <- function(dataset, n_steps){

  if (!is.numeric(n_steps) == TRUE)
    stop("n_steps must be an integer")

  if (n_steps <= 0)
    stop("n_steps must be an integer and greater than 0")

  if (length(dataset) == 0)
    stop("The dataset must have at least one observation")

    for (i in 1:length(dataset)){
    end_ix <- i + n_steps - 1
    if (end_ix > length(dataset)){break}
    seq_x <- dataset[i:end_ix]
    seq_y <- mean(dataset[i:end_ix])
    if (i==1){
      x <- seq_x
      y <- seq_y}
    else {
      x <- array(c(x, seq_x), dim=c(n_steps,1, i))
      y <- c(y, seq_y)}}

  x <- aperm(x, perm=c(3,1,2))

  list('x'= x, 'y' = array(y))
}

