#' Compute Predictor Strength
#'
#' @description Given a dependent variable, a set of fixed effect variables, and a random effect structure, this function creates an \code{lmer} model
#' for each predictor variable, lacking that predictor variable.
#' Then, conditional and marginal coefficients of determination for each model are calculated. Comparing the value of the conditional coefficient
#' of determination across all models, one can conclude the predictor strength of the respective missing predictor.
#' The function uses \code{MuMIn::r.squaredGLMM} to compute coefficients of determination.
#'
#'
#' @usage \code{predictor_strength(dependent = "",
#'                    fixed = c(""),
#'                    random_str = c("( | )"),
#'                    data = )}
#'
#' @param dependent The dependent variable for all models.
#' @param fixed The independent variables, i.e. the fixed effects, for all models.
#' @param random_str The random effect structure for all models.
#' @param data The original data set.
#'
#' @return A dataframe containing the conditional and marginal coefficients of determination for each model, and a column defining the variable the
#' values belong to.
#'
#' @author D. Schmitz & J. Esser
#'
#' @references Douglas Bates, Martin Maechler, Ben Bolker, Steve Walker (2015). Fitting Linear Mixed-Effects Models Using lme4. Journal of
#' Statistical Software, 67(1), 1-48. doi:10.18637/jss.v067.i01.
#' @references Kamil Barton (2020). MuMIn: Multi-Model Inference. R package version 1.43.17. https://CRAN.R-project.org/package=MuMIn
#' @references Nakagawa, S., Johnson, P.C.D., Schielzeth, H. (2017) The coefficient of determination R? and intra-class correlation coefficient
#' from generalized linear mixed-effects models revisited and expanded. J. R. Soc. Interface 14: 20170213.
#' @references R Core Team (2021). R: A language and environment for statistical computing. R Foundation for Statistical Computing, Vienna,
#' Austria. URL https://www.R-project.org/.
#'
#' @examples
#' data("data_s")
#'
#' predictor_strength(dependent = "sDur",
#'         fixed = c("pauseBin", "list", "folType", "baseDur"),
#'         random_str = c("(1 | speaker) + (1 | item)"),
#'         data = data_s)
#'
#' @export

predictor_strength <- function(dependent, fixed, random_str, data) {

  # extract variables, create all possible combinations as columns
  vars <- fixed

  formulae_df <- utils::combn(x=vars, m=length(vars)-1)
  formulae_df <- as.data.frame(formulae_df)

  # create formulae of models
  formulae <- data.frame(matrix(ncol = 1, nrow = 0))

  for (k in 1:length(colnames(formulae_df))) {
    formulae[k,] <- paste(dependent,
                          paste("~"),
                          paste(formulae_df[,k], collapse = " + "),
                          paste(" + "),
                          paste(random_str, collapse = " + "))
  }

  #create models
  r_values <- data.frame(matrix(ncol = 1, nrow = 0))

  for (m in 1:length(colnames(formulae_df))) {
    running_form <- as.formula(formulae[m,])

    running_model <- lme4::lmer(running_form, data, REML=F)

    r_values[m,1:2] <- MuMIn::r.squaredGLMM(running_model)[,1:2]
  }

  #add predictor names
  for (n in 1:length(formulae_df)) {
    for (p in 1:length(fixed)) {
      if (grepl(fixed[p], formulae_df[n]) == FALSE){
        r_values[n,3] <- fixed[p]
      }
    }
  }

  #rename columns
  names(r_values)[names(r_values) == "matrix.ncol...1..nrow...0."] <- "R2m"
  names(r_values)[names(r_values) == "V2"] <- "R2c"
  names(r_values)[names(r_values) == "V3"] <- "predictor"

  r_values <- r_values[,c(3,1,2)]

  return(r_values)
}
