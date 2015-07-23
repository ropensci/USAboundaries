#' Congressional district boundaries (contemporary)
#'
#' Get the current (2014) boundaries for U.S. Congressional districts.
#'
#' @param resolution The resolution of the boundaries. \code{500k} is the most
#'   detailed.
#' @param states A character vector of state or territory names. Only boundaries
#'   inside these states/territories will be returned. If \code{NULL}, all
#'   boundaries will be returned.
#'
#' @return A SpatialPolygonsDataFrame.
#'
#' @seealso For documentation of and citation to the underlying shapefiles for
#'   contemporary data from the U.S. Census Bureau, see
#'   \code{\link[USAboundariesData]{census_boundaries}}.
#'
#' @examples
#' va_congressional <- us_congressional(states = "Virginia")
#' if (require(sp)) {
#'    plot(va_congressional)
#' }
#'
#' @export
us_congressional <- function(resolution = c("20m", "5m", "500k"),
                             states = NULL) {
  resolution <- match.arg(resolution)
  shpname <- paste0("cb_2014_us_cd114_", resolution)
  shp <- get(shpname, "package:USAboundariesData")
  filter_by_states(shp, states, "state_name")
}
