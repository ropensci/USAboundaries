#' State boundaries (contemporary and historical)
#'
#' Get the current (2014) boundaries for U.S states, or get historical state
#' boundaries for dates between 3 September 1783 and 31 December 2000.
#'
#' @param map_date The date of the boundaries as some object coercible to a date
#'   with \code{as.Date()}; the easiest option is a character vector following
#'   the \href{https://en.wikipedia.org/wiki/ISO_8601}{ISO 8601} data format.
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
#'   U.S. Census Bureau, see \code{\link{hist_us_states}}.
#'
#' @examples
#' contemporary <- us_states()
#' historical   <- us_states("1820-07-04")
#' new_england  <- us_states(states = c("Massachusetts", "Vermont", "Maine",
#'                                      "New Hampshire", "Rhode Island",
#'                                      "Connecticut"))
#' if (require(sp)) {
#'    plot(contemporary)
#'    plot(historical)
#'    plot(new_england)
#' }
#'
#' @export
us_states <- function(map_date = NULL, resolution = c("low", "high"),
                      states = NULL) {
  resolution <- match.arg(resolution)
  if (is.null(map_date)) {
    if (resolution == "low") {
      shp <- cb_2014_us_state_20m
    } else if (resolution == "high") {
      check_data_package()
      shp <- USAboundariesData::cb_2014_us_state_500k
    }
    shp <- filter_by_states(shp, states, "name")
  } else {
    map_date <- as.Date(map_date)
    stopifnot(as.Date("1783-09-03") <= map_date,
              map_date <= as.Date("2000-12-31"))
    if (resolution == "low") {
      shp <- hist_us_states
    } else if (resolution == "high") {
      check_data_package()
      shp <- USAboundariesData::hist_us_states_hires
    }
    shp <- filter_by_date(shp, map_date, "start_posix", "end_posix")
    shp <- filter_by_states(shp, states, "name")
  }
  shp
}
