#' Define the hyperparameters of the long-short term memory neural network LSTM
#'
#' @param n_steps_LSTM Number of steps to split into samples LSTM
#' @param n_features LSTM training features dataset number
#' @param f_n_neuron Number of neurons of first LSTM layer
#' @param f_drop First percent dropout rate
#' @param s_n_neuron Number of neurons of second LSTM layer
#' @param s_drop Second percent dropout rate
#'
#' @return Return LSTM model architecture and model summary
#'
#'
#'
#' @importFrom keras keras_model_sequential layer_lstm layer_dropout layer_dense
#'
#' @export
param_LSTM <- function(n_steps_LSTM, n_features, f_n_neuron,f_drop,s_n_neuron, s_drop){
  model_LSTM <- keras_model_sequential()
  model_LSTM |>
    layer_lstm(units = f_n_neuron
               ,input_shape = c(n_steps_LSTM, n_features)
               ,return_sequences = TRUE
               ,activation = "tanh") |>
    layer_dropout(rate = f_drop) |>
    layer_lstm(units = s_n_neuron
               ,activation = "tanh") |>
    layer_dropout(rate = s_drop) |>
    layer_dense(1)

  return(summary(model_LSTM))
}
