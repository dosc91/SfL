#' Open Exercise
#'
#' @description Calling \code{open_exercise} with a session number as argument will open the exercise html for that session.
#' The html will be opened in your default browser. This function is inspired by Coretta et al. (see references).
#'
#' @usage \code{open_exercise(session_number)}
#'
#' @param session_number The number of a session, i.e. 02, 03, 04, or 05.
#'
#' @return Nothing.
#'
#' @author D. Schmitz
#'
#' @references Coretta, Stefano, Casillas, Joseph V., and Roettger, Timo. (2021). learnB4SS: Learning materials for the learnB4SS workshop. R package version 1.0.0. https://github.com/learnB4SS/learnB4SS
#'
#' @examples
#' open_exercise(02)
#'
#' @export

open_exercise <- function(session) {
  num <- stringr::str_pad(session, 2, pad = '0')
  real_session <- session - 1

  if (real_session > 0 & real_session < 6) {
    utils::browseURL(exercises[real_session])
  } else {
    cli::cli_alert_danger(
      glue::glue("I am not aware of exercises for session {num}! Currently, I only know of exercises for sessions 02, 03, 04, and 05!")
    )
  }
}


exercises <- c(
  "https://dosc91.github.io/SfL/exercises/Introduction_to_R_and_RStudio.html",
  "https://dosc91.github.io/SfL/exercises/Data_Visualisation.html",
  "https://dosc91.github.io/SfL/exercises/Simple_Linear_Regression.html",
  "https://dosc91.github.io/SfL/exercises/Multiple_Linear_Regression.html"
)


