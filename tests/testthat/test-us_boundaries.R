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

test_that("The correct type of object is returned", {
  expect_is(state, "SpatialPolygonsDataFrame")
  expect_is(county, "SpatialPolygonsDataFrame")
})

test_that("The objects have the correct number of rows/polygons", {
  expect_equal(length(state), 48)
  expect_equal(length(county), 2286)
})

test_that("Output can be filtered by state", {
  expect_equal(length(newengland), 6)
})
