#' Create Error Bar Dataframe
#'
#' @description Create a dataframe with which a \code{ggplot2} bar plot with error bars (+/- 1 standard deviation) can be created.
#'
#' @usage \code{create_error_bar_df(data, numerical, factors)}
#'
#' @param data The original data set.
#' @param numerical The numerical variable which will be visualised in the bar plot.
#' @param factors
#'
#' @return A dataframe object.
#'
#' @author D. Schmitz
#'
#' @export

create_error_bar_df <- function(data, numerical, factors){
  summary_function <- function(x, col){
    c(mean = mean(x[[col]], na.rm=TRUE), sd = sd(x[[col]], na.rm=TRUE))
  }
  data_sum<-plyr::ddply(data, factors, .fun=summary_function, numerical)
  data_sum <- plyr::rename(data_sum, c("mean" = numerical))
  return(data_sum)
}






