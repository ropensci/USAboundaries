filter_by_date <- function(shp, map_date) {
  filter <- shp$start_date <= map_date & shp$end_date >= as.Date(map_date)
  shp[filter, ]
}

filter_by_states <- function(shp, states) {
  if (is.null(states)) return(shp)
  stopifnot(is.character(states))
  states <- tolower(states)
  filter <- (tolower(shp$state_terr) %in% states) |
    (tolower(shp$state_abbr) %in% states)
  if (sum(filter, na.rm = TRUE) < 1) stop("No matches found for those states.")
  shp[filter, ]
}
