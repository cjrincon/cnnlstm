#' Split arrays or matrices in train and test subsets
#'
#' @author Catherine Rincon, \email{catherine.rincon@udea.edu.co}
#'
#' @param dataset Array, matrix with information to split
#' @param train_size Proportion of the x to split as train subset. By default the value is 0.8
#' @param random_seed An integer to control the random number generator used. By default the value is 1234
#'
#' @return A list with train and test subsets
#'
#'
#' @export
split_train_test <- function(dataset, train_size = 0.8, random_seed = 1234){
  if (train_size > 1 || !is.numeric(train_size))
    stop(paste(train_size, 'parameter must be numeric and less than 1'))

  if (length(dataset) == 0)
    stop(paste(dataset, 'must have some value as input'))

  #if (!is.integer(random_seed))
  #  stop(paste(random_seed, 'must be a integer'))

  if (!is.null(random_seed))
    set.seed(random_seed)
  else set.seed(1234)

  subsample <- sample(1:nrow(dataset), round(nrow(dataset) * train_size))
  nosub <- setdiff(1:nrow(dataset), subsample)
  nosub <- sample(nosub)
  train <- dataset[subsample, ]
  test <- dataset[nosub, ]

  return(list(test = test, train = train))
}
