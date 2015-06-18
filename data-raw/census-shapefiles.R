library(plyr)
library(rgdal)
library(devtools)
library(stringr)
library(dplyr)

baseurl <- "http://www2.census.gov/geo/tiger/GENZ2014/shp/"
zipfiles <- c("cb_2014_us_state_20m.zip",
              "cb_2014_us_county_20m.zip",
              "cb_2014_us_cd114_20m.zip")

l_ply(zipfiles, function(x) {
  url <- paste0(baseurl, x)
  file <- paste0("data-raw/", x)
  if (!file.exists(file)) {
    message("Downloading ", x)
    download.file(url, file, mode = "wb")
  }
})

l_ply(zipfiles, function(x) {
  file <- paste0("data-raw/", x)
  message("Unzipping ", x)
  unzip(file, exdir = "data-raw")
})

shapefiles <- Sys.glob("data-raw/*.shp")
shapefiles <- gsub(".shp", "", shapefiles)
shapefiles <- gsub("data-raw/", "", shapefiles)

l_ply(shapefiles, function(x) {
  shp <- readOGR("data-raw", x)
  names(shp@data) <- tolower(names(shp@data))
#   is_utf <- sapply(shp@data, is.factor)
#   shp@data[is_utf] <- lapply(shp@data[is_utf],
#                              stri_trans_general, "latin-ascii")
  shp@data[] <- lapply(shp@data, iconv, "UTF-8", "ASCII")
  assign(x, shp, envir = globalenv())
})

state_geoid <- cb_2014_us_state_20m@data %>%
  select(statefp, name) %>%
  rename(state_name = name) %>%
  distinct()

cb_2014_us_county_20m@data <- cb_2014_us_county_20m@data %>%
  left_join(state_geoid, by = c("statefp" = "statefp"))

cb_2014_us_cd114_20m@data <- cb_2014_us_cd114_20m@data %>%
  left_join(state_geoid, by = c("statefp" = "statefp"))

use_data(cb_2014_us_county_20m, cb_2014_us_state_20m, cb_2014_us_cd114_20m,
         compress = "xz", overwrite = TRUE)
