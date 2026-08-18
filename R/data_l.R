#' data_l - Lexical Decision and Lexical Neighbourhood
#'
#' Ein Lehrdatensatz zu einer Lexical-Decision-Studie. Insgesamt bearbeiten
#' 60 Versuchspersonen jeweils 120 geschriebene Wörter. Vor dem Experiment
#' wird die Hälfte der Personen einer Trainingsgruppe und die andere Hälfte
#' einer Kontrollgruppe zugeteilt. In jedem Trial erscheint vor dem Zielwort
#' entweder ein semantisch verwandtes oder ein nicht verwandtes Kontextwort.
#'
#' Der Datensatz eignet sich zur Untersuchung der Frage, welche Faktoren ein
#' Wort schnell und zuverlässig erkennbar machen. Mögliche Analysen betreffen
#' Effekte von Worthäufigkeit, semantischer Bedingung, Wortlänge, lexikalischer
#' Nachbarschaft, Versuchsgruppe und Trialposition sowie Unterschiede zwischen
#' Versuchspersonen und Wörtern. Auch die Interaktion zwischen Worthäufigkeit
#' und semantischer Bedingung kann untersucht werden.
#'
#' @usage data(data_l)
#'
#' @format Ein data frame mit 7.200 Beobachtungen und 11 Variablen:
#' \describe{
#'   \item{subject}{Faktor mit der anonymisierten Kennung der Versuchsperson.}
#'   \item{item}{Faktor mit der Kennung des Zielwortes.}
#'   \item{condition}{Faktor für die semantische Beziehung zwischen Kontext-
#'     und Zielwort: `unrelated` oder `related`.}
#'   \item{group}{Faktor für die Versuchsgruppe: `control` oder `training`.}
#'   \item{frequency_z}{Standardisierter Häufigkeitswert des Zielwortes.}
#'   \item{length}{Länge des Zielwortes in Buchstaben.}
#'   \item{trial}{Position des Trials innerhalb des Experiments, von 1 bis
#'     120.}
#'   \item{RT}{Reaktionszeit in Millisekunden.}
#'   \item{accuracy}{Korrektheit der Antwort: 1 für korrekt, 0 für inkorrekt.}
#'   \item{neighbourhood}{Dichte der lexikalischen Nachbarschaft als Anzahl
#'     der Nachbarwörter.}
#'   \item{neighbourhood_z}{Standardisierte Dichte der lexikalischen
#'     Nachbarschaft.}
#' }
#'
#' @source Für den Statistikunterricht bereitgestellter Lehrdatensatz.
"data_l"
