#' Open Exercise
#'
#' @description Calling \code{open_exercise} with a session number as argument will open the exercise html for that session.
#' The html will be opened in your default browser. This function is inspired by Coretta et al. (see references).
#'
#' @usage open_exercise(session_number, year, language = "")
#'
#' @param session_number The number of the SfL session.
#' @param year The year of the SfL workshop. Currently either \code{2021} or \code{2022}.
#' @param language The language of the SfL workshop. Currently either \code{"english"} or \code{"german"}.
#'
#' @return Nothing.
#'
#' @author D. Schmitz
#'
#' @references Coretta, Stefano, Casillas, Joseph V., and Roettger, Timo. (2021). learnB4SS: Learning materials for the learnB4SS workshop. R package version 1.0.0. https://github.com/learnB4SS/learnB4SS
#'
#' @examples
#' open_exercise(02, 2021, "english")
#'
#' @export

open_exercises <- function(session, year, language) {

  num <- stringr::str_pad(session, 2, pad = '0')

  if (year == 2021 & language == "english"){

    real_session <- session - 1

    if (real_session > 0 & real_session < 7) {

      utils::browseURL(exercises_2021_english[real_session])

    } else {

      cli::cli_alert_danger(

        glue::glue("I am not aware of exercises for session {num}! Currently, I only know of exercises for sessions 02, 03, 04, 05, 06, and 07!")

      )
    }
  } else if(year == 2022 & language == "german"){

    real_session <- session - 1

    if (real_session > 0 & real_session < 12) {

      utils::browseURL(exercises_2022_german[real_session])

    }else {

      cli::cli_alert_danger(

        glue::glue("I am not aware of exercises for session {num}! Currently, I only know of exercises for sessions 02, 03, 04, 05, 06, 07, 08, 09, 10, 11, and 12!")

      )
    }
  } else {
    cli::cli_alert_danger(
      glue::glue(paste(paste("Sorry, I have no data for an SfL workshop in", language, "in", year), ".", sep = ""))
    )
  }
}


exercises_2021_english <- c(
  "https://dosc91.github.io/SfL/exercises/Introduction_to_R_and_RStudio.html",
  "https://dosc91.github.io/SfL/exercises/Data_Visualisation.html",
  "https://dosc91.github.io/SfL/exercises/Simple_Linear_Regression.html",
  "https://dosc91.github.io/SfL/exercises/Multiple_Linear_Regression.html",
  "https://dosc91.github.io/SfL/exercises/Linear_Mixed_Effects_Models_Part1.html",
  "https://dosc91.github.io/SfL/exercises/Linear_Mixed_Effects_Models_Part2.html"
)

exercises_2022_german <- c(
  "https://dosc91.github.io/SfL/exercises/02_Einfuehrung_in_R_und_RStudio.html",
  "https://dosc91.github.io/SfL/exercises/03_Statistische_Messgroessen.html",
  "https://dosc91.github.io/SfL/exercises/04_Statistische_Tests.html",
  "https://dosc91.github.io/SfL/exercises/05_Datenvisualisierung_mit_ggplot2.html",
  "https://dosc91.github.io/SfL/exercises/06_Simple_Lineare_Regression.html",
  "https://dosc91.github.io/SfL/exercises/07_Multiple_Lineare_Regression.html",
  "https://dosc91.github.io/SfL/exercises/08_Visualisierung_Linearer_Regression.html",
  "https://dosc91.github.io/SfL/exercises/09_Probleme_Linearer_Regression.html",
  "https://dosc91.github.io/SfL/exercises/10_Gemischte_Modelle.html",
  "https://dosc91.github.io/SfL/exercises/10_Gemischte_Modelle.html",
  "https://dosc91.github.io/SfL/exercises/12_Weitere_Themen.html"
)


