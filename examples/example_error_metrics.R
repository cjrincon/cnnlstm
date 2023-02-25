# Example 1
# Generating a prediction model with keras and evaluate the performance of prediciton model
# Example of converting pounds to kilos
\dontrun{
library(keras)

X_train <- array(c(1,3,4,6,8))
y_train <- array(c(0.45,1.36,1.81,2.72,3.63))

model <- keras_model_sequential()
model |>
  layer_dense(1, input_shape=1)

summary(model)

model |> compile(optimizer = "adam", loss = 'mse')

model |> fit(X_train, y_train, epochs=100, verbose=0)

error_metrics(model, X_train, y_train)
}
