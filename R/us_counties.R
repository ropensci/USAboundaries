#' County boundaries (contemporary and historical)
#'
#' Get the current (2024) boundaries for U.S counties from the U.S. Census
#' Bureau, or get historical county boundaries for dates between 30 December
#' 1636 and 31 December 2000.
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
#'   contemporary data from the U.S. Census Bureau, see the
#'   \code{census_boundaries} help file in the USAboundariesData package. For
#'   documentation of and citation to the underlying shapefiles for historical
#'   data from the Atlas of Historical County Boundaries, see the
#'   \code{ahcb_boundaries} help file in the USAboundariesData package.
#'
#' @examples
#' if (require(USAboundariesData) && require(sf)) {
#'   contemporary_us <- us_counties()
#'   historical_us <- us_counties("1820-07-04")
#'   contemporary_ne <- us_counties(
#'     states = c(
#'       "Massachusetts",
#'       "Vermont",
#'       "Maine",
#'       "New Hampshire",
#'       "Rhode Island",
#'       "Connecticut"
#'     )
#'   )
#'   historical_ne <- us_counties(
#'     "1803-04-28",
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
#'
#'   plot(st_geometry(contemporary_us))
#'   plot(st_geometry(historical_us))
#'   plot(st_geometry(contemporary_ne))
#'   plot(st_geometry(historical_ne))
#' }
#'
#' @export
us_counties <- function(
  map_date = NULL,
  resolution = c("low", "high"),
  states = NULL
) {
  resolution <- match.arg(resolution)
  check_data_package()
  if (is.null(map_date)) {
    if (resolution == "low") {
      shp <- USAboundariesData::counties_contemporary_lores
    } else if (resolution == "high") {
      shp <- USAboundariesData::counties_contemporary_hires
    }
    shp <- filter_by_states(shp, states)
  } else {
    map_date <- as.Date(map_date)

    if (map_date < as.Date("1636-12-30") || map_date > as.Date("2000-12-31")) {
      cli::cli_abort(
        "Year of the date must be between 1637 and 2000."
      )
    }

    if (resolution == "low") {
      shp <- USAboundariesData::counties_historical_lores
    } else if (resolution == "high") {
      shp <- USAboundariesData::counties_historical_hires
    }
    shp <- filter_by_date(shp, map_date)
    shp <- filter_by_states(shp, states)
  }
  shp
}
