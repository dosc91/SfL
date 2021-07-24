#' data_c - Incomplete Neutralization
#'
#' A dataset containing fictional data on age and looks.
#' Q1: Are final consonants voiceless?
#' Q2: Is vowel duration shorter when the vowel preceds a voiceless vowel?
#'
#' @format A data frame with 300 rows and 9 variables:
#' \describe{
#'   \item{subject}{biological sex}
#'   \item{gender}{gender of subject}
#'   \item{item}{word produced}
#'   \item{voicing}{voicing of final consonant}
#'   \item{vowel}{vowel preceding the final consonant}
#'   \item{place}{place of articulation of final consonants}
#'   \item{accent_type}{nuclear or prenuclear accent on word}
#'   \item{prosodic_boundary}{info on whether word is followed by a boundary}
#'   \item{vowel_dur}{duration of vowel preceding the final consonant}
#' }
#' @source This data set is a shortened version of: Roettger, T. B., Winter, B., Kirby, J., Grawunder, S., & Grice, M. (2014).
#' Assessing incomplete neutralization of final devoicing in German. Journal of Phonetics, 43: 11- 25.
#' The complete data set is available online: https://osf.io/y7tdq/
"data_c"
