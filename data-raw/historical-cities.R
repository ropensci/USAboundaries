library(tidyverse)

census_cities <- read_csv("data-raw/1790-2010_MASTER.csv") %>%
  gather(year, population, 5:27, convert = TRUE)

devtools::use_data(census_cities, overwrite = TRUE)
