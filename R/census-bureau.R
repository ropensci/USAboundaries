#' Cartographic boundary files from the U.S. Census Bureau
#'
#' The U.S. Census Bureau provides
#' \href{https://www.census.gov/geo/maps-data/data/tiger-cart-boundary.html}{cartographic
#' boundary files} for current U.S. boundaries. The datasets in this package
#' provide a selection of boundaries from the 2014 Census files. They are
#' objects of class \code{\link[sp]{SpatialPolygonsDataFrame}}. They are
#' intended to be used with the functions in the \code{USAboundaries} package,
#' but the data objects can also be used on their own. The attributes data
#' associated with these boundaries is unchanged from what is available in the
#' Census boundaries, with the exception that a \code{state_name} column has
#' been added where necessary for convience in filtering the boundaries.
#'
#' The following objects are included in this package or in \code{USAboundariesData}:
#'
#' \describe{
#' \item{cb_2014_us_cd114_500k}{Congressional district boundaries for the 114th Congress, 1:500k resolution.}
#' \item{cb_2014_us_cd114_20m}{Congressional district boundaries for the 114th Congress, 1:20m resolution.}
#' \item{cb_2014_us_county_500k}{County boundaries, 1:500k resolution.}
#' \item{cb_2014_us_county_20m}{County boundaries, 1:20m resolution.}
#' \item{cb_2014_us_state_500k}{State boundaries, 1:500k resolution.}
#' \item{cb_2014_us_state_20m}{State boundaries, 1:20m resolution.}
#' }
#'
#' @references U.S. Census Bureau,
#'   \href{https://www.census.gov/geo/maps-data/data/tiger-cart-boundary.html}{Cartographic
#'    Boundary Shapefiles} (2014).
#'
#'   See the U.S. Census Bureau's
#'   "\href{https://www.census.gov/geo/reference/geoidentifiers.html}{Understanding
#'    Geographic Identifiers (GEOIDs)}" and their
#'   "\href{https://www.census.gov/geo/reference/geocodes.html}{Geographic
#'   Codes}" pages for the details of this attribute data.
#' @name census_boundaries
#' @rdname census_boundaries
NULL

#' @name   cb_2014_us_state_500k
#' @rdname census_boundaries
NULL

#' @name   cb_2014_us_county_500k
#' @rdname census_boundaries
NULL

#' @name   cb_2014_us_cd114_500k
#' @rdname census_boundaries
NULL

#' @name cb_2014_us_cd114_20m
#' @rdname census_boundaries
NULL

#' @name  cb_2014_us_county_20m
#' @rdname census_boundaries
NULL

#' @name  cb_2014_us_state_20m
#' @rdname census_boundaries
NULL
