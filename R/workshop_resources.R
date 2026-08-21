.sfl_resource_base <- "https://dosc91.github.io/SfL"

.make_resource_rows <- function(type, year, edition, sessions, paths) {
  data.frame(
    type = type,
    year = as.integer(year),
    edition = edition,
    session = as.integer(sessions),
    url = paste(.sfl_resource_base, paths, sep = "/"),
    stringsAsFactors = FALSE
  )
}

.sfl_resources <- do.call(
  rbind,
  list(
    .make_resource_rows(
      "slide", 2021, "english", c(1, 3:7),
      sprintf("slides/SfL_Session_%02d.pdf", c(1, 3:7))
    ),
    .make_resource_rows(
      "slide", 2022, "german", c(1, 3:7, 9:10),
      c(
        "slides/01_Willkommen_und_Organisatorisches.pdf",
        "slides/03_Statistische_Messgroessen.pdf",
        "slides/04_Statistische_Tests.pdf",
        "slides/05_Datenvisualisierung_mit_ggplot2.pdf",
        "slides/06_Simple_Lineare_Regression.pdf",
        "slides/07_Multiple_Lineare_Regression.pdf",
        "slides/09_Probleme_Linearer_Regression.pdf",
        "slides/10_Gemischte_Modelle_1.pdf"
      )
    ),
    .make_resource_rows(
      "slide", 2023, "hannover", 1:14,
      c(
        "slides/hannover/01_Begruessung_Kennenlernen.pdf",
        "slides/hannover/02_Einfuehrung_in_R_und_RStudio.pdf",
        "slides/hannover/03_Statistische_Messgroessen.pdf",
        "slides/hannover/04_Statistische_Tests.pdf",
        "slides/hannover/05_ANOVA_und_Co.pdf",
        "slides/hannover/06_Datenvisualisierung_mit_ggplot2.pdf",
        "slides/hannover/07_Clustering_Classification.pdf",
        "slides/hannover/08_Einfache_Lineare_Regression.pdf",
        "slides/hannover/09_Multiple_Lineare_Regression.pdf",
        "slides/hannover/10_Visualisierung_Linearer_Regression.pdf",
        "slides/hannover/11_Kollinearitaet.pdf",
        "slides/hannover/12_Gemischte_Lineare_Regression.pdf",
        "slides/hannover/13_Weitere_Regressionsarten.pdf",
        "slides/hannover/14_Fragerunde_Abschluss.pdf"
      )
    ),
    .make_resource_rows(
      "slide", 2026, "marburg", 1:10,
      c(
        "slides/marburg/01_Intro_und_Vorstellungsrunde.pdf",
        "slides/marburg/02_Vom_Forschungsdesign_zum_Modell.pdf",
        "slides/marburg/03_Lineare_Regression.pdf",
        "slides/marburg/04_Multiple_Regression_Kontrollvariablen.pdf",
        "slides/marburg/05_Interaktionen.pdf",
        "slides/marburg/06_Logistische_Regression.pdf",
        "slides/marburg/07_Gemischte_Modelle.pdf",
        "slides/marburg/08_Kollinearitaet.pdf",
        "slides/marburg/09_Modelldiagnostik_Modellkomplexitaet.pdf",
        "slides/marburg/10_Ergebnisse_kommunizieren.pdf"
      )
    ),
    .make_resource_rows(
      "exercise", 2021, "english", 2:7,
      c(
        "exercises/Introduction_to_R_and_RStudio.html",
        "exercises/Data_Visualisation.html",
        "exercises/Simple_Linear_Regression.html",
        "exercises/Multiple_Linear_Regression.html",
        "exercises/Linear_Mixed_Effects_Models_Part1.html",
        "exercises/Linear_Mixed_Effects_Models_Part2.html"
      )
    ),
    .make_resource_rows(
      "exercise", 2022, "german", 2:12,
      c(
        "exercises/02_Einfuehrung_in_R_und_RStudio.html",
        "exercises/03_Statistische_Messgroessen.html",
        "exercises/04_Statistische_Tests.html",
        "exercises/05_Datenvisualisierung_mit_ggplot2.html",
        "exercises/06_Simple_Lineare_Regression.html",
        "exercises/07_Multiple_Lineare_Regression.html",
        "exercises/08_Visualisierung_Linearer_Regression.html",
        "exercises/09_Probleme_Linearer_Regression.html",
        "exercises/10_Gemischte_Modelle.html",
        "exercises/10_Gemischte_Modelle.html",
        "exercises/12_Weitere_Themen.html"
      )
    ),
    .make_resource_rows(
      "exercise", 2023, "hannover", 2:13,
      c(
        "exercises/hannover/02_Einfuehrung_in_R_und_RStudio.html",
        "exercises/hannover/03_Statistische_Messgroessen.html",
        "exercises/hannover/04_Statistische_Tests.html",
        "exercises/hannover/05_ANOVA_und_Co.html",
        "exercises/hannover/06_Datenvisualisierung_mit_ggplot2.html",
        "exercises/hannover/07_Clustering_Classification.html",
        "exercises/hannover/08_Einfache_Lineare_Regression.html",
        "exercises/hannover/09_Multiple_Lineare_Regression.html",
        "exercises/hannover/10_Visualisierung_Linearer_Regression.html",
        "exercises/hannover/11_Kollinearitaet.html",
        "exercises/hannover/12_Gemischte_Lineare_Regression.html",
        "exercises/hannover/13_Weitere_Regressionsarten.html"
      )
    ),
    .make_resource_rows(
      "exercise", 2026, "marburg", 3:10,
      c(
        "exercises/Marburg/03_Lineare_Regression.html",
        "exercises/Marburg/04_Multiple_Regression_Kontrollvariablen.html",
        "exercises/Marburg/05_Interaktionen.html",
        "exercises/Marburg/06_Logistische_Regression.html",
        "exercises/Marburg/07_Gemischte_Modelle.html",
        "exercises/Marburg/08_Kollinearitaet.html",
        "exercises/Marburg/09_Modelldiagnostik_Modellkomplexitaet.html",
        "exercises/Marburg/10_Ergebnisse_kommunizieren.html"
      )
    )
  )
)

