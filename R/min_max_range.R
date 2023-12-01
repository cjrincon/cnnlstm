#' Calculate the range of a dataset
#'
#' @author Catherine Rincon, \email{catherine.rincon@udea.edu.co}
#'
#' @param data Dataset (vector, matrix, dataframe) to calculate the minimum and maximum
#'
#' @return Returns a matrix with 2 rows and p columns (variables) with
#' the range (minimum and maximum) of dataset
#'
#' @example examples/example_min_max_range.R
#'
#' @export
min_max_range <- function(data){
  if (sum(dim(data)) == 0)
    stop(paste('data must be minimum 1 column', '\n', ''))

  apply(data, MARGIN = 2, FUN = range)
}
