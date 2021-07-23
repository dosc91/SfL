#' Open Exercise
#'
#' @description Calling \code{open_exercise} with a session number as argument will open the exercise html for that session.
#' The html will be opened in your default browser. This function is inspired by Coretta et al. (see references).
#'
#' @usage \code{open_exercise(session_number)}
#'
#' @param session_number The number of a session, i.e. 02, 03, 04, 05, 06, or 07.
#'
#' @return Nothing.
#'
#' @author D. Schmitz
#'
#' @references Stefano Coretta, Joseph V. Casillas and Timo Roettger (2021). learnB4SS: Learning materials for the learnB4SS workshop. R package version 1.0.0. https://github.com/learnB4SS/learnB4SS
#'
#' @export

open_exercises <- function(session) {
  num <- stringr::str_pad(session, 2, pad = '0')
  real_session <- session - 1

  if (real_session > 0 & real_session < 08) {
    utils::browseURL(slides[real_session])
  } else {
    cli::cli_alert_danger(
      glue::glue("I am not aware of exercises for session {num}! I only know of exercises for sessions 02, 03, 04, 05, 06, and 07!")
    )
  }
}


slides <- c(
  "https://dosc91.github.io/SfL/exercises/Introduction_to_R_and_RStudio.html",
  "https://dosc91.github.io/SfL/exercises/Simple_Linear_Regression.html",
  "https://dosc91.github.io/SfL/exercises/Multiple_Linear_Regression.html"
)



