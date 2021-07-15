#' Open markdown file.
#'
#' Call this function with the session number as argument and the corresponding RMarkdown
#' file will be copied in the working directory and opened in the editor.
#'
#' The following sessions have markdown files:
#'
#' - Session 01.
#'
#' @param session Session number as a number.
#'
#' @return Nothing. Used for its side effects.
#' @export
load_markdown <- function (session)
{
  num <- stringr::str_pad(session, 2, pad = "0")
  ex_num <- glue::glue("markdown_{stringr::str_pad(session, 2, pad = '0')}")
  if (!(num %in% c("02", "03", "04"))) {
    cli::cli_alert_danger(glue::glue("Session {num} does not have a markdown file! Choose Session 01."))
  }
  else {
    v_path <- get_vignette_path(ex_num, package = "SfL")
    file.copy(v_path, ".")
    usethis::edit_file(glue::glue("./{markdown_num}.Rmd"))
  }
}

get_vignette_path <- function(...) {
  v <- utils::vignette(...)
  file.path(v$Dir, "doc", v$File)
}
