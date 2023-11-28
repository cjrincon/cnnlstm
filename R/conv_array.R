#' Convert dataset to array
#'
#' @author Catherine Rincon, \email{catherine.rincon@udea.edu.co}
#'
#' @param data Dataset to convert in array
#'
#' @return Returns the input dataset in a array
#'
#' @example examples/example_conv_array.R
#'
#' @export
conv_array <- function(data){

  if (nrow(data) == 0)
    stop("The data must have at least one observation")

  if (ncol(data) == 0)
    stop("The data must have at least one column")

  array(data = unlist(data),
        dim = c(nrow(data), ncol(data)),
        dimnames = list(rownames(data),
                        colnames(data)))
}
