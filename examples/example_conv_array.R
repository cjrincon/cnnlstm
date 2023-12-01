# Example 1
# Generating some array values with dataframe

data <- data.frame(
  'month' = 1:4,
  'cost' = c(23, 10, 15, 25),
  'number' = c(1.2, 3.4, 4.5, 5.6))
conv_array(data)



# Example 2
# Generating an array with the data: NASA
data(data_NASA)
data_NASA <- conv_array(data_NASA)
