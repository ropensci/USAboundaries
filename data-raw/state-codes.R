state_codes <- read.csv(
  "data-raw/state-codes.csv",
  colClasses = "character",
  stringsAsFactors = FALSE
) |>
  tibble::as_tibble()

usethis::use_data(state_codes, overwrite = TRUE, compress = "xz")
