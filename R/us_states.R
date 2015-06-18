#' @export
us_states <- function(map_date = NULL,
                      resolution = c("20m", "5m", "500k"),
                      states = NULL) {
  resolution <- match.arg(resolution)
  if (is.null(map_date)) {
    shpname <- paste0("cb_2014_us_state_", resolution)
    if (resolution == "20m")
      shp <- get(shpname)
    else
      shp <- get(shpname, "package:USAboundariesData")
    shp <- filter_by_states(shp, states, "name")
  } else {
    map_date <- as.Date(map_date)
    stopifnot(as.Date("1783-09-03") <= map_date,
              map_date <= as.Date("2000-12-31"))
    shp <- hist_us_states
    shp <- filter_by_date(shp, map_date, "start_posix", "end_posix")
    shp <- filter_by_states(shp, states, "name")
  }
  shp
}
