#' Create Error Bar Dataframe
#'
#' @description Create a dataframe with which a \code{ggplot2} bar plot with error bars (+/- 1 standard deviation) can be created.
#'
#' @usage \code{create_error_bar_df(data = ,
#'                    numerical = "",
#'                    factors = "",
#'                    size = 1,
#'                    type = "sd")}
#'
#' @param data The original data set.
#' @param numerical The numerical variable which will be visualised in the bar plot.
#' @param factors One or more factor variables which will be used for grouping.
#' Use \code{c("var1", "var2")} for multiple grouping variables.
#' @param size Choose whether you want more/less than 1 standard deviation/standard error. Defaults to 1.
#' @param type Choose between "sd" (standard deviation) and "std" (standard error). Defaults to "sd".
#'
#' @return A dataframe object.
#'
#' @author D. Schmitz
#'
#' @examples
#' data("data_s")
#'
#' create_error_bar_df(data = data_s, numerical = "sDur", factors = "pauseBin", size = 1, type = "sd")
#'
#' @export

create_error_bar_df <- function(data, numerical, factors, size = 1, type = "sd"){

  std <- function(x) sd(x)/sqrt(length(x))

  summary_function_sd <- function(x, col){
    c(mean = mean(x[[col]], na.rm=TRUE), sd = size * (sd(x[[col]], na.rm=TRUE)))
  }

  summary_function_std <- function(x, col){
    c(mean = mean(x[[col]], na.rm=TRUE), std = size * std(x[[col]]))
  }

  if(type == "sd"){
    data_sum <- plyr::ddply(data, factors, .fun=summary_function_sd, numerical)
  } else if(type == "std") {
    data_sum <- plyr::ddply(data, factors, .fun=summary_function_std, numerical)
  } else {
    cli::cli_alert_danger(
      glue::glue("type can be 'sd' (standard deviation) or 'std' (standard error)")
    )
  }

  data_sum <- plyr::rename(data_sum, c("mean" = numerical))

  return(data_sum)
}
