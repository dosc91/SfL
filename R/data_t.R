#' data_t - Tonal Alignment in German
#'
#' A dataset containing fictional data on age and looks.
#' Q1: Are final consonants voiceless?
#' Q2: Is vowel duration shorter when the vowel preceds a voiceless vowel?
#'
#' @format A data frame with 544 rows and 13 variables:
#' \describe{
#'   \item{speaker}{speaker ID}
#'   \item{word_dur}{word duration}
#'   \item{vowel}{vowel of word}
#'   \item{sylnum}{number of syllables of word}
#'   \item{sylstr}{syllable structure of first syllable of word}
#'   \item{C1_dur}{duration of consonant preceding the vowel}
#'   \item{V1_dur}{vowel duration of first syllable vowel}
#'   \item{C2_dur}{duration of first consonant following the vowel within the same syllable}
#'   \item{C3_dur}{duration of second consonant following the vowel within the same syllable}
#'   \item{W_dur}{duration of onset consonant of 2nd syllable}
#'   \item{A1_dur}{duration of vowel of 2nd syllable}
#'   \item{L_dur}{duration of onset consonant of 3rd syllable}
#'   \item{A2_dur}{duration of vowel of 3rd syllable}
#' }
#' @source This data set is a shortened version of: Schmitz, D. (2018). Tonal Alignment and Segmental Composition in German.
#' Master's Thesis. Universität zu Köln, Köln, Germany.
"data_t"
