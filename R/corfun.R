.correlation_method <- function(x) {
  if (!is.numeric(x)) return("spearman")
  x <- x[is.finite(x)]
  if (length(x) < 3L || length(x) > 5000L || length(unique(x)) < 3L) {
    return("spearman")
  }
  if (stats::shapiro.test(x)$p.value >= 0.05) "pearson" else "spearman"
}

.correlation_values <- function(x) {
  if (is.character(x)) {
    stop("Character variables cannot be correlated; convert them to ordered factors first.",
         call. = FALSE)
  }
  if (is.factor(x)) as.numeric(x) else x
}

#' Compute correlation coefficients
#'
#' Computes coefficients for every pair of selected variables. Pearson's
#' correlation is used when both variables are numeric and pass a
#' Shapiro-Wilk normality check; Spearman's correlation is used otherwise.
#'
#' @param data A data frame containing the variables.
#' @param variables Character vector naming at least two variables.
#'
#' @return Invisibly returns a lower-triangular numeric matrix.
#' @examples
#' data("data_s")
#' corfun(data_s, c("sDurLog", "speakingRate", "typeOfS"))
#' @export
corfun <- function(data, variables) {
  if (!is.data.frame(data)) stop("`data` must be a data frame.", call. = FALSE)
  if (!is.character(variables) || length(variables) < 2L) {
    stop("`variables` must name at least two columns.", call. = FALSE)
  }
  missing <- setdiff(variables, names(data))
  if (length(missing)) {
    stop("Unknown variable(s): ", paste(missing, collapse = ", "), call. = FALSE)
  }

  selected <- data[variables]
  methods <- vapply(selected, .correlation_method, character(1))
  result <- matrix(
    NA_real_, nrow = length(variables), ncol = length(variables),
    dimnames = list(variables, variables)
  )
  combinations <- utils::combn(seq_along(variables), 2L)
  for (i in seq_len(ncol(combinations))) {
    first <- combinations[1L, i]
    second <- combinations[2L, i]
    method <- if ("spearman" %in% methods[c(first, second)]) "spearman" else "pearson"
    x <- .correlation_values(selected[[first]])
    y <- .correlation_values(selected[[second]])
    keep <- stats::complete.cases(x, y)
    if (sum(keep) < 3L) next
    value <- suppressWarnings(stats::cor.test(x[keep], y[keep], method = method)$estimate)
    result[second, first] <- unname(value)
  }

  print(round(result, 3L), na.print = "")
  invisible(result)
}
