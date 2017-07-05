#' Zip Code Tabulation Areas (contemporary)
#'
#' Get the current (2016) centroids for U.S Zipcode Tabulation Areas from the
#' U.S. Census Bureau. The centroids were calculated from the ZCTA boundary files available on the U.S. Census Bureau website.
#'
#' @return An \code{sf} object.
#'
#' @seealso For documentation of and citation to the underlying shapefiles for
#'   contemporary data from the U.S. Census Bureau, see
#'   \code{\link[USAboundariesData]{census_boundaries}}.
#'
#' @examples
#' if (require(USAboundariesData)) {
#'   us_zipcodes()
#' }
#'
#' @export
us_zipcodes <- function() {
  check_data_package()
  USAboundariesData::zipcodes
}