.resource_url <- function(session, year, edition, type) {
  if (length(session) != 1L || is.na(session) || !is.numeric(session) ||
      session != as.integer(session) || session < 1) {
    stop("`session` must be one positive whole number.", call. = FALSE)
  }
  if (length(year) != 1L || is.na(year) || !is.numeric(year) ||
      year != as.integer(year)) {
    stop("`year` must be one four-digit number.", call. = FALSE)
  }
  if (length(edition) != 1L || is.na(edition) || !is.character(edition) ||
      !nzchar(trimws(edition))) {
    stop("`edition` must be one non-empty character value.", call. = FALSE)
  }

  edition <- tolower(trimws(edition))
  workshop <- .sfl_resources[
    .sfl_resources$type == type &
      .sfl_resources$year == as.integer(year) &
      .sfl_resources$edition == edition,
    ,
    drop = FALSE
  ]

  if (!nrow(workshop)) {
    message(sprintf("No %s resources are registered for the %s %s workshop.",
                    type, edition, as.integer(year)))
    return(NULL)
  }

  match_row <- workshop[workshop$session == as.integer(session), , drop = FALSE]
  if (!nrow(match_row)) {
    available <- paste(sprintf("%02d", workshop$session), collapse = ", ")
    message(sprintf(
      "No %s is registered for session %02d. Available sessions: %s.",
      type, as.integer(session), available
    ))
    return(NULL)
  }

  match_row$url[[1L]]
}

.open_workshop_resource <- function(session, year, edition, type, language) {
  if (!is.null(language)) {
    stop("`language` is deprecated; use `edition` instead.", call. = FALSE)
  }
  url <- .resource_url(session, year, edition, type)
  if (!is.null(url)) {
    utils::browseURL(url)
  }
  invisible(url)
}

#' Open workshop slides
#'
#' Opens the PDF slides registered for a workshop session in the default web
#' browser. Resources are hosted on the SfL GitHub Pages site.
#'
#' @param session Session number.
#' @param year Workshop year.
#' @param edition Workshop edition, such as `"english"`, `"german"`, or
#'   `"hannover"`. Matching is case-insensitive.
#' @param language Deprecated; use `edition`.
#'
#' @return Invisibly returns the selected URL, or `NULL` when no resource is
#'   registered.
#' @references Coretta, S., Casillas, J. V., & Roettger, T. (2021).
#'   learnB4SS: Learning materials for the learnB4SS workshop.
#' @examples
#' \dontrun{
#' open_slide(3, 2021, "english")
#' }
#' @export
open_slide <- function(session, year, edition, language = NULL) {
  .open_workshop_resource(session, year, edition, "slide", language)
}

#' @rdname open_slide
#' @export
open_slides <- function(session, year, edition, language = NULL) {
  open_slide(session, year, edition, language)
}

#' Open workshop exercises
#'
#' Opens the HTML exercises registered for a workshop session in the default
#' web browser. Resources are hosted on the SfL GitHub Pages site.
#'
#' @inheritParams open_slide
#'
#' @return Invisibly returns the selected URL, or `NULL` when no resource is
#'   registered.
#' @references Coretta, S., Casillas, J. V., & Roettger, T. (2021).
#'   learnB4SS: Learning materials for the learnB4SS workshop.
#' @examples
#' \dontrun{
#' open_exercise(3, 2026, "marburg")
#' }
#' @export
open_exercise <- function(session, year, edition, language = NULL) {
  .open_workshop_resource(session, year, edition, "exercise", language)
}

#' @rdname open_exercise
#' @export
open_exercises <- function(session, year, edition, language = NULL) {
  open_exercise(session, year, edition, language)
}
