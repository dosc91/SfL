# mtqgam <img src='https://dominicschmitz.com/wp-content/uploads/2021/11/SfL_logo.png' align="right" height="138" />

<!-- badges: start -->
![](https://img.shields.io/badge/version-0.3-FFA70B.svg)
![](https://img.shields.io/github/last-commit/dosc91/mtqgam)
<!-- badges: end -->

`SfL` is a package created for the ["Statistics for Linguistics"](https://div-ling.org/en/events/statistics-for-linguistics-en/) workshop. 

It includes some handy functions and data sets, but most importantly installs all necessary packages and contains exercise files.

Check out the [references](https://dosc91.github.io/SfL/reference/index.html) for more detailed information.


# How to Install

The preferred way to install this package is through devtools:

```r
# if devtools has not been installed yet, please install it first
# install.packages("devtools")

# then, install the SfL package
devtools::install_github("dosc91/SfL", upgrade_dependencies = FALSE)
```

You will be asked to update dependencies during installation; usually, updates can be skipped. Once installation was successfull, there will be a warning message on the usage of `...`; this can be ignored.


# References

Please cite the package as follows:

Schmitz, D., & Esser, J. (2022). SfL: Statistics for Linguistics. R package version 0.3. URL: https://github.com/dosc91/SfL

The following sources are made use of in the `SfL` package:

Baayen, R. H, & Shafaei-Bajestan, E. (2019). languageR: Analyzing Linguistic Data: A Practical Introduction to Statistics. R package version 1.5.0. https://CRAN.R-project.org/package=languageR

Barton, K. (2020). MuMIn: Multi-Model Inference. R package version 1.43.17. https://CRAN.R-project.org/package=MuMIn

Bates, D., Maechler, M., Bolker, B., & Walker, S. (2015). Fitting Linear Mixed-Effects Models Using lme4. Journal of Statistical Software, 67(1), 1-48. doi:10.18637/jss.v067.i01.

Coretta, S., Casillas, J. V., & Roettger, T. (2021). learnB4SS: Learning materials for the learnB4SS workshop. R package version 1.0.0. https://github.com/learnB4SS/learnB4SS

Hothorn, T., Bretz, F., & Westfall, P. (2008). Simultaneous Inference in General Parametric Models. Biometrical Journal 50(3), 346-363.

Nakagawa, S., Johnson, P.C.D., & Schielzeth, H. (2017) The coefficient of determination R? and intra-class correlation coefficient from generalized linear mixed-effects models revisited and expanded. J. R. Soc. Interface 14: 20170213.

Roettger, T. B., Winter, B., Kirby, J., Grawunder, S., & Grice, M. (2014). Assessing incomplete neutralization of final devoicing in German. Journal of Phonetics, 43: 11- 25.

Schmitz, D. (2018). Tonal Alignment and Segmental Composition in German. Master's Thesis. Universität zu Köln, Köln, Germany.

Schmitz, D., Baer-Henney, D., & Plag, I. (2021). The duration of word-final /s/ differs across morphological categories in English: evidence from pseudowords. Phonetica. De Gruyter Mouton 78(5–6). 571–616. https://doi.org/10.1515/phon-2021-2013.

Schmitz, D., Hae-Eun C., & Niemann, H. (2018). Vowel shortening in German as a function of syllable structure. In Proceedings 13. Phonetik und Phonologie Tagung (P&P13), 181–184. Berlin.

Wickham, H. (2016) ggplot2: Elegant Graphics for Data Analysis. Springer-Verlag New York.

