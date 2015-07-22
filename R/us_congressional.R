#' @export
us_congressional <- function(resolution = c("20m", "5m", "500k"),
                             states = NULL) {
  resolution <- match.arg(resolution)
  shpname <- paste0("cb_2014_us_cd114_", resolution)
  shp <- get(shpname, "package:USAboundariesData")
  filter_by_states(shp, states, "state_name")
}
