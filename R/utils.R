
which_max <- function(x, tolerance = .Machine$double.eps^0.5) {
  which(abs(max(x) - x) < tolerance)
}

#' @importFrom utils installed.packages

is_installed <- function(pkg) {
  pkg %in% rownames(installed.packages())
}
