#' Congressional district boundaries (contemporary)
#'
#' Get the current (2014) boundaries for U.S. Congressional districts.
#'
#' @param resolution The resolution of the boundaries.
#' @param states A character vector of state or territory names. Only boundaries
#'   inside these states/territories will be returned. If \code{NULL}, all
#'   boundaries will be returned.
#'
#' @return A SpatialPolygonsDataFrame.
#'
#' @seealso For documentation of and citation to the underlying shapefiles for
#'   contemporary data from the U.S. Census Bureau, see
#'   \code{\link{census_boundaries}}.
#'
#' @examples
#' va_congressional <- us_congressional(states = "Virginia")
#' if (require(sp)) {
#'    plot(va_congressional)
#' }
#'
#' @export
us_congressional <- function(resolution = c("low", "high"),
                             states = NULL) {
  resolution <- match.arg(resolution)
  if (resolution == "low") {
    shp <- cb_2014_us_cd114_20m
  } else if (resolution == "high") {
    check_data_package()
    shp <- USAboundariesData::cb_2014_us_cd114_500k
  }
  filter_by_states(shp, states, "state_name")
}
