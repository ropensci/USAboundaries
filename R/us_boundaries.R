#' Get historical or contemporary boundaries of the United States
#'
#' This function is a general-purpose wrapper around the more specific functions
#' in this package. It is provided for convenience and backward-compatibility
#' with earlier versions of the package. In most cases you should use the more
#' specific functions for the type of boundary that you need.
#'
#' @param map_date The date of the boundaries as some object coercible to a date
#'   with \code{as.Date()}. For state maps the date must be between 3 September
#'   1783 and 31 December 2000; for county maps the date must be between 30
#'   December 1636 and 31 December 2000. A \code{NULL} value will return
#'   contemporary boundaries. This value is ignored for types of boundaries
#'   other than states and counties.
#' @param type The type of the map, either \code{state}, \code{county}, or
#'   \code{congressional}.
#' @param resolution The resolution of the map. High resolution data is
#'   contained in the suggested package \code{USAboundariesData}. If that
#'   package is not available, you will be prompted to install it.
#' @param states A character vector of state or territory names. Only boundaries
#'   inside these states/territories will be returned.
#' @examples
#' map_states   <- us_boundaries("1850-07-04")
#' map_counties <- us_boundaries(as.Date("1850-07-04"), type = "county")
#' new_england <- c("Massachusetts", "Vermont", "New Hampshire", "Connecticut",
#'                  "Rhode Island", "Maine")
#' map_ne <- us_boundaries("1943-02-12", states = new_england)
#' map_congressional <- us_boundaries(type = "congressional",
#'                                    states = new_england)
#'
#' if (require(sp)) {
#'   plot(map_states)
#'   plot(map_counties)
#'   plot(map_ne)
#'   plot(map_congressional)
#' }
#' @return A \code{SpatialPolygonsDataFrame}.
#' @seealso \code{\link{us_states}}, \code{\link{us_counties}},
#'   \code{\link{us_congressional}}
#' @export
us_boundaries <- function(map_date = NULL,
                          type = c("state", "county", "congressional"),
                          resolution = c("low", "high"),
                          states = NULL) {

  # Deal with mismatches between arguments and available data
  if (!missing(map_date) && type == "congressional")
    stop(paste("Only current congressional districts are available. Do\n  ",
               "not specify the map_date argument."))

  type <- match.arg(type)
  resolution <- match.arg(resolution)

  switch(type,
    state = us_states(map_date, resolution, states),
    county = us_counties(map_date, resolution, states),
    congressional = us_congressional(resolution, states)
  )

}
