fortify_boundaries <- function(shp) {
  df <- fortify(shp, region = "id_num") %>%
    mutate(id = as.integer(id)) %>%
    left_join(shp@data, by = c("id" = "id_num"))
}
