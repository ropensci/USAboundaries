# Download the state and county shapefiles from Atlas of Historical County
# Boundaries. Use the generalized files to .01 degree of tolerance, i.e., about
# .69 miles in the latitude of Boston.

library(devtools)
library(rgdal)
library(ggplot2)

# States
states_url <- "http://publications.newberry.org/ahcbp/downloads/gis/US_AtlasHCB_StateTerr_Gen01.zip"

if(!file.exists("data-raw/states.zip")) {
  download.file(states_url, "data-raw/states.zip")
}

unzip("data-raw/states.zip", exdir = "data-raw/", unzip = getOption("unzip"))

state_sp <- readOGR(
  "data-raw/US_AtlasHCB_StateTerr_Gen01/US_HistStateTerr_Gen01_Shapefile",
  "US_HistStateTerr_Gen01")

state_df <- fortify(state_sp, region = "ID")

use_data(state_sp, overwrite = TRUE, compress = "xz")
use_data(state_df, overwrite = TRUE, compress = "xz")

# Counties
counties_url <- "http://publications.newberry.org/ahcbp/downloads/gis/US_AtlasHCB_Counties_Gen01.zip"

if(!file.exists("data-raw/counties.zip")) {
  download.file(counties_url, "data-raw/counties.zip")
}

unzip("data-raw/counties.zip", exdir = "data-raw/", unzip = getOption("unzip"))

counties_sp <- readOGR(
  "data-raw/US_AtlasHCB_StateTerr_Gen01/US_HistStateTerr_Gen01_Shapefile",
  "US_HistStateTerr_Gen01")

counties_df <- fortify(counties_sp, region = "ID")

use_data(counties_sp, overwrite = TRUE, compress = "xz")
use_data(counties_df, overwrite = TRUE, compress = "xz")
