library(tidyverse)

state_proj <- read_csv("data-raw/state_proj.csv")

devtools::use_data(state_proj, overwrite = TRUE, compress = "xz")
