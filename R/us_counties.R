#' @export
us_counties <- function(map_date = NULL,
                        resolution = c("20m", "5m", "500k"),
                        states = NULL) {
  resolution <- match.arg(resolution)
  if (is.null(map_date)) {
    shpname <- paste0("cb_2014_us_county_", resolution)
    shp <- get(shpname, "package:USAboundariesData")
    shp <- filter_by_states(shp, states, "state_name")
  } else {
    map_date <- as.Date(map_date)
    stopifnot(as.Date("1636-12-30") <= map_date,
              map_date <= as.Date("2000-12-31"))
    shp <- USAboundariesData::hist_us_counties
    shp <- filter_by_date(shp, map_date, "start_posix", "end_posix")
    shp <- filter_by_states(shp, states, "state_terr")
  }
  shp
}
