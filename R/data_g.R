#' data_g - Gender in German Role Nouns
#'
#' The Gender in German Role Nouns data set, data_g, contains data the semantics of role nouns in German.
#' Semantic measures are measures derived from an implementation of Linear Discriminative Learning.
#'
#' @usage data(data_g)
#'
#' @format A data frame with 678 rows and 7 variables:
#' \describe{
#'   \item{lexome2}{word}
#'   \item{lexome}{word with form information}
#'   \item{type}{type of word}
#'   \item{stereotypicality}{stereotypicality judgement; higher = more masculine}
#'   \item{cor_target}{semantic comprehension quality}
#'   \item{l2norm}{level of semantic co-activation}
#'   \item{density}{semantic neighbourhood density}
#' }
#'
#' @source Schmitz, D., Schneider, V., & Esser, J. (2023). No genericity in sight: An exploration of the semantics of masculine generics in German. Revision invited for Glossa Psycholinguistics. Preprint available on PsyArXiv. doi: 10.31234/osf.io/c27r9
"data_g"
