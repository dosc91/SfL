#' data_s - Duration of word-final /s/ in English
#'
#' A dataset containing the duration of word-final /s/ and independent variables.
#' Q1: Is the duration of /s/ influenced by its type?
#'
#' @format A data frame with 150 rows and 24 variables:
#' \describe{
#'   \item{number}{unique ID}
#'   \item{item}{pseudoword produced, contains the /s/}
#'   \item{speaker}{speaker ID}
#'   \item{bsex}{biological sex of speaker}
#'   \item{list}{ID of pseudo-randomized list}
#'   \item{typeOfS}{type of /s/, i.e. non-morphemic, plural, is-clitic}
#'   \item{folSeg}{phone following the /s/}
#'   \item{slideNumber}{number of slide during experiment}
#'   \item{transcription}{transcription of item}
#'   \item{sDur}{duration of word-final /s/ in seconds}
#'   \item{baseDur}{duration of string of segments before /s/ in seconds}
#'   \item{sDurLog}{log-transformed sDur}
#'   \item{baseDurLog}{log-transformed baseDur}
#'   \item{biphoneProbSum}{summed biphone probability of transcription}
#'   \item{biphoneProbSumBin}{binary version of biphoneProbSum}
#'   \item{age}{age of speaker}
#'   \item{location}{home of speaker}
#'   \item{monoMultilingual}{mono- vs multilinguality of speaker}
#'   \item{speakingRate}{speech rate}
#'   \item{pauseDur}{duration of pause following the /s/}
#'   \item{pauseBin}{binary version of pauseDur}
#'   \item{folType}{segmental type of folSeg}
#'   \item{preC}{phone preceding the /s/}
#'   \item{googleFreq}{number of Google hits for item}
#' }
#' @source Schmitz, D., Baer-Henney, D., & Plag, I. (submitted). Revision invited by Phonetica.
"data_s"