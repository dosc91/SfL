#' data_k - Semantic Correlation Data
#'
#' This data set contains simulated data on the correlation between the semantics of masculine and feminine role nouns in German.
#' A possible question to investigate with this data set is whether the correlation strength depends on the frequency of either role nouns.
#'
#'
#' @format A data frame with 600 rows and 4 variables:
#' \describe{
#'   \item{correlation}{correlation coefficient of a pertinent role noun pair}
#'   \item{freq_masc_log}{log-transformed frequency of masculine role nouns}
#'   \item{freq_fem_log}{log-transformed frequency of feminine role nouns}
#'   \item{wordlength}{word length of the item}
#' }
#' @source Schmitz, D., & Esser, J. (2022). SfL: Statistics for Linguistics. R package version 0.3. URL: https://github.com/dosc91/SfL
#'
"data_k"
