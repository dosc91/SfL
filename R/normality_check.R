.require_optional <- function(package, function_name) {
  if (!requireNamespace(package, quietly = TRUE)) {
    stop(
      sprintf(
        "Package '%s' is required for %s(). Install it with install.packages('%s').",
        package, function_name, package
      ),
      call. = FALSE
    )
  }
}

#' Check residual normality
#'
#' Draws a residual-density plot and reports a Shapiro-Wilk test. The test is
#' defined for 3 to 5000 observations.
#'
#' @param mdl A fitted model with a [stats::residuals()] method.
#'
#' @return A `ggplot` object with the Shapiro-Wilk test stored in its
#'   `sfl_test` attribute.
#' @examples
#' \dontrun{
#' model <- stats::lm(mpg ~ wt, data = mtcars)
#' normality_check(model)
#' }
#' @export
normality_check <- function(mdl) {
  .require_optional("ggplot2", "normality_check")
  residual_values <- stats::residuals(mdl)
  residual_values <- residual_values[is.finite(residual_values)]
  if (length(residual_values) < 3L || length(residual_values) > 5000L) {
    stop("The Shapiro-Wilk test requires between 3 and 5000 finite residuals.",
         call. = FALSE)
  }

  test <- stats::shapiro.test(residual_values)
  interpretation <- if (test$p.value <= 0.05) "not normally distributed" else "normally distributed"
  message(sprintf("Shapiro-Wilk test: p = %.5f; residuals are %s.",
                  test$p.value, interpretation))

  plot_data <- data.frame(residual = residual_values)
  plot <- ggplot2::ggplot(plot_data, ggplot2::aes(x = .data$residual)) +
    ggplot2::geom_density(color = "#6EC1E4", fill = "#6EC1E4") +
    ggplot2::theme_bw() +
    ggplot2::labs(x = "Residuals", y = "Density")
  attr(plot, "sfl_test") <- test
  plot
}
