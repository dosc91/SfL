#' Check homoscedasticity and linearity
#'
#' Draws a scale-location plot and reports the studentized Breusch-Pagan and
#' Rainbow tests from `lmtest`.
#'
#' @param mdl A fitted linear regression model.
#' @param random Retained for backward compatibility; currently unused.
#'
#' @return A `ggplot` object with both tests stored in its `sfl_tests`
#'   attribute.
#' @examples
#' \dontrun{
#' model <- stats::lm(mpg ~ wt + hp, data = mtcars)
#' heteroscedasticity_check(model)
#' }
#' @export
heteroscedasticity_check <- function(mdl, random = NULL) {
  .require_optional("ggplot2", "heteroscedasticity_check")
  .require_optional("lmtest", "heteroscedasticity_check")

  fitted_values <- stats::fitted(mdl)
  residual_values <- stats::residuals(mdl)
  plot_data <- data.frame(
    fitted = fitted_values,
    sqrt_abs_residual = sqrt(abs(residual_values))
  )
  test_bp <- lmtest::bptest(mdl)
  test_rainbow <- lmtest::raintest(mdl)
  message(sprintf(
    "Studentized Breusch-Pagan test: p = %.5f; residuals are %s.",
    test_bp$p.value,
    if (test_bp$p.value <= 0.05) "heteroscedastic" else "homoscedastic"
  ))
  message(sprintf(
    "Rainbow test: p = %.5f; the linearity assumption is %s.",
    test_rainbow$p.value,
    if (test_rainbow$p.value <= 0.05) "not supported" else "supported"
  ))

  plot <- ggplot2::ggplot(
    plot_data,
    ggplot2::aes(x = .data$fitted, y = .data$sqrt_abs_residual)
  ) +
    ggplot2::geom_point() +
    ggplot2::geom_smooth(method = "loess", se = FALSE, color = "#6EC1E4") +
    ggplot2::theme_bw() +
    ggplot2::labs(x = "Fitted values", y = "Square root of absolute residuals")
  attr(plot, "sfl_tests") <- list(breusch_pagan = test_bp, rainbow = test_rainbow)
  plot
}
