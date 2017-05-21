
#' @importFrom clisymbols symbol

spark_ticks <- function() {
  unlist(symbol[ paste0("lower_block_", 1:8) ])
}

#' Generic spark line method for matrices or data frames, etc.
#'
#' @param data The data to plot.
#' @param width The width (number of characters) of the output.
#'   \sQuote{data} means that it will match the length of the data.
#'   \sQuote{screen} means that it will be scaled to match the
#'   width of the screen. \sQuote{auto} means \sQuote{data}
#'   if the length of the data is not longer than the screen width,
#'   and \sQuote{screen} otherwise.
#' @param ... Additional arguments to the various methods.
#' @return Characacter vector containing the spark line(s).
#' @family spark
#' @export

spark <- function(data, width = c("data", "auto", "screen"), ...)
  UseMethod("spark")
