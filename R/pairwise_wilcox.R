#' Compute averaged pairwise Wilcoxon p-values
#'
#' Runs pairwise Wilcoxon tests for all columns whose names begin with
#' `PredictedSize.` and returns the cell-wise mean adjusted p-values.
#'
#' @param predictor Name of the categorical grouping variable.
#' @param data Data frame containing the grouping and prediction columns.
#' @param method P-value adjustment method passed to
#'   [stats::pairwise.wilcox.test()].
#' @param x Number of decimal places used to round the result.
#'
#' @return A matrix of averaged adjusted p-values.
#' @export
pairwise_wilcox <- function(predictor, data, method = "holm", x = 6) {
  if (!is.data.frame(data)) stop("`data` must be a data frame.", call. = FALSE)
  if (length(predictor) != 1L || !is.character(predictor) ||
      !predictor %in% names(data)) {
    stop("`predictor` must name one column in `data`.", call. = FALSE)
  }
  prediction_columns <- grep("^PredictedSize\\.[0-9]+$", names(data), value = TRUE)
  if (!length(prediction_columns)) {
    stop("No columns named like `PredictedSize.1` were found.", call. = FALSE)
  }

  tests <- lapply(prediction_columns, function(column) {
    stats::pairwise.wilcox.test(
      data[[column]], data[[predictor]], p.adjust.method = method
    )$p.value
  })
  round(Reduce("+", tests) / length(tests), digits = x)
}
