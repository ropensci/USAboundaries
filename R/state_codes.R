#' State codes and abbreviations for U.S. states and territories
#'
#' This data frame includes abbreviations and codes for states and territories
#' in the United States. It is intended as a lookup table.
#'
#' @format A data.frame with 69 rows and 4 variables:
#' \describe{
#' \item{state_name}{The state or territory name}
#' \item{state_abbr}{The two character abbreviation for the state or territory.}
#' \item{state_code}{A 3-digit numeric FIPS code for the state or territory.}
#' \item{jurisdiction_type}{One of \code{state}, \code{territory}, or
#' \code{district}.}
#' }
#'
#' @references U.S. Census Bureau,
#'   \href{https://www.census.gov/geographies/reference-files/time-series/geo/gazetteer-files.2024.html}{U.S.
#'   Gazeteer Files} (2024).
#'
#'   \href{https://en.wikipedia.org/wiki/Federal_Information_Processing_Standard_state_code}{Federal Information Processing Standard state code}
#'   Wikipedia (accessed October
#'   12, 2025).
"state_codes"
