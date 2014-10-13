
#' Spark line of a numeric vector on the terminal
#'
#' @param data The data to visualize. It can be a numeric
#'   vector, or anything that can be cut into intervals
#'   with \code{cut}. Infinite values in numeric data are ignored,
#'   and a black character is plotted instead of them.
#' @param width The width (number of characters) of the output.
#'   \sQuote{data} means that it will match the length of the data.
#'   \sQuote{screen} means that it will be scaled to match the
#'   width of the screen. \sQuote{auto} means \sQuote{data}
#'   if the length of the data is not longer than the screen width,
#'   and \sQuote{screen} otherwise.
#' @param ... Not used, it is an error if given.
#' @return Character scalar containing the spark line.
#'
#' @family spark
#' @method spark default
#' @export
#' @examples
#' ## Annual number of Lynx trappings
#' cat(spark(lynx[1:getOption("width")]), "\n")
#'
#' ## Luteinizing Hormone in Blood Samples,
#' ## in blue, if the terminal supports it
#' cat(crayon::blue(spark(lh)), "\n")

spark.default <- function(data, width = c("data", "auto", "screen"), ...) {

  if (length(list(...))) stop("Extra arguments are invalid")

  width <- match.arg(width)

  win_size <- getOption("width")
  if (width == "auto") {
    width <- if (width <= win_size) "data" else "screen"
  }

  if (width == "screen") data <- scale_to(data, win_size)

  if (is.numeric(data)) data[!is.finite(data)] <- NA

  code <- cut(data, breaks = length(spark_ticks)) %>%
    as.integer()

  ifelse(is.na(code), ' ', spark_ticks[code]) %>%
    paste(collapse = "")
}
