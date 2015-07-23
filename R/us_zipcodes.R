# Note that if a zipcode covers multiple states, only one is included
#' @export
us_zipcodes <- function(states = NULL) {
  shpname <- "cb_2014_us_zcta510_500k"
  shp <- get(shpname, "package:USAboundariesData")
  filter_by_states(shp, states, "state_name")
}
