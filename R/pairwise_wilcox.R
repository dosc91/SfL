#' Compute Pairwise Wilcoxon Tests
#'
#' @description \code{pairwise_wilcox} computes pairwise Wilcoxon tests as a wrapper of \code{stats::pairwise.wilcox.test}.
#'
#'
#' @param predictor The categorical predictor of interest.
#' @param data The data set containing the variables including the predictions.
#' @param method Any of the typical methods, e.g. \code{holm} (the default) or \code{bonferroni}.
#' @param x Numerical value passed on to \code{round} the output's p-values.
#'
#' @author J. Esser
#'
#' @export

pairwise_wilcox <- function(predictor, data, method = "holm", x = 6){

  pred_col <- which(names(data) == predictor)

  t1 <- pairwise.wilcox.test(data$PredictedSize.1,
                             data[,pred_col],
                             p.adjust.method = method)[["p.value"]]
  t2 <- pairwise.wilcox.test(data$PredictedSize.2,
                             data[,pred_col],
                             p.adjust.method = method)[["p.value"]]
  t3 <- pairwise.wilcox.test(data$PredictedSize.3,
                             data[,pred_col],
                             p.adjust.method = method)[["p.value"]]
  t4 <- pairwise.wilcox.test(data$PredictedSize.4,
                             data[,pred_col],
                             p.adjust.method = method)[["p.value"]]
  t5 <- pairwise.wilcox.test(data$PredictedSize.5,
                             data[,pred_col],
                             p.adjust.method = method)[["p.value"]]

  # Combine data frames into a list
  df_list <- list(t1,t2,t3,t4,t5)

  # Calculate the mean for each cell across data frames
  p_vals <- round(Reduce("+", df_list) / length(df_list), x)

  return(p_vals)
}
