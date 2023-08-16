#' Open Slide
#'
#' @description Calling \code{open_slides} with a session number as argument will open the powerpoint slides for that session as pdf.
#' The pdf will be opened in your default browser. This function is inspired by Coretta et al. (see references).
#'
#' @param session_number The number of the SfL session.
#' @param year The year of the SfL workshop. Currently either \code{2021} or \code{2022}.
#' @param edition The edition of the SfL workshop. Either \code{"english"}, \code{"german"}, or \code{"hannover"}.
#' @param language Deprecated. Please use \code{edition} instead.
#'
#' @return Nothing.
#'
#' @author D. Schmitz
#'
#' @references Coretta, S., Casillas, J. V., & Roettger, T. (2021). learnB4SS: Learning materials for the learnB4SS workshop. R package version 1.0.0. https://github.com/learnB4SS/learnB4SS
#'
#' @examples
#' open_slide(02, 2021, "english")
#'
#' @export

open_slide <- function(session, year, edition, language = NULL) {

  if(!is.null(language)){
    stop("Please use edition instead of language! Check documentation for further information.")
  }

  num <- stringr::str_pad(session, 2, pad = '0')

  if (year == 2021 & edition == "english" | year == 2021 & edition == "English"){

    real_session <- session - 0

    if (real_session == 1) {

      utils::browseURL(slides_2021_english[real_session])

    }

    else if (real_session > 2 & real_session < 8) {

      utils::browseURL(slides_2021_english[real_session])

    } else {

      cli::cli_alert_danger(

        glue::glue("I am not aware of slides for session {num}! Currently, I only know of slides for sessions 02, 03, 04, 05, 06, and 07!")

      )

    }
  }

  else if(year == 2022 & edition == "german" | year == 2022 & edition == "German"){

    real_session <- session - 0

    if (real_session == 1) {

      utils::browseURL(slides_2022_german[real_session])

    }else if (real_session > 2 & real_session < 8) {

      real_session <- real_session - 1

      utils::browseURL(slides_2022_german[real_session])

    }else if (real_session == 8){

      cli::cli_alert_danger(
        glue::glue("I am not aware of slides for session {num}! Currently, I only know of slides for sessions 01, 03, 04, 05, 06, 07, 09, and 10!")
      )

    } else if (real_session > 8 & real_session < 11) {

    real_session <- real_session - 2

    utils::browseURL(slides_2022_german[real_session])

    }else{
      cli::cli_alert_danger(

        glue::glue(paste(paste("I am not aware of slides for session {num}! Currently, I only know of slides for sessions 01, 03, 04, 05, 06, 07, 09, and 10!")))

      )
    }
  }

  else if(year == 2023 & edition == "german" | year == 2023 & edition == "German"){

    real_session <- session - 0

    if (real_session == 1) {

      utils::browseURL(slides_2023_german[real_session])

    }else if (real_session > 2 & real_session < 13) {

      real_session <- real_session - 1

      utils::browseURL(slides_2023_german[real_session])

    }else if (real_session == 2 | real_session >= 13){

      cli::cli_alert_danger(
        glue::glue("I am not aware of slides for session {num}! Currently, I only know of slides for sessions 01, 03, 04, 05, 06, 07, 08, 09, 10, 11, and 12!")
      )

    }
  }

  else if(year == 2023 & edition == "hannover" | year == 2023 & edition == "Hannover"){

    real_session <- session - 0

    if (real_session >= 1 & real_session <= 14) {

      utils::browseURL(slides_2023_hannover[real_session])

    }else{
      cli::cli_alert_danger(

        glue::glue(paste(paste("I am not aware of slides for session {num}! Currently, I only know of slides for sessions 01, 02, 03, 04, 05, 06, 07, 08, 09, 10, 11, 12, 13, and 14!")))

      )
    }
  }

}


slides_2021_english <- c(
  "https://dosc91.github.io/SfL/slides/SfL_Session_01.pdf",
  "https://dosc91.github.io/SfL/slides/SfL_Session_02.pdf",
  "https://dosc91.github.io/SfL/slides/SfL_Session_03.pdf",
  "https://dosc91.github.io/SfL/slides/SfL_Session_04.pdf",
  "https://dosc91.github.io/SfL/slides/SfL_Session_05.pdf",
  "https://dosc91.github.io/SfL/slides/SfL_Session_06.pdf",
  "https://dosc91.github.io/SfL/slides/SfL_Session_07.pdf"
)


