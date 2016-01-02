#' USAboundaries: Historical and Contemporary Boundaries of the United States of
#' America
#'
#' This package provides contemporary (2014) boundaries for states, counties,
#' zip code tabulation areas, and congressional districts in the United States
#' of America. This data is provided by the
#' \href{https://www.census.gov/geo/maps-data/}{U.S. Census Bureau}.
#'
#' This package also provides spatial objects with historical boundaries of
#' states or counties in the United States of America from 1629 to 2000. It
#' provides data from the \href{http://publications.newberry.org/ahcbp/}{Atlas
#' of Historical County Boundaries}. The copyright to the historical data used
#' in this package is owned by the Newberry Library, and it is included in the
#' \code{USAboundariesData} package under the terms of the
#' \href{http://creativecommons.org/licenses/by-nc-sa/2.5/}{Creative Commons
#' Attribution-NonCommercial-ShareAlike 2.5 Generic} (CC BY-NC-SA 2.5) license.
#'
#' The code in this package is copyrighted by
#' \href{http://lincolnmullen.com}{Lincoln Mullen}, and is released under the
#' terms of the \href{http://opensource.org/licenses/MIT}{MIT License}.
#'
#' @name USAboundaries
#' @docType package
#' @import sp
NULL

if (getRversion() >= "2.15.1") {
  utils::globalVariables(c("cb_2014_us_cd114_20m", "cb_2014_us_county_20m",
                           "hist_us_counties", "hist_us_states",
                           "cb_2014_us_state_20m"))
}
