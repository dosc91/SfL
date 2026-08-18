source_file <- file.path(
  "data-raw",
  "statistik_kurs_lexical_decision_neighbourhood.csv"
)

data_l <- utils::read.csv(source_file, stringsAsFactors = FALSE)

data_l$subject <- factor(data_l$subject)
data_l$item <- factor(data_l$item)
data_l$condition <- factor(
  data_l$condition,
  levels = c("unrelated", "related")
)
data_l$group <- factor(
  data_l$group,
  levels = c("control", "training")
)

save(data_l, file = file.path("data", "data_l.rda"),
     version = 2, compress = "xz")
