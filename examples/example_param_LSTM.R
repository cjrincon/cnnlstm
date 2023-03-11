# Example 1
# Generating a new LSTM arquitecture

\dontrun{
library(keras)

model_LSTM <- param_LSTM(n_steps_LSTM=5, n_features=3, f_n_neuron=50,f_drop=0.1,s_n_neuron=20, s_drop=0.1)

summary(model_LSTM)

}
