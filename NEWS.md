# SfL 1.0.2

* Added the Marburg 2026 HTML exercises for sessions 03 through 10 to the
  workshop resource catalogue.

# SfL 1.0.1

## Data

- Added `data_l`, a 7,200-observation lexical-decision teaching data set with
  reaction times, response accuracy, experimental conditions, and lexical
  predictors.

# SfL 1.0.0

## Installation and dependencies

- Reduced the package's hard dependencies to base-recommended packages;
  `lme4` is now optional and needed only by the mixed-model helpers.
- Added `install_workshop_packages()` for the optional workshop plotting
  stack.
- Removed the dependency on `MuMIn`.

## Functions

- Added `mixed_model_r2()` for marginal and conditional R-squared values from
  Gaussian `lme4::lmer()` models, including random-slope models.
- Centralized slide and exercise links so new workshop resources can be added
  in one place.
- Retained singular and plural resource-opening function names for backward
  compatibility.
- Reimplemented small formatting, grouping, and correlation-plot helpers with
  base R.
- Corrected argument handling and result construction in several statistical
  helpers.

## Quality and documentation

- Added automated tests and current package metadata.
- Updated documentation, examples, vignettes, and installation instructions.
