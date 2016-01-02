context("US boundaries")

current_state <- us_boundaries(type = "state")
current_county <- us_boundaries(type = "county")
current_west_coast <- us_boundaries(states = c("Washington",
                                               "Oregon",
                                               "California"))
state  <- us_boundaries(as.Date("1865-07-04"), type = "state")
county <- us_boundaries(as.Date("1865-07-04"), type = "county")
newengland <- us_boundaries(as.Date("1895-04-02"),
                            type = "state",
                            states = c("massachusetts",
                                       "verMONT",
                                       "RHODE ISLAND",
                                       "Connecticut",
                                       "Maine",
                                       "new Hampshire"))

test_that("The correct type of object is returned", {
  expect_is(current_state, "SpatialPolygonsDataFrame")
  expect_is(current_county, "SpatialPolygonsDataFrame")
  expect_is(current_west_coast, "SpatialPolygonsDataFrame")
  expect_is(state, "SpatialPolygonsDataFrame")
  expect_is(county, "SpatialPolygonsDataFrame")
  expect_is(newengland, "SpatialPolygonsDataFrame")
})

test_that("The objects have the correct number of rows/polygons", {
  expect_equal(length(current_state),
               length(USAboundaries::cb_2014_us_state_20m))
  expect_equal(length(current_county),
               length(USAboundaries::cb_2014_us_county_20m))
  expect_equal(length(state), 48)
  expect_equal(length(county), 2286)
})

test_that("Output can be filtered by state", {
  expect_equal(length(current_west_coast), 3)
  expect_equal(length(newengland), 6)
})

test_that("Error message if Congressional boundaries are requested by date", {
  expect_error(us_boundaries("1890-02-12", type = "congressional"))
})

