#' Define the hyperparameters of the long-short term memory LSTM
#'
#' @author Catherine Rincon, \email{catherine.rincon@udea.edu.co}
#'
#' @param data Dataset to split and tuning
#' @param n_steps_LSTM Number of steps to split into samples
#' @param f_neuron Number of neuron in the first LSTM layer
#' @param f_drop Dropout rate in the first LSTM layer
#' @param s_neuron Number of neuron in the second LSTM layer
#' @param s_drop Dropout rate in the second LSTM layer
#' @param learn_rate Learning rate in the compilation with Adam optimizer
#' @param epoc Number of epochs in the training model
#'
#' @return Returns:
#' Dataframe with the combinations of the parameters and the calculated error
#' Better combination of hyperparameters that minimizes the train and test error
#'
#' @importFrom keras keras_model_sequential layer_lstm layer_dropout layer_dense compile fit optimizer_adam
#'
#' @export
hp_tuning_LSTM <- function(data, n_steps_LSTM, f_neuron,f_drop,s_neuron, s_drop, learn_rate, epoc){

  # Initialize variables
  error <- 1
  df_error <- data.frame(f_neuron = numeric(),
                         f_drop = numeric(),
                         s_neuron = numeric(),
                         s_drop = numeric(),
                         learn_rate = numeric(),
                         epoc = numeric(),
                         error_train = numeric(),
                         error_test = numeric(),
                         calc_error = numeric())

  # Organize data
  train_test <- split_train_test(data, train_size = 0.7, random_seed = 100)

  train_n_LSTM <- conv_array(train_test$train)
  test_n_LSTM <- conv_array(train_test$test)

  # Split train - test
  X_train_LSTM <- split_seq(train_n_LSTM[,-ncol(train_n_LSTM)], train_n_LSTM[,ncol(train_n_LSTM)], n_steps_LSTM)$x
  y_train_LSTM <- split_seq(train_n_LSTM[,-ncol(train_n_LSTM)], train_n_LSTM[,ncol(train_n_LSTM)], n_steps_LSTM)$y

  X_test_LSTM <- split_seq(test_n_LSTM[,-ncol(test_n_LSTM)],test_n_LSTM[,ncol(test_n_LSTM)], n_steps_LSTM)$x
  y_test_LSTM <- split_seq(test_n_LSTM[,-ncol(test_n_LSTM)],test_n_LSTM[,ncol(test_n_LSTM)], n_steps_LSTM)$y


  for (f in 1:length(f_neuron)){
    for (d in 1:length(f_drop)){
      for (n in 1:length(s_neuron)){
        for (s in 1:length(s_drop)){
          for (a in 1:length(learn_rate)){
            for (ep in 1:length(epoc)){

              # Define architecture
              m_CNN_LSTM <- keras_model_sequential()
              m_CNN_LSTM |>
                layer_lstm(units = f_neuron[f]
                           ,input_shape = c(n_steps_LSTM
                                            , dim(X_train_LSTM)[3])
                           ,return_sequences = TRUE
                           ,activation = "tanh") |>
                layer_dropout(rate = f_drop[d]) |>
                layer_lstm(units = s_neuron[n]
                           ,activation = "tanh") |>
                layer_dropout(rate = s_drop[s]) |>
                layer_dense(1)

              # Compile
              m_CNN_LSTM |> compile(optimizer = optimizer_adam(learning_rate=learn_rate[a]), loss = 'mse')


              # Train and prediction
              m_CNN_LSTM |> fit(X_train_LSTM,y_train_LSTM,epochs=epoc[ep], verbose=0)

              pred_train <- m_CNN_LSTM |> predict(X_train_LSTM)
              pred_test <- m_CNN_LSTM |> predict(X_test_LSTM)

              # Error
              error_train <- sum(error_metrics(m_CNN_LSTM, X_train_LSTM, y_train_LSTM)[2])
              error_test <- sum(error_metrics(m_CNN_LSTM, X_test_LSTM, y_test_LSTM)[2])
              calc_error <- error_train + error_test

              # Save error matrix
              df_error[error, 1] <- f_neuron[f]
              df_error[error, 2] <- f_drop[d]
              df_error[error, 3] <- s_neuron[n]
              df_error[error, 4] <- s_drop[s]
              df_error[error, 5] <- learn_rate[a]
              df_error[error, 6] <- epoc[ep]
              df_error[error, 7] <- error_train
              df_error[error, 8] <- error_test
              df_error[error, 9] <- calc_error

              error <- error + 1

            }
          }
        }
      }
    }
  }
  pos <- which(df_error[, ncol(df_error)]==min(df_error[, ncol(df_error)]))
  res <- df_error[pos,]
  list('df_error'= df_error, 'resultado' = res)
}
