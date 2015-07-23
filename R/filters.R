filter_by_date <- function(shp, map_date, start_col, end_col) {
  filter <- as.Date(shp[[start_col]]) <= map_date &
    as.Date(shp[[end_col]]) >= map_date
  shp[filter, ]
}

filter_by_states <- function(shp, states, state_col) {
  if (is.null(states)) return(shp)
  stopifnot(is.character(states))
  filter <- tolower(shp[[state_col]]) %in% tolower(states)
  if (sum(filter, na.rm = TRUE) < 1) stop("No matches found for those states.")
  shp[filter, ]
}
