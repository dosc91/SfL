#' Open Slides
#'
#' @description Calling \code{open_slides} with a session number as argument will open the powerpoint slides for that session as pdf.
#' The pdf will be opened in your default browser. This function is inspired by Coretta et al. (see references).
#'
#' @usage \code{open_slides(session_number)}
#'
#' @param session_number The number of a session, i.e. 01, 02, 03, 04, 05, 06, or 07.
#'
#' @return Nothing.
#'
#' @author D. Schmitz
#'
#' @references Coretta, Stefano, Casillas, Joseph V., and Roettger, Timo. (2021). learnB4SS: Learning materials for the learnB4SS workshop. R package version 1.0.0. https://github.com/learnB4SS/learnB4SS
#'
#' @examples
#' open_slides(02)
#'
#' @export

open_slides <- function(session) {
  num <- stringr::str_pad(session, 2, pad = '0')
  real_session <- session - 0

  if (real_session == 1) {
    utils::browseURL(slides[real_session])
  }
  else if (real_session > 2 & real_session < 6) {
    utils::browseURL(slides[real_session])
  }
  else {
    cli::cli_alert_danger(
      glue::glue("I am not aware of slides for session {num}! Currently, I only know of slides for sessions 02, 03, 04, and 05!")
    )
  }
}


slides <- c(
  "https://dosc91.github.io/SfL/slides/SfL_Session_01.pdf",
  "https://dosc91.github.io/SfL/slides/SfL_Session_02.pdf",
  "https://dosc91.github.io/SfL/slides/SfL_Session_03.pdf",
  "https://dosc91.github.io/SfL/slides/SfL_Session_04.pdf",
  "https://dosc91.github.io/SfL/slides/SfL_Session_05.pdf"
)
