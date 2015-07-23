#' Zip code tabulation areas (contemporary)
#'
#' Get the current (2014) boundaries for zip code tabulation areas (ZCTA). Note
#' that if a zipcode covers multiple states, it is included only in one state.
#' These boundaries are provided at the \code{500k} resolution.
#'
#' @details ZCTAs are not identical to zip codes. According to the Census
#'   Bureau, "ZIP Code Tabulation Areas (ZCTAs) are generalized areal
#'   representations of United States Postal Service (USPS) ZIP Code service
#'   areas. The USPS ZIP Codes identify the individual post office or
#'   metropolitan area delivery station associated with mailing addresses. USPS
#'   ZIP Codes are not areal features but a collection of mail delivery routes."
#'
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
#' hi_zips <- us_zipcodes(states = "Hawaii")
#' if (require(sp)) {
#'    plot(hi_zips)
#' }
#'
#' @export
us_zipcodes <- function(states = NULL) {
  shpname <- "cb_2014_us_zcta510_500k"
  shp <- get(shpname, "package:USAboundariesData")
  filter_by_states(shp, states, "state_name")
}
