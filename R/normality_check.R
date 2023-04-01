#' Check Normality of a Model
#'
#' @description Checks a simple, multiple, or mixed-effects linear regression model for normality. The function outputs an orientation plot
#' and computes a relevant statistical test: Shapiro-Wilk test on model residuals.
#'
#'
#' @param mdl A simple, multiple, or mixed-effects linear regression model.
#'
#' @return A plot and a test results in the console.
#'
#' @author D. Schmitz & J. Esser
#'
#' @examples
#' data("data_s")
#'
#' model <- lm(sDur ~ typeOfS + pauseDur, data_s)
#'
#' normality_check(model)
#'
#' @export

normality_check <- function(mdl){

  if(!is.null(names(mdl)[1])){

    plot_data <- data.frame(mdl[["residuals"]])
    names(plot_data) <- "resid"

    plot <- ggplot() +
      geom_density(data = plot_data, aes(x=resid), color = "#6EC1E4", fill = "#6EC1E4") +
      theme_bw() +
      xlab("Residuals") +
      ylab("Density")

    test_sw <- shapiro.test(mdl[["residuals"]])

    if(test_sw[[2]] <= 0.05){
      cli::cli_alert_danger(glue::glue(paste("Shapiro-Wilk test, p-value = ", round(test_sw[["p.value"]][[1]], 5), " - residuals are not normal", sep = "")))
    }else{
      cli::cli_alert_info(glue::glue(paste("Shapiro-Wilk test, p-value = ", round(test_sw[["p.value"]][[1]], 5), " - residuals are normal", sep = "")))
    }

  }else{

    plot_data <- data.frame(resid(mdl))
    names(plot_data) <- "resid"

    plot <- ggplot() +
      geom_density(data = plot_data, aes(x=resid), color = "#6EC1E4", fill = "#6EC1E4") +
      theme_bw() +
      xlab("Residuals") +
      ylab("Density")

    test_sw <- shapiro.test(resid(mdl))

    if(test_sw[[2]] <= 0.05){
      cli::cli_alert_danger(glue::glue(paste("Shapiro-Wilk test, p-value = ", round(test_sw[["p.value"]][[1]], 5), " - residuals are not normal", sep = "")))
    }else{
      cli::cli_alert_info(glue::glue(paste("Shapiro-Wilk test, p-value = ", round(test_sw[["p.value"]][[1]], 5), " - residuals are normal", sep = "")))
    }

  }

  return(plot)
}
