#' Convert dataset to array
#'
#' @author Catherine Rincon, \email{catherine.rincon@udea.edu.co}
#'
#' @param data dataset to convert in array
#'
#' @return Returns the input dataset in a array
#'
#' @example examples/example_conv_array.R
#'
#' @export
conv_array <- function(data){
  array(data = unlist(data),
        dim = c(nrow(data), ncol(data)),
        dimnames = list(rownames(data),
                        colnames(data)))
}
