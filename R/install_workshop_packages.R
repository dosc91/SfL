#' Install Workshop Packages
#'
#' Installs optional plotting packages used in the Statistics for Linguistics
#' workshop. Packages that are already installed are skipped.
#'
#' @param packages A character vector of package names. By default, the
#'   ggplot2-related workshop packages are installed.
#' @param dependencies Passed to [utils::install.packages()]. Defaults to
#'   `TRUE`.
#' @param ... Additional arguments passed to [utils::install.packages()].
#'
#' @return Invisibly returns the packages requested for installation.
#'
#' @examples
#' \dontrun{
#' install_workshop_packages()
#' }
#'
#' @export
install_workshop_packages <- function(
    packages = c(
      "ggplot2",
      "gridExtra",
      "gghighlight",
      "ggridges",
      "ggforce",
      "factoextra"
    ),
    dependencies = TRUE,
    ...) {
  if (!is.character(packages) || anyNA(packages) || any(!nzchar(packages))) {
    stop("`packages` must be a character vector of package names.", call. = FALSE)
  }

  packages <- unique(packages)

  if (getRversion() < "4.1.0" && "ggplot2" %in% packages) {
    stop(
      paste0(
        "The current CRAN release of ggplot2 requires R 4.1 or newer. ",
        "Please update R before installing the plotting workshop packages."
      ),
      call. = FALSE
    )
  }

  installed <- rownames(utils::installed.packages())
  missing <- setdiff(packages, installed)

  if (!length(missing)) {
    message("All requested workshop packages are already installed.")
    return(invisible(character()))
  }

  message(
    "Installing workshop package",
    if (length(missing) == 1L) "" else "s",
    ": ",
    paste(missing, collapse = ", ")
  )
  utils::install.packages(missing, dependencies = dependencies, ...)
  invisible(missing)
}
