#' Create an error-bar data frame
#'
#' Summarises a numerical variable by one or more grouping variables. The
#' result can be supplied directly to plotting code.
#'
#' @param data A data frame.
#' @param numerical Name of the numerical variable to summarise.
#' @param factors Character vector naming the grouping variables.
#' @param size Multiplier applied to the standard deviation or standard error.
#' @param type Either `"sd"` for standard deviation or `"std"` for standard
#'   error.
#'
#' @return A data frame containing the grouping variables, group mean, and the
#'   requested spread measure.
#' @examples
#' data("data_s")
#' create_error_bar_df(data_s, "sDur", "pauseBin", type = "sd")
#' @export
create_error_bar_df <- function(data, numerical, factors, size = 1, type = "sd") {
  if (!is.data.frame(data)) stop("`data` must be a data frame.", call. = FALSE)
  if (length(numerical) != 1L || !is.character(numerical) ||
      !numerical %in% names(data)) {
    stop("`numerical` must name one column in `data`.", call. = FALSE)
  }
  if (!is.numeric(data[[numerical]])) {
    stop("`numerical` must identify a numeric column.", call. = FALSE)
  }
  if (!is.character(factors) || !length(factors) ||
      any(!factors %in% names(data))) {
    stop("`factors` must name one or more columns in `data`.", call. = FALSE)
  }
  if (length(size) != 1L || !is.numeric(size) || is.na(size) || size < 0) {
    stop("`size` must be one non-negative number.", call. = FALSE)
  }
  type <- match.arg(type, c("sd", "std"))

  group_data <- data[factors]
  values <- data[[numerical]]
  means <- stats::aggregate(values, group_data, mean, na.rm = TRUE)
  spread_fun <- if (type == "sd") {
    function(x) size * stats::sd(x, na.rm = TRUE)
  } else {
    function(x) {
      n <- sum(!is.na(x))
      if (n < 2L) return(NA_real_)
      size * stats::sd(x, na.rm = TRUE) / sqrt(n)
    }
  }
  spreads <- stats::aggregate(values, group_data, spread_fun)

  names(means)[ncol(means)] <- numerical
  names(spreads)[ncol(spreads)] <- type
  cbind(means, spreads[ncol(spreads)])
}
