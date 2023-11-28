
<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- badges: start -->

[![R-CMD-check](https://github.com/cjrincon/cnnlstm/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/cjrincon/cnnlstm/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

# cnnlstm <img src="man/figures/logo_cnnlstm.png" align="right" alt="" width="120" />

The `cnnlstm` package provides functions to carry out the methodology
CNN-LSTM in `R`:

- Split data

- Generate CNN models to smooth the data obtained by sensors

- Generate LSTM models to predict a variable with nonlinear behavior
  over time

- Evaluate performance of prediction model

## Installation

You can install the development version of `cnnlstm` from
[GitHub](https://github.com/cjrincon/cnnlstm). It is recommended to
follow these steps to avoid problems when using the package:

``` r
# Step 1: Install the reticulate package
install.packages("reticulate")
library(reticulate)
# Step 2: Install the tensorflow package
install.packages("tensorflow")
library(tensorflow)
# Step 3: Use the install_tensorflow() funcion to install the TensorFlow module
install_tensorflow()
# Step 4: Confirm that Tensorflow installation succeeded
library(tensorflow)
tf$constant("Hello Tensorflow!")
# Step 5: Install the keras package
install.packages("keras")
library(keras)
# Step 6: Install the devtools package
install.packages("devtools")
# Step 7:  Install and load the cnnlstm package
devtools::install_github("cjrincon/cnnlstm")
library(cnnlstm)
```

## Examples

You can visit the [package website](https://cjrincon.github.io/cnnlstm/)
to explore the functions, documentation and examples.
