#' Check Heteroscedasticity and Linearity of a Model
#'
#' @description Checks a simple or multiple linear regression model for heteroscedasticity and linearity. The function outputs orientation plots
#' and computes relevant statistical tests (heteroscedasticity = lmtest::bptest; linearity = lmtest::raintest).
#'
#'
#' @param mdl A simple or multiple linear regression model.
#'
#' @return A plot and a test results in the console.
#'
#' @author D. Schmitz & J. Esser
#'
#' @references Achim Zeileis, Torsten Hothorn (2002). Diagnostic Checking in Regression Relationships. R News 2(3), 7-10. URL: https://CRAN.R-project.org/doc/Rnews/
#'
#' @examples
#' data("data_s")
#'
#' model <- lm(sDur ~ typeOfS + pauseDur, data_s)
#'
#' heteroscedasticity_check(model)
#'
#' @export

heteroscedasticity_check <- function(mdl, random = NULL){

  x <- mdl[["fitted.values"]]
  y <- sqrt(abs(mdl[["residuals"]]))

  data <- as.data.frame(cbind(x, y))

  test_bp <- lmtest::bptest(mdl)
  test_r <- lmtest::raintest(mdl)

  if(test_bp[["p.value"]][[1]] <= 0.05 & test_r[["p.value"]][[1]] <= 0.05){

    plot <- ggplot(data, aes(x = x, y = y)) +
      geom_point() +
      geom_smooth(formula = 'y ~ x', method = 'loess', se = F, color = "#6EC1E4") +
      theme_bw() +
      xlab("Fitted Values") +
      ylab("Squared St. Residuals")

    cli::cli_alert_danger(glue::glue(paste("studentized Breusch-Pagan test, p-value = ", round(test_bp[["p.value"]][[1]], 5), " - residuals are heteroscedastic", sep = "")))
    cli::cli_alert_danger(glue::glue(paste("Rainbow test, p-value = ", round(test_r[["p.value"]][[1]], 5), " - residuals not linear", sep = "")))

  }else if(test_bp[["p.value"]][[1]] <= 0.05 & test_r[["p.value"]][[1]] >= 0.05){

    plot <- ggplot(data, aes(x = x, y = y)) +
      geom_point() +
      geom_smooth(formula = 'y ~ x', method = 'loess', se = F, color = "#6EC1E4") +
      theme_bw() +
      xlab("Fitted Values") +
      ylab("Squared St. Residuals")

    cli::cli_alert_danger(glue::glue(paste("studentized Breusch-Pagan test, p-value = ", round(test_bp[["p.value"]][[1]], 5), " - residuals are heteroscedastic", sep = "")))
    cli::cli_alert_info(glue::glue(paste("Rainbow test, p-value = ", round(test_r[["p.value"]][[1]], 5), " - residuals are linear", sep = "")))

  }else if (test_bp[["p.value"]][[1]] >= 0.05 & test_r[["p.value"]][[1]] <= 0.05){

    plot <- ggplot(data, aes(x = x, y = y)) +
      geom_point() +
      geom_smooth(formula = 'y ~ x', method = 'loess', se = F, color = "#6EC1E4") +
      theme_bw() +
      xlab("Fitted Values") +
      ylab("Squared St. Residuals")

    cli::cli_alert_info(glue::glue(paste("studentized Breusch-Pagan test, p-value = ", round(test_bp[["p.value"]][[1]], 5), " - residuals are homoscedastic", sep = "")))
    cli::cli_alert_danger(glue::glue(paste("Rainbow test, p-value = ", round(test_r[["p.value"]][[1]], 5), " - residuals not linear", sep = "")))

  }else{

    plot <- ggplot(data, aes(x = x, y = y)) +
      geom_point() +
      geom_smooth(formula = 'y ~ x', method = 'loess', se = F, color = "#6EC1E4") +
      theme_bw() +
      xlab("Fitted Values") +
      ylab("Squared St. Residuals")

    cli::cli_alert_info(glue::glue(paste("studentized Breusch-Pagan test, p-value = ", round(test_bp[["p.value"]][[1]], 5), " - residuals are homoscedastic", sep = "")))
    cli::cli_alert_info(glue::glue(paste("Rainbow test, p-value = ", round(test_r[["p.value"]][[1]], 5), " - residuals are linear", sep = "")))

  }

  return(plot)
}