slides_2022_german <- c(
  "https://dosc91.github.io/SfL/slides/01_Willkommen_und_Organisatorisches.pdf",
  "https://dosc91.github.io/SfL/slides/03_Statistische_Messgroessen.pdf",
  "https://dosc91.github.io/SfL/slides/04_Statistische_Tests.pdf",
  "https://dosc91.github.io/SfL/slides/05_Datenvisualisierung_mit_ggplot2.pdf",
  "https://dosc91.github.io/SfL/slides/06_Simple_Lineare_Regression.pdf",
  "https://dosc91.github.io/SfL/slides/07_Multiple_Lineare_Regression.pdf",
  "https://dosc91.github.io/SfL/slides/09_Probleme_Linearer_Regression.pdf",
  "https://dosc91.github.io/SfL/slides/10_Gemischte_Modelle_1.pdf"
)

slides_2023_hannover <- c(
  "https://dosc91.github.io/SfL/slides/hannover/01_Begr%C3%BC%C3%9Fung_Kennenlernen.pdf",
  "https://dosc91.github.io/SfL/slides/hannover/02_Einf%C3%BChrung_in_R_und_RStudio.pdf",
  "https://dosc91.github.io/SfL/slides/hannover/03_Statistische_Messgroessen.pdf",
  "https://dosc91.github.io/SfL/slides/hannover/04_Statistische_Tests.pdf",
  "https://dosc91.github.io/SfL/slides/hannover/05_ANOVA_und_Co.pdf",
  "https://dosc91.github.io/SfL/slides/hannover/06_Datenvisualisierung_mit_ggplot2.pdf",
  "https://dosc91.github.io/SfL/slides/hannover/07_Clustering_Classification.pdf",
  "https://dosc91.github.io/SfL/slides/hannover/08_Einfache_Lineare_Regression.pdf",
  "https://dosc91.github.io/SfL/slides/hannover/09_Multiple_Lineare_Regression.pdf",
  "https://dosc91.github.io/SfL/slides/hannover/10_Visualisierung_Linearer_Regression.pdf",
  "https://dosc91.github.io/SfL/slides/hannover/11_Kollinearit%C3%A4t.pdf",
  "https://dosc91.github.io/SfL/slides/hannover/12_Gemischte_Lineare_Regression.pdf",
  "https://dosc91.github.io/SfL/slides/hannover/13_Weitere_Regressionsarten.pdf",
  "https://dosc91.github.io/SfL/slides/hannover/14_Fragerunde_Abschluss.pdf"
)

slides_2023_german <- c(
  "https://dosc91.github.io/SfL/slides/august2023/01_Begr%C3%BC%C3%9Fung_Kennenlernen.pdf",
  "https://dosc91.github.io/SfL/slides/august2023/03_Statistische_Messgroessen.pdf",
  "https://dosc91.github.io/SfL/slides/august2023/04_Statistische_Tests.pdf",
  "https://dosc91.github.io/SfL/slides/august2023/05_Datenvisualisierung_mit_ggplot2.pdf",
  "https://dosc91.github.io/SfL/slides/august2023/06_Einfache_Lineare_Regression.pdf",
  "https://dosc91.github.io/SfL/slides/august2023/07_Multiple_Lineare_Regression.pdf",
  "https://dosc91.github.io/SfL/slides/august2023/08_Visualisierung_Linearer_Regression.pdf",
  "https://dosc91.github.io/SfL/slides/august2023/09_Kollinearit%C3%A4t.pdf",
  "https://dosc91.github.io/SfL/slides/august2023/10_11_Gemischte_Lineare_Regression.pdf",
  "https://dosc91.github.io/SfL/slides/august2023/10_11_Gemischte_Lineare_Regression.pdf",
  "https://dosc91.github.io/SfL/slides/august2023/12_Weitere_Regressionsarten.pdf"
)
