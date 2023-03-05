#' Split a multivariate dataset sequence into samples
#'
#' @author Catherine Rincon, \email{catherine.rincon@udea.edu.co}
#'
#' @param dataset Dataset to split into samples as multivariate sequences dataset
#' @param n_steps Number of steps to split into samples
#'
#' @return Returns two data sets: one with the information of the x
#' and another with the information of the y
#'
#'
#'
#' @export
split_seq <- function(dataset, n_steps){
  for (i in 1:nrow(dataset)){
    end_ix <- i + n_steps - 1
    if (end_ix > nrow(dataset)){break}
    seq_x <- dataset[i:end_ix, -ncol(dataset)]
    seq_y <- dataset[end_ix, ncol(dataset)]
    if (i==1){
      x <- seq_x
      y <- seq_y}
    else {
      x <- c(x, seq_x)
      y <- c(y, seq_y)}}

  x <- array(x, dim = c(n_steps, ncol(dataset)-1, nrow(dataset)-(n_steps)+1))
  y <- array(y)

  list('x'= x, 'y' = y)
}
