#' Get the boundaries of the United States for a particular date
#'
#' This function takes a date and returns the county or state boundaries of the
#' United States for that date.
#'
#' @param map_date The date of the map as some object coercable to a date with
#'   \code{as.Date()}. For state maps the date must be between 3 September 1783
#'   and 31 December 2000; for county maps the date must be between 30 December
#'   1636 and 31 December 2000.
#' @param type The type of the map, either \code{"state"} or \code{"county"}.
#' @param states A character vector of state or territory names.
#' @examples
#' map_states   <- us_boundaries("1850-07-04")
#' map_counties <- us_boundaries(as.Date("1850-07-04"), type = "county")
#' new_england <- c("Massachusetts", "Vermont", "New Hampshire", "Connecticut",
#'                  "Rhode Island", "Maine")
#' map_ne <- us_boundaries("1943-02-12", states = new_england)
#' if(require(sp)) {
#'   plot(map_states)
#'   plot(map_ne)
#' }
#' @return A \code{SpatialPolygonsDataFrame} object.
#' @export
us_boundaries <- function(map_date, type = c("state", "county"),
                          states = NULL) {

  map_date <- as.Date(map_date)
  type <- match.arg(type)

  if (type == "state") {
    stopifnot(as.Date("1783-09-03") <= map_date,
              map_date <= as.Date("2000-12-31"))
    shp <- hist_us_states
    states_category <- "name"
  } else {
    stopifnot(as.Date("1636-12-30") <= map_date,
              map_date <= as.Date("2000-12-31"))
    shp <- hist_us_counties
    states_category <- "state_terr"
  }

  # Get the right dates
  filter <- as.Date(shp$start_posix) <= map_date &
    as.Date(shp$end_posix) >= map_date

  # Get the right states
  if (!is.null(states)) {
    stopifnot(is.character(states))
    filter_states <- tolower(shp[[states_category]]) %in% tolower(states)
    filter <- filter & filter_states
  }

  shp[filter, ]

}
