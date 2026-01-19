#' State boundaries (contemporary and historical)
#'
#' Get the current (2019) boundaries for U.S states from the U.S. Census Bureau,
#' or get historical state boundaries for dates between 3 September 1783 and 31
#' December 2000.
#'
#' @param map_date The date of the boundaries as some object coercible to a date
#'   with \code{as.Date()}; the easiest option is a character vector following
#'   the \href{https://en.wikipedia.org/wiki/ISO_8601}{ISO 8601} data format. If
#'   \code{NULL} (the default) the contemporary boundaries will be returned.
#' @param resolution The resolution of the map.
#' @param states A character vector of state or territory names or
#'   abbreviations. Only boundaries for those states/territories will be
#'   returned. If \code{NULL}, all boundaries will be returned.
#'
#' @return An \code{sf} object.
#'
#' @seealso For documentation of and citation to the underlying shapefiles for
#'   contemporary data from the U.S. Census Bureau, see \code{census_boundaries}
#'   documentation in the USAboundariesData package. For documentation of and
#'   citation to the underlying shapefiles for historical data from the Atlas of
#'   Historical County Boundaries, see the \code{ahcb_boundaries} documentation
#'   in the USAboundariesData package.
#'
#' @examples
#' contemporary_us <- us_states()
#' if (require(USAboundariesData, quietly = TRUE) && require(sf, quietly = TRUE)) {
#'   historical_us <- us_states("1820-07-04")
#'   contemporary_ne <- us_states(
#'     states = c(
#'       "Massachusetts",
#'       "Vermont",
#'       "Maine",
#'       "New Hampshire",
#'       "Rhode Island",
#'       "Connecticut"
#'     )
#'   )
#'   historical_ne <- us_states(
#'     as.Date("1805-03-12"),
#'     states = c(
#'       "Massachusetts",
#'       "Vermont",
#'       "Maine",
#'       "New Hampshire",
#'       "Rhode Island",
#'       "Connecticut"
#'     ),
#'     resolution = "high"
#'   )
#'   plot(st_geometry(contemporary_us))
#'   plot(st_geometry(historical_us))
#'   plot(st_geometry(contemporary_ne))
#'   plot(st_geometry(historical_ne))
#' }
#' @export
us_states <- function(
  map_date = NULL,
  resolution = c("low", "high"),
  states = NULL
) {
  resolution <- match.arg(resolution)
  if (is.null(map_date)) {
    if (resolution == "low") {
      shp <- USAboundaries::states_contemporary_lores
    } else if (resolution == "high") {
      check_data_package()
      shp <- USAboundariesData::states_contemporary_hires
    }
    shp <- filter_by_states(shp, states)
  } else {
    map_date <- as.Date(map_date)
    stopifnot(
      as.Date("1783-09-03") <= map_date,
      map_date <= as.Date("2000-12-31")
    )
    check_data_package()
    if (resolution == "low") {
      shp <- USAboundariesData::states_historical_lores
    } else if (resolution == "high") {
      shp <- USAboundariesData::states_historical_hires
    }
    shp <- filter_by_date(shp, map_date)
    shp <- filter_by_states(shp, states)
  }
  shp
}
