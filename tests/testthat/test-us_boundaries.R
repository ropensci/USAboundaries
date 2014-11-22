context("US boundaries")

state  <- us_boundaries(as.Date("1865-07-04"), type = "state")
county <- us_boundaries(as.Date("1865-07-04"), type = "county")
newengland <- us_boundaries(as.Date("1895-04-02"), type = "state",
                            states = c("massachusetts",
                                       "verMONT",
                                       "RHODE ISLAND",
                                       "Connecticut",
                                       "Maine",
                                       "new Hampshire"))

state_df <- us_boundaries(as.Date("1978-02-01"),
                          type = "state", format = "df")

county_df <- us_boundaries(as.Date("1978-02-01"),
                           type = "state", format = "df")

test_that("The correct type of object is returned", {
  expect_that(class(state), is_equivalent_to("SpatialPolygonsDataFrame"))
  expect_that(class(county), is_equivalent_to("SpatialPolygonsDataFrame"))
})

test_that("The objects have the correct number of rows/polygons", {
  expect_that(length(state), equals(48))
  expect_that(length(county), equals(2286))
})

test_that("Output can be filtered by state", {
  expect_that(length(newengland), equals(6))
})

test_that("Can return a data frame", {
  expect_that(class(state_df), is_equivalent_to("data.frame"))
  expect_that(class(county_df), is_equivalent_to("data.frame"))
})

test_that("Data frames have plotting information", {
  plotcols <- c("id", "long", "lat", "order", "hole", "piece", "group")
  expect_that(all(plotcols %in% colnames(state_df)), is_true())
  expect_that(all(plotcols %in% colnames(county_df)), is_true())
})

test_that("Data frames have descriptive data", {
  datacols <- c("start_date", "end_date", "change", "citation", "start_n",
                "end_n", "area_sqmi", "terr_type", "full_name", "abbr_name",
                "name_start", "start_posix", "end_posix")
  expect_that(all(datacols %in% colnames(state_df)), is_true())
  expect_that(all(datacols %in% colnames(county_df)), is_true())
})
