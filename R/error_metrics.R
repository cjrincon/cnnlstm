#' Calculate the performance metrics of the prediction model
#'
#' @param model Prediction model
#' @param X_test Training values for the prediciton model
#' @param y_test Real values
#'
#' @return Returns to tibble with the information of the RMSE,
#' MAPE, MAE and MSE obtained
#'
#' @example examples/example_error_metrics.R
#'
#' @importFrom tibble tibble
#' @importFrom keras keras_model_sequential
#' @importFrom stats predict
#'
#' @export
error_metrics <- function(model, X_test, y_test) {

  if (nrow(X_test) == 0)
    stop("The data must have at least one observation")

  if (nrow(y_test) == 0)
    stop("The data must have at least one observation")

  # Set seed
  set.seed(123)
  # Prediction with model
  pred <- model |> predict(X_test)
  pred <- array(pred)

  value <- (y_test-pred)

  rmse <- sqrt(mean(value^2))

  mape <- mean(abs(value/pred))*100

  mae <- mean(abs(value))

  mse <- mean(value^2)

  res <- tibble('.metrics' = c('rmse', 'mape', 'mae', 'mse'),
                '.estimate' = c(rmse, mape, mae, mse))
  return(res)
}
