
#' Spark lines for rows of a matrix.
#'
#' @inheritParams spark.default
#' @param data The matrix to plot.
#' @return Character scalar containing the spark line.
#'
#' @method spark matrix
#' @family spark
#' @export
#' @examples
#' cat(spark(volcano), sep = "\n")
#'
#' cat(spark(t(EuStockMarkets), width="auto"), sep="\n") 

spark.matrix <- function(data, width = c("data", "auto", "screen"),
                         common_scale = TRUE, ...) {

  if (common_scale) data <- t(apply(data, 1, scale_y, range = range(data)))

  apply(data, 1, spark, width = width, ...)
}
