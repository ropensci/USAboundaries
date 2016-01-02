#' County boundaries (contemporary and historical)
#'
#' Get the current (2014) boundaries for U.S states, or get historical county
#' boundaries for dates between 30 December 1636 and 31 December 2000.
#'
#' @param map_date The date of the boundaries as some object coercible to a date
#'   with \code{as.Date()}; the easiest option is a character vector following
#'   the \href{https://en.wikipedia.org/wiki/ISO_8601}{ISO 8601} data format. A
#'   \code{NULL} value will return contemporary boundaries.
#' @param resolution The resolution of the map.
#' @param states A character vector of state or territory names. Only boundaries
#'   inside these states/territories will be returned. If \code{NULL}, all
#'   boundaries will be returned.
#'
#' @return A SpatialPolygonsDataFrame.
#'
#' @seealso For documentation of and citation to the underlying shapefiles for
#'   contemporary data from the U.S. Census Bureau, see
#'   \code{\link{census_boundaries}}. For documentation of
#'   and citation to the underlying shapefiles for contemporary data from the
#'   U.S. Census Bureau, see \code{\link{hist_us_counties}}.
#'
#' @examples
#' contemporary <- us_counties()
#' historical   <- us_counties("1820-07-04")
#' new_england  <- us_counties(states = c("Massachusetts", "Vermont", "Maine",
#'                                        "New Hampshire", "Rhode Island",
#'                                        "Connecticut"))
#' if (require(sp)) {
#'    plot(contemporary)
#'    plot(historical)
#'    plot(new_england)
#' }
#'
#' @export
us_counties <- function(map_date = NULL, resolution = c("low", "high"),
                        states = NULL) {
  resolution <- match.arg(resolution)
  if (is.null(map_date)) {
    if (resolution == "low") {
      shp <- cb_2014_us_county_20m
    } else if (resolution == "high") {
      check_data_package()
      shp <- USAboundariesData::cb_2014_us_county_500k
    }
    shp <- filter_by_states(shp, states, "state_name")
  } else {
    map_date <- as.Date(map_date)
    stopifnot(as.Date("1636-12-30") <= map_date,
              map_date <= as.Date("2000-12-31"))
    if (resolution == "low") {
      shp <- hist_us_counties
    } else if (resolution == "high") {
      check_data_package()
      shp <- USAboundariesData::hist_us_counties_hires
    }
    shp <- filter_by_date(shp, map_date, "start_posix", "end_posix")
    shp <- filter_by_states(shp, states, "state_terr")
  }
  shp
}
