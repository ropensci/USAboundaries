#' USAboundaries: Historical and Contemporary Boundaries of the United States of
#' America
#'
#' This package provides contemporary (2014) boundaries for states, counties,
#' zip code tabulation areas, and congressional districts in the United States
#' of America. This data is provided by the U.S. Census Bureau.
#'
#' This package also provides spatial objects with historical boundaries of
#' states or counties in the United States of America from 1629 to 2000. It
#' provides data from the \href{https://publications.newberry.org/ahcbp/}{Atlas
#' of Historical County Boundaries}. The copyright to the historical data used
#' in this package is owned by the Newberry Library, and it is included in the
#' \code{USAboundariesData} package under the terms of the
#' \href{https://creativecommons.org/licenses/by-nc-sa/2.5/}{Creative Commons
#' Attribution-NonCommercial-ShareAlike 2.5 Generic} (CC BY-NC-SA 2.5) license.
#'
#' The code in this package is copyrighted by
#' \href{https://lincolnmullen.com}{Lincoln Mullen}, and is released under the
#' terms of the \href{https://opensource.org/licenses/MIT}{MIT License}.
#'
#' @name USAboundaries
#' @docType package
NULL

if (getRversion() >= "2.15.1") {
  utils::globalVariables(c("state_codes", "state_proj"))
}
