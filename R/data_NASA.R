#' Li-ion Battery Dataset (NASA)
#'
#' These data are from four batteries, which were instrumented to capture the
#' value of variables such as current, temperature and voltage from sensors.
#' The batteries were subjected to charging and discharging processes in a
#' controlled environment with a constant ambient temperature. The batteries
#' are named like this:
#' - Battery 5
#' - Battery 6
#' - Battery 7
#' - Battery 18
#'
#'
#' @format ## `data_NASA`
#' A data frame with 185.721 rows and 12 columns:
#' \describe{
#'   \item{cycle}{Battery discharge cycle number}
#'   \item{ambient_temperature}{Ambient temperature (degree C)}
#'   \item{datetime}{The date and time of the start of the cycle}
#'   \item{capacity}{Battery capacity (Ahr)}
#'   \item{voltage_measured}{Battery terminal voltage (Volts)}
#'   \item{current_measured}{Battery output current (Amps)}
#'   \item{temperature_measured}{Battery temperature (degree C)}
#'   \item{current_load}{Current measured at load (Amps)}
#'   \item{voltage_load}{Voltage measured at load (Volts)}
#'   \item{time}{Time vector for the cycle (secs)}
#'   \item{soh}{Percentage of battery health status in each cycle}
#'   \item{battery}{Battery identification number}
#' }
#' @source <https://data.nasa.gov/>
"data_NASA"
