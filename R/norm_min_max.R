#' Min-max normalization
#'
#' @author Catherine Rincon, \email{catherine.rincon@udea.edu.co}
#'
#' @param data Dataset (vector, matrix, dataframe) to normalize
#' @param inf Dataset (matrix, array) with range, minimum, and maximum as
#' min_max_range function output array
#' @param scaler The argument to transform with min-max normalization
#' or inverse of normalization in real values. By default 'transform'
#'
#' @return Returns two options:
#' with scaler parameter in transform, returns input data with
#' min-max normalization
#' with scaler parameter in inverse, returns data with real values
#'
#' @example examples/example_norm_min_max.R
#'
#' @export
norm_min_max <- function(data, inf, scaler= 'transform'){
  if ( ! scaler %in% c('transform', 'inverse') )
    stop('parameter scaler must be transform or inverse!')

  if (sum(dim(data)) == 0)
    data <- matrix(data)

  if (sum(dim(data)) == 0)
    stop(paste('data must be minimum 1 column', '\n', ''))

  if (ncol(data) != ncol(inf))
    stop(paste(data, 'must be the same columns as', inf))

  if (nrow(inf) != 2)
    stop(paste('The number of rows in', inf, 'must be 2'))

  if (sum(inf[1, ]) >= sum(inf[2, ]))
    stop(paste('Minimum must be smaller than maximum'))

  m_min <- matrix(inf[1, ], byrow = TRUE, nrow=nrow(data), ncol=ncol(data))
  m_max <- matrix(inf[2, ], byrow = TRUE, nrow=nrow(data), ncol=ncol(data))

  if(scaler == 'transform') {
    res <- (data-m_min)/(m_max-m_min)
  }
  else {
    res <- (data*(m_max-m_min))+m_min
  }
  res
}
