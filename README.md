# SfL - Statistics for Linguistics <img src='https://github.com/dosc91/SfL/blob/gh-pages/logo/sfl_logo.svg' align="right" height="138" />

<!-- badges: start -->
![](https://img.shields.io/badge/version-0.1-FFA70B.svg)
![](https://img.shields.io/github/last-commit/dosc91/SfL)
<!-- badges: end -->

The `SfL` package was created to accompany the <a href="https://forensic-linguistics-sc.com/workshop/" target="_blank">Statistics for Linguistics</a> online workshop. It comes with exercises and exemplary data sets.

## How to Install

The preferred way to install this package is through devtools:

```r
devtools::install_github("dosc91/SfL", upgrade_dependencies = FALSE)
```

All required packages should automatically be installed along the way.

If installation ends without errors but with the following warning, everything should be in order:

```r
Warning message:
1 components of `...` were not used.

We detected these problematic arguments:
* `upgrade_dependencies`

Did you misspecify an argument? 
```

## Exercises

Use the `open_exercise()` function to open the exercises for one of the workshop's sessions.

```r
open_exercise(session_number)
```

Currently, there are exercises (planned) for sessions 02, 03, 04, 05, 06, and 07.

## Info

This package is still very much a work in progress and should not yet be used.

Please cite the package as follows:

Schmitz, Dominic & Esser, Janina. (2021). SfL: Statistics for Linguistics. R package version 0.1. URL: https://github.com/dosc91/SfL
