library(dplyr)

# Copied from PDF here: http://history.house.gov/Institution/Election-Statistics/Election-Statistics/
from_pdf <- data.frame(
  election_type = "congressional",
  congress = 119,
  state_abbr = "MD",
  year = 2024,
  district = paste0("0", 1:8),
  vote_republican = c(
    246356,
    152079,
    151186,
    30454,
    133985,
    175974,
    49799,
    77821
  ),
  vote_democrat = c(
    154985,
    223797,
    236681,
    239596,
    283619,
    199788,
    232849,
    292101
  ),
  vote_green = c(0, 0, 0, 0, 0, 0, 0, 9612),
  vote_libertarian = c(12664, 8169, 10471, 0, 0, 0, 6840, 0),
  vote_writein = c(675, 749, 862, 920, 999, 862, 649, 786)
)

md119 <- from_pdf |>
  rowwise() |>
  mutate(vote_total = sum(across(starts_with("vote"))),
  across(
    .cols = starts_with("vote"),
    .fns = list(percent = ~round( . / vote_total, 5)),
    .names = "percent_{.col}"
  )) |> select(-percent_vote_total) |> ungroup()

write.csv(md119, "inst/extdata/md-119.csv", row.names = FALSE, quote = FALSE)
