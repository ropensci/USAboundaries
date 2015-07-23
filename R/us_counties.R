#' County boundaries (contemporary and historical)
#'
#' Get the current (2014) boundaries for U.S states, or get historical county
#' boundaries for dates between 30 December 1636 and 31 December 2000.
#'
#' @param map_date The date of the boundaries as some object coercable to a date
#'   with \code{as.Date()}; the easiest option is a character vector following
#'   the \href{https://en.wikipedia.org/wiki/ISO_8601}{ISO 8601} data format. A
#'   \code{NULL} value will return contemporary boundaries.
#' @param resolution The resolution of the map.\code{500k} is the most detailed.
#' @param states A character vector of state or territory names. Only boundaries
#'   inside these states/territories will be returned. If \code{NULL}, all
#'   boundaries will be returned.
#'
#' @return A SpatialPolygonsDataFrame.
#'
#' @seealso For documentation of and citation to the underlying shapefiles for
#'   contemporary data from the U.S. Census Bureau, see
#'   \code{\link[USAboundariesData]{census_boundaries}}. For documentation of
#'   and citation to the underlying shapefiles for contemporary data from the
#'   U.S. Census Bureau, see \code{\link[USAboundariesData]{hist_us_counties}}.
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
