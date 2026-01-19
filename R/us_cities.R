#' City locations and populations (historical and contemporary)
#'
#' This function returns an \code{sf} object of cities (or populated places)
#' with their populations and latitudes and longitudes. Population data is taken
#' from the U.S. Census.
#'
#' @references The data was compiled by Erik Steiner and Jason Heppler at the
#'   Center for Spatial and Textual Analysis, Stanford University. See their
#'   \href{https://github.com/cestastanford/historical-us-city-populations}{the
#'   description of the data} for a fuller accounting of how the data was
#'   gathered.
#'
#' @param map_date If \code{NULL}, then city populations from the 2010 census
#'   (the most recent census) are returned. This parameter accepts a \code{Date}
#'   object or a character string coercible to a \code{Date} object, as well as
#'   numeric values representing a year. If a year or date is used, then city
#'   populations from the decennial census from 1790 to 2010 \emph{prior} to
#'   that year is returned. For example, \code{1805} or \code{"1805-07-04"}
#'   would return city populations from the 1800 census.
#' @param states A character vector of state or territory names or
#'   abbreviations. Only boundaries for those states/territories will be
#'   returned. If \code{NULL}, all boundaries will be returned.
#'
#' @examples
#' if (require(USAboundariesData, quietly = TRUE)) {
#'   us_cities(1805)
#'   us_cities("1828-05-08")
#'   us_cities()
#' }
#'
#' @export
us_cities <- function(map_date = NULL, states = NULL) {
  # TODO maybe return all the cities to see trend over time?
  if (is.null(map_date)) {
    message("City populations for contemporary data come from the 2010 census.")
    map_date <- 2010
  }
  if (is.character(map_date)) {
    map_date <- as.Date(map_date)
  }
  if (identical(class(map_date), "Date")) {
    map_date <- as.numeric(format(map_date, "%Y"))
  }
  stopifnot(is.numeric(map_date) && 1790 <= map_date && map_date <= 2010)
  map_date <- trunc(map_date / 10) * 10
  check_data_package()
  cities <- USAboundariesData::census_cities
  cities <- filter_by_states(cities, states)
  cities <- cities[cities$year == map_date & cities$population > 0, ]
  return(cities)
}
