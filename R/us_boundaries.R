#' Get the boundaries of the United States for a particular date
#' @param map_date The date of the map as an object of class \code{POSIXct},
#'   \code{POSIXt}, or \code{Date}. For state maps the date must be between 3
#'   September 1783 and 31 December 2000; for county maps the date must be
#'   between 30 December 1636 and 31 December 2000.
#' @param type The type of the map, either \code{"state"} or \code{"county"}.
#' @examples
#' map_states   <- us_boundaries(as.Date("1850-07-04"))
#' map_counties <- us_boundaries(as.Date("1850-07-04"), type = "county")
#' if(require(sp)) {
#'   plot(map_states)
#'   plot(map_counties)
#' }
#' @export
us_boundaries <- function(map_date, type = c("state", "county")) {
  assert_that(any(class(map_date) %in% c("POSIXct","POSIXt", "Date")))
  map_date <- as.POSIXct(map_date)
  type <- match.arg(type)

  if(type == "state") {
    assert_that(ymd("1783-09-03") <= map_date & map_date <= ymd("2000-12-31"))
    shp <- hist_us_states
  } else {
    assert_that(ymd("1636-12-30") <= map_date & map_date <= ymd("2000-12-31"))
    shp <- hist_us_counties
  }

  shp[shp$start_posix <= map_date & shp$end_posix >= map_date, ]

}
