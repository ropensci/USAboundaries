#' @export
us_congressional <- function(resolution = c("20m"), states = NULL) {
  resolution <- match.arg(resolution)
  filter_by_states(cb_2014_us_cd114_20m, states, "state_name")
}
