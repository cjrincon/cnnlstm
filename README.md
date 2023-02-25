
<!-- README.md is generated from README.Rmd. Please edit that file -->

# cnnlstm

<!-- badges: start -->

[![R-CMD-check](https://github.com/cjrincon/cnnlstm/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/cjrincon/cnnlstm/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The cnnlstm package provides functions to carry out the methodology
CNN-LSTM:

- Split data

- Generate CNN models to smooth the data obtained by sensors

- Generate LSTM models to predict a variable with nonlinear behavior
  over time

- Evaluate performance of prediction model

## Installation

You can install the development version of cnnlstm from
[GitHub](https://github.com/) with:

It is recommended to follow these steps to avoid problems when using the
package:

``` r
# Step 1: Install the reticulate package
install.packages("reticulate")
library(reticulate)

# Step 2: Install the tensorflow package
install.packages("tensorflow")
library(tensorflow)

# Step 3: Use the install_tensorflow() funcion to install the TensorFlow module
install_tensorflow()
```

``` r
# install.packages("devtools")
devtools::install_github("cjrincon/cnnlstm")
```
