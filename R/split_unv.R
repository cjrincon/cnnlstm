#' Split a univariate dataset into samples
#'
#' @author Catherine Rincon, \email{catherine.rincon@udea.edu.co}
#'
#' @param dataset Dataset to split into samples as univariate dataset
#' @param n_steps Number of steps to split into samples
#'
#' @return Returns two data sets: one with the information of the x
#' and another with the information of the y
#'
#' @example examples/example_split_unv.R
#'
#' @export
split_unv <- function(dataset, n_steps){
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

