context("US boundaries")

state  <- us_boundaries(as.Date("1865-07-04"), type = "state")
county <- us_boundaries(as.Date("1865-07-04"), type = "county")

test_that("The correct type of object is returned", {
  expect_that(class(state), is_equivalent_to("SpatialPolygonsDataFrame"))
  expect_that(class(county), is_equivalent_to("SpatialPolygonsDataFrame"))
})

test_that("The objects have the correct number of rows/polygons", {
  expect_that(length(state), equals(48))
  expect_that(length(county, equals(2286))
})
