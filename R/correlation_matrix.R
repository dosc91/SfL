#' Create a correlation plot matrix
#'
#' Creates a base-R pairs plot with correlations in the lower triangle,
#' optional histograms on the diagonal, and optional smoothers in the upper
#' triangle.
#'
#' @param data A data frame containing the variables.
#' @param variables Character vector naming the variables to plot. Character
#'   columns are not supported.
#' @param hist Show histograms on the diagonal.
#' @param smooth Show LOWESS smoothers in the upper triangle.
#' @param size Point expansion factor.
#' @param color Point and smoother colour.
#'
#' @return Invisibly returns the data frame used for plotting.
#' @examples
#' data("data_s")
#' correlation_matrix(data_s, c("typeOfS", "sDur"))
#' @export
correlation_matrix <- function(data, variables, hist = TRUE, smooth = TRUE,
                               size = 1, color = "darkgrey") {
  if (!is.data.frame(data)) stop("`data` must be a data frame.", call. = FALSE)
  if (!is.character(variables) || length(variables) < 2L ||
      any(!variables %in% names(data))) {
    stop("`variables` must name at least two columns in `data`.", call. = FALSE)
  }
  selected <- data[variables]
  if (any(vapply(selected, is.character, logical(1)))) {
    stop("Character columns are not supported; convert them to factors first.",
         call. = FALSE)
  }
  plot_data <- as.data.frame(lapply(selected, function(x) {
    if (is.factor(x)) as.numeric(x) else x
  }))

  panel_cor <- function(x, y, ...) {
    old_usr <- graphics::par("usr")
    on.exit(graphics::par(usr = old_usr))
    graphics::par(usr = c(0, 1, 0, 1))
    keep <- stats::complete.cases(x, y)
    label <- "NA"
    if (sum(keep) >= 3L) {
      method <- if (.correlation_method(x[keep]) == "pearson" &&
                    .correlation_method(y[keep]) == "pearson") "pearson" else "spearman"
      coefficient <- suppressWarnings(stats::cor(x[keep], y[keep], method = method))
      label <- sprintf("%s\n%.2f", if (method == "pearson") "r" else "rho", coefficient)
    }
    graphics::text(0.5, 0.5, label)
  }
  panel_hist <- function(x, ...) {
    old_usr <- graphics::par("usr")
    on.exit(graphics::par(usr = old_usr))
    x <- x[is.finite(x)]
    if (!length(x)) return(invisible(NULL))
    histogram <- graphics::hist(x, plot = FALSE)
    ymax <- max(histogram$counts)
    graphics::par(usr = c(range(histogram$breaks), 0, ymax * 1.1))
    graphics::rect(
      histogram$breaks[-length(histogram$breaks)], 0,
      histogram$breaks[-1L], histogram$counts,
      col = grDevices::adjustcolor(color, alpha.f = 0.5), border = "white"
    )
  }
  panel_points <- function(x, y, ...) {
    graphics::points(x, y, cex = size, col = color)
    if (isTRUE(smooth)) {
      keep <- stats::complete.cases(x, y)
      if (sum(keep) >= 3L) graphics::lines(stats::lowess(x[keep], y[keep]), col = color)
    }
  }

  graphics::pairs(
    plot_data,
    labels = variables,
    lower.panel = panel_cor,
    diag.panel = if (isTRUE(hist)) panel_hist else NULL,
    upper.panel = panel_points
  )
  invisible(selected)
}
