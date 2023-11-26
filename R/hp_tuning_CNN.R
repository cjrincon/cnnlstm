#' Hyperparameter tuning CNN
#'
#' @author Catherine Rincon, \email{catherine.rincon@udea.edu.co}
#'
#' @param data Dataset to split and tuning
#' @param train_size Proportion of the x to split as train subset. By default the value is 0.8
#' @param random_seed An integer to control the random number generator used. By default the value is 1234
#' @param n_steps Number of steps to split into samples
#' @param n_filter Number of filters in the convolutional layer
#' @param neuron Number of neuron in the dense layer
#' @param learn_rate Learning rate in the compilation with Adam optimizer
#' @param epoc Number of epochs in the training model
#'
#' @return Returns:
#' Dataframe with the combinations of the parameters and the calculated error
#' Better combination of hyperparameters that minimizes the train and test error
#'
#' @importFrom keras keras_model_sequential layer_conv_1d layer_max_pooling_1d layer_flatten layer_dense compile fit optimizer_adam
#'
#' @export
hp_tuning_CNN <- function(data, train_size = 0.8, random_seed = 1234, n_steps, n_filter,neuron, learn_rate, epoc){

  # Initialize variables
  n_var <- length(data)
  n_features <- 1
  X_train_CNN <- vector("list", length = length(n_var)*length(data))
  y_train_CNN <- vector("list", length = length(n_var)*length(data))
  X_test_CNN <- vector("list", length = length(n_var)*length(data))
  y_test_CNN <- vector("list", length = length(n_var)*length(data))
  cont <- 1
  pred_train <- vector("list", length = length(n_var)*length(data))
  pred_test <- vector("list", length = length(n_var)*length(data))
  error <- 1
  cal_error <- 0
  df_error <- data.frame(n_filter = numeric(),
                         neuron = numeric(),
                         learn_rate = numeric(),
                         epoc = numeric(),
                         error_train = numeric(),
                         error_test = numeric(),
                         sum_error = numeric())


  # Organize data
  for (j in 1:length(data)){
    bateria <- array(unlist(data[[j]]), dim(data[[j]]))

    inf <- min_max_range(bateria)
    data_CNN_norm <- norm_min_max(bateria, inf, scaler= 'transform')
    train_test_CNN <- split_train_test(data_CNN_norm, train_size=train_size, random_seed=random_seed)
    train_n <- train_test_CNN$train
    test_n <- train_test_CNN$test

    for (i in 1:length(n_var)){
      var_train <- train_n[,i]
      var_test <- test_n[,i]

      # Split data to CNN for variable
      X_train_CNN[[cont]] <- split_unv(var_train, n_steps)$x
      y_train_CNN[[cont]] <- split_unv(var_train, n_steps)$y
      X_test_CNN[[cont]] <- split_unv(var_test, n_steps)$x
      y_test_CNN[[cont]] <- split_unv(var_test, n_steps)$y
      cont <- cont + 1
    }
  }

  # Optimize hyperparameters
  for (f in 1:length(n_filter)){
    for (n in 1:length(neuron)){
      for (a in 1:length(learn_rate)){
        for (ep in 1:length(epoc)){

          # Define architecture
          model <- keras_model_sequential()
          model |>
            layer_conv_1d(filters=n_filter[f],
                          kernel_size=2,
                          activation='relu',
                          input_shape=c(n_steps, n_features)) |>
            layer_max_pooling_1d(pool_size=2) |>
            layer_flatten() |>
            layer_dense(neuron[n], activation = 'relu') |>
            layer_dense(1)

          # Compile
          model |> compile(optimizer = optimizer_adam(learning_rate=learn_rate[a]),
                            loss = 'mse')

          # Train and prediction
          for (i in 1:(length(X_train_CNN))){
            # fit model
            model |> fit(X_train_CNN[[i]], y_train_CNN[[i]],
                          epochs=epoc[ep],
                          verbose=0)
            pred_train[[i]] <- model |> predict(X_train_CNN[[i]])
            pred_test[[i]] <- model |> predict(X_test_CNN[[i]])
            error_train <- sum(error_metrics(model, X_train_CNN[[i]], y_train_CNN[[i]])[2])
            error_test <- sum(error_metrics(model, X_test_CNN[[i]], y_test_CNN[[i]])[2])
            cal_error <- cal_error + error_train + error_test
          }

          # Save error matrix
          df_error[error, 1] <- n_filter[f]
          df_error[error, 2] <- neuron[n]
          df_error[error, 3] <- learn_rate[a]
          df_error[error, 4] <- epoc[ep]
          df_error[error, 5] <- error_train
          df_error[error, 6] <- error_test
          df_error[error, 7] <- cal_error

          error <- error + 1
          cal_error <- 0

        }
      }
    }
  }
  pos <- which(df_error[, ncol(df_error)]==min(df_error[, ncol(df_error)]))
  res <- df_error[pos,]
  list('df_error'= df_error, 'resultado' = res)
}
