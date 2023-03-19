#' Compute Correlation Coefficients
#'
#' @description \code{corfun} computes the Pearson or Spearman correlation coefficients for all variable pairs. Pearson is computed for comparisons of
#' normally distributed numeric variables, Spearman for all other comparisons.
#'
#'
#' @param data The data set containing the variables.
#' @param variables The variables for which correlation coefficients are to be computed.
#'
#' @author D. Schmitz
#'
#' @examples
#' data("data_s")
#'
#' corfun(data_s, c("sDurLog", "speakingRate", "typeOfS"))
#'
#' corfun(data_s, c("sDurLog", "speakingRate", "typeOfS", "sDur"))
#'
#' corfun(data_s, c("sDurLog", "speakingRate", "typeOfS", "sDur", "pauseDur", "pauseBin"))
#'
#' @export

corfun <- function(data, variables){

  if(length(variables) == 1){
    stop("Cannot compute correlation coefficient for a single variable.")
  }

  idx <- match(variables, names(data))

  workingdata <- data[,idx]

  rchoice <- data.frame()

  for (i in 1:ncol(workingdata)) {

    type <- is.numeric(workingdata[,i])

    if(type == TRUE){

      normality <- shapiro.test(workingdata[,i])$p.value

      if(normality >= 0.05){

        rchoice[i,1] <- "pearson"

      } else if(normality <= 0.05){

        rchoice[i,1] <- "spearman"

      }

    } else if(type == FALSE){

      rchoice[i,1] <- "spearman"

    }

  }

  rownames(rchoice) <- variables

  coefficients <- data.frame()

  var_combs <- combn(variables, 2)

  for (k in 1:ncol(var_combs)) {

    c1 <- rchoice$V1[rownames(rchoice) == var_combs[1,k]]
    c2 <- rchoice$V1[rownames(rchoice) == var_combs[2,k]]

    if(c1 == "spearman" | c2 == "spearman"){

      x <- unlist(workingdata[rownames(rchoice) == var_combs[1,k]])
      y <- unlist(workingdata[rownames(rchoice) == var_combs[2,k]])

      coefficients[k,1] <- stats::cor.test(method = "spearman",
                                           as.numeric(x),
                                           as.numeric(y),
                                           warn = -1)[["estimate"]][["rho"]]

    } else {

      x <- unlist(workingdata[rownames(rchoice) == var_combs[1,k]])
      y <- unlist(workingdata[rownames(rchoice) == var_combs[2,k]])

      coefficients[k,1] <- stats::cor.test(method = "pearson",
                                           as.numeric(x),
                                           as.numeric(y),
                                           warn = -1)[["estimate"]][["cor"]]

    }

  }

  test <- data.frame(matrix(nrow = length(variables), ncol = length(variables)))

  rownames(test) <- variables
  colnames(test) <- variables

  for(m in 1:ncol(var_combs)){

    v1r <- which(rownames(test) == var_combs[1,m])
    v1c <- which(colnames(test) == var_combs[1,m])

    v2r <- which(rownames(test) == var_combs[2,m])
    v2c <- which(colnames(test) == var_combs[2,m])

    test[v1r,v2c] <- coefficients[m,]

    test[v2r,v1c] <- coefficients[m,]

  }

  test[upper.tri(test)] <- NA

  print(knitr::kable(test, format = "pipe", digits = 3, caption = "The following correlation coefficients were found:"))

}
