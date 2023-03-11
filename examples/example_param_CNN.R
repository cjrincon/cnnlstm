# Example 1
# Generating a new CNN arquitecture

\dontrun{
library(keras)

model_CNN <- param_CNN(n_steps=6, n_filter=4,size_filter=2, pool_size=2, n_neuron=5)

summary(model_CNN)

}
