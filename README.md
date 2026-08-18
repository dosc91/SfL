# SfL

<!-- badges: start -->
![Version](https://img.shields.io/badge/version-1.0.0-FFA70B.svg)
![GitHub last commit](https://img.shields.io/github/last-commit/dosc91/SfL)
<!-- badges: end -->

`SfL` supports the **Statistics for Linguistics** workshop. It provides
teaching data, approachable statistical helpers, and links to workshop slides
and exercises hosted on the [SfL website](https://dosc91.github.io/SfL/).

## Installation

Install the development version from GitHub:

```r
install.packages("remotes")
remotes::install_github("dosc91/SfL")
```

SfL supports R 4.0 and newer. The current CRAN release of `ggplot2` requires R
4.1 or newer, so participants using the current plotting stack should update R
before the workshop.

## Workshop plotting packages

Plotting extensions used in workshop materials are optional rather than hard
SfL dependencies. Install them explicitly with:

```r
SfL::install_workshop_packages()
```

The initial set contains `ggplot2`, `gridExtra`, `gghighlight`, `ggridges`,
`ggforce`, and `factoextra`. Already-installed packages are skipped.

## Slides and exercises

Open a registered resource in the default browser:

```r
SfL::open_slide(3, 2021, "english")
SfL::open_exercise(2, 2021, "english")
```

The plural aliases `open_slides()` and `open_exercises()` remain available.
Resource URLs are maintained in one internal catalogue so future workshop PDFs
and exercises can be added without duplicating dispatch logic.

## Documentation

Function documentation is available through R's help system:

```r
help(package = "SfL")
?SfL::predictor_strength
```

Source vignettes live in `vignettes/` and can be rebuilt with:

```r
devtools::build_vignettes()
pkgdown::build_site()
```

## Citation

Please cite the package as:

> Schmitz, D., & Esser, J. (2026). SfL: Statistics for Linguistics. R package
> version 1.0.0. https://github.com/dosc91/SfL

## License

SfL is released under the MIT License.
