library(devtools)
library(dplyr)

state_codes <- read.csv("data-raw/state_codes.csv", colClasses = "character",
         stringsAsFactors = FALSE) %>%  tbl_df()

use_data(state_codes, overwrite = TRUE, compress = "xz")