#' Data for State projections
#'
#' This data frame includes state abbreviations, EPSG codes, and proj4 strings for state plane projections.
#'
#' @format A data frame with 123 rows and 5 variables:
#' \describe{
#' \item{state}{The state or territory abbreviation.}
#' \item{zone}{Name of the state plane zone.}
#' \item{epsg}{The EPSG code for each state plane zone.}
#' \item{proj4_string}{The PROJ4 string for the state plane projection.}
#' \item{statewide_proj}{State plane zone for projecting the entire state.}
#' }
#'
#' @references
#'   \href{https://en.wikipedia.org/wiki/State_Plane_Coordinate_System}{State Plane Coordinate System}
"state_proj"
