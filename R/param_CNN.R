#' Define the hyperparameters of the convolutional neural network CNN
#'
#' @author Catherine Rincon, \email{catherine.rincon@udea.edu.co}
#'
#' @param n_steps Number of steps to split into samples CNN
#' @param n_filter Number of filters in convolutional layer
#' @param size_filter Size of filter in convolutional layer
#' @param pool_size Size of pool in max_pooling layer
#' @param n_neuron Number of neurons in dense layer
#'
#' @return Return model architecture and model summary
#'
#'
#' @importFrom keras keras_model_sequential layer_conv_1d layer_max_pooling_1d layer_flatten layer_dense
#'
#' @export
param_CNN <- function(n_steps, n_filter, size_filter, pool_size, n_neuron){
  model <- keras_model_sequential()
  model |>
    layer_conv_1d(filters=n_filter, kernel_size=size_filter, activation='relu', input_shape=c(n_steps, 1)) |>
    layer_max_pooling_1d(pool_size=pool_size) |>
    layer_flatten() |>
    layer_dense(n_neuron, activation = 'relu') |>
    layer_dense(1)

  return(summary(model))
}
