#' Boundaries of states in the United States of America, 1783--2000
#'
#' This dataset contains polygons for all of the state boundaries in the United
#' States from 1783 to 2000. The dataset includes a data frame with descriptions
#' of the changes to the boundaries and the dates with which they valid.
#'
#' @slot data A data frame with information about the boundaries. For a full
#'   description of all of the columns in the data frame, see the
#'   \href{http://publications.newberry.org/ahcbp/downloads/united_states.html}{documentation
#'    in the zip files} provided by AHCB. Some of the most important columns are
#'   listed in the details section of this documentation.
#'
#' @details \itemize{
#'
#' \item \code{start_date}, \code{end_date}, \code{start_n}, \code{end_n},
#' \code{start_posix}, \code{end_posix}: The start and end dates for which a
#' polygon is valid. Columns ending in \code{_date} are factors, those ending in
#' \code{_n} are integers in \code{yyyymmdd} format, those ending in
#' \code{_posix} are R date objects.
#'
#' }
#'
#' @format A \code{SpatialPolygonsDataFrame} with 220 elements
#' @docType data
#' @keywords dataset
#' @source John H. Long, et al., \emph{Atlas of Historical County Boundaries},
#'   Dr. William M. Scholl Center for American History and Culture, The Newberry
#'   Library, Chicago (2010), \url{http://publications.newberry.org/ahcbp/}.
#'
#'   See also the
#'   \href{http://publications.newberry.org/ahcbp/project.html}{AHCB's about
#'   page}.
#' @usage hist_us_states
"hist_us_states"

#' Boundaries of counties in the United States of America, 1629--2000
#'
#' This dataset contains polygons for all of the county boundaries in the United
#' States or colonies that became the United States from 1629 to 2000. The
#' dataset includes a data frame with descriptions of the changes to the
#' boundaries and the dates with which they valid.
#'
#' @slot data A data frame with information about the boundaries. For a full
#'   description of all of the columns in the data frame, see the
#'   \href{http://publications.newberry.org/ahcbp/downloads/united_states.html}{documentation
#'    in the zip files} provided by AHCB. Some of the most important columns are
#'   listed in the details section of this documentation.
#'
#' @details \itemize{
#'
#' \item \code{start_date}, \code{end_date}, \code{start_n}, \code{end_n},
#' \code{start_posix}, \code{end_posix}: The start and end dates for which a
#' polygon is valid. Columns ending in \code{_date} are factors, those ending in
#' \code{_n} are integers in \code{yyyymmdd} format, those ending in
#' \code{_posix} are R date objects.
#'
#' \item \code{fips}: The county's FIPS code, when available.
#'
#' }
#'
#' @format A \code{SpatialPolygonsDataFrame} with 17,727 elements
#' @docType data
#' @keywords dataset
#' @source John H. Long, et al., \emph{Atlas of Historical County Boundaries},
#'   Dr. William M. Scholl Center for American History and Culture, The Newberry
#'   Library, Chicago (2010), \url{http://publications.newberry.org/ahcbp/}.
#'
#'   See also the
#'   \href{http://publications.newberry.org/ahcbp/project.html}{AHCB's about
#'   page}.
#' @usage hist_us_counties
"hist_us_counties"
