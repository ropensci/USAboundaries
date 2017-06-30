#' Congressional district boundaries (contemporary)
#'
#' Get the current (2016) boundaries for U.S. Congressional districts.
#'
#' @param resolution The resolution of the boundaries.
#' @param states A character vector of state or territory names. Only boundaries
#'   inside these states/territories will be returned. If \code{NULL}, all
#'   boundaries will be returned.
#'
#' @return An \code{sf} object.
#'
#' @seealso For documentation of and citation to the underlying shapefiles for
#'   contemporary data from the U.S. Census Bureau, see
#'   \code{\link[USAboundariesData]{census_boundaries}}.
#'
#' @examples
#' if (require(USAboundariesData) && require(sf)) {
#'   us_congressional <- us_congressional()
#'   va_congressional <- us_congressional(states = "Virginia", resolution = "high")
#'   plot(st_geometry(us_congressional))
#'   plot(st_geometry(va_congressional))
#' }
#'
#' @export
us_congressional <- function(resolution = c("low", "high"),
                             states = NULL) {
  resolution <- match.arg(resolution)
  check_data_package()
  if (resolution == "low") {
    shp <- USAboundariesData::congress_contemporary_lores
  } else if (resolution == "high") {
    shp <- USAboundariesData::congress_contemporary_hires
  }
  filter_by_states(shp, states)
}
