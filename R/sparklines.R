
#' Spark line of a numeric vector on the terminal
#'
#' For marking the minumum/maximum, the \code{crayon} package
#' is needed.
#'
#' @inheritParams spark
#' @param data The data to visualize. It can be a numeric
#'   vector, or anything that can be cut into intervals
#'   with \code{cut}. Infinite values in numeric data are ignored,
#'   and a black character is plotted instead of them.
#' @param min If not NULL, then a crayon style to mark the
#'   minimum value.
#' @param max If not NULL, then a crayon style to mark the
#'   maximum value.
#' @param ... Not used, it is an error if given.
#' @return Character scalar containing the spark line.
#'
#' @family spark
#' @method spark default
#' @export
#' @examples
#' ## Annual number of Lynx trappings
#' spark(lynx, width = "auto")
#'
#' ## Luteinizing Hormone in Blood Samples,
#' ## in blue, if the terminal supports it
#' cat(crayon::blue(spark(lh)), "\n")

spark.default <- function(data, width = c("data", "auto", "screen"),
                          min = NULL, max = NULL, ...) {

  if (length(list(...))) stop("Extra arguments are invalid")

  width <- if (is.numeric(width)) {
    width

  } else {
    width <- match.arg(width)
    win_size <- getOption("width")
    if (width == "auto") {
      if (length(data) <= win_size) {
        length(data)
      } else {
        win_size
      }
    } else if (width == "data") {
      length(data)
    } else {
      win_size
    }
  }

  if (width != length(data)) data <- scale_to(data, width)

  if (is.numeric(data)) data[!is.finite(data)] <- NA

  ticks <- spark_ticks()

  code <- if (!all(data == 0)) {
    as.integer(cut(data, breaks = length(ticks)))
  } else {
    as.integer(rep(ceiling(length(ticks)/2), length(data)))
  }

  res <- ifelse(is.na(code), ' ', ticks[code])
  res <- mark_max(res, data = data, multiplier = -1, mark = min)
  res <- mark_max(res, data = data, multiplier =  1, mark = max)
  res <- paste(res, collapse = "")

  class(res) <- unique(c("sparkline", class(res), "character"))
  res
}


mark_max <- function(data, ticks, multiplier, mark) {

  if (is.null(mark)) return(ticks)
  if (!is_installed("crayon")) {
    warning("The 'crayon' package is needed for min/max marks")
    return(ticks)
  }

  wm <- which_max(multiplier * data)
  ticks[wm] <- import("crayon", "style")(ticks[wm], as = mark)
  ticks
}


#' @export

print.sparkline <- function(x, ..., sep = "\n") {
  cat(x, ..., sep = "\n")
  invisible(x)
}

#' @importFrom methods setOldClass

setOldClass(c("sparkline", "character"))
