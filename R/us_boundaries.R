#' Get state/county boundaries of the United States on a specified date.
#'
#' This function takes a date and returns the county or state boundaries of the
#' United States for that date.
#'
#' @param map_date The date of the map as some object coercable to a date with
#'   \code{as.Date()}. For state maps the date must be between 3 September 1783
#'   and 31 December 2000; for county maps the date must be between 30 December
#'   1636 and 31 December 2000.
#' @param type The type of the map, either \code{"state"} or \code{"county"}.
#' @param resolution The resolution of the map.
#' @param states A character vector of state or territory names. Only boundaries
#'   inside these states/territories will be return.
#' @examples
#' map_states   <- us_boundaries("1850-07-04")
#' map_counties <- us_boundaries(as.Date("1850-07-04"), type = "county")
#' new_england <- c("Massachusetts", "Vermont", "New Hampshire", "Connecticut",
#'                  "Rhode Island", "Maine")
#' map_ne <- us_boundaries("1943-02-12", states = new_england)
#'
#' if (require(sp)) {
#'   plot(map_states)
#'   plot(map_counties)
#'   plot(map_ne)
#' }
#' @return A \code{SpatialPolygonsDataFrame} object.
#' @export
us_boundaries <- function(map_date = NULL, type = c("state", "county"),
                          resolution = c("20m"), states = NULL) {
  type <- match.arg(type)
  switch(type,
    state = us_states(map_date, resolution, states),
    county = us_counties(map_date, resolution, states)
  )
}
