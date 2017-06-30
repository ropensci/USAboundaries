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
                                       "CT",
                                       "ME",
                                       "new Hampshire"))

test_that("The correct type of object is returned", {
  expect_is(current_state, "sf")
  expect_is(current_county, "sf")
  expect_is(current_west_coast, "sf")
  expect_is(state, "sf")
  expect_is(county, "sf")
  expect_is(newengland, "sf")
})

test_that("The objects have the correct number of rows/polygons", {
  expect_equal(nrow(current_state),
               nrow(USAboundaries::states_contemporary_lores))
  expect_equal(nrow(current_county),
               nrow(USAboundariesData::counties_contemporary_lores))
  expect_equal(nrow(state), 48)
  expect_equal(nrow(county), 2286)
})

test_that("Output can be filtered by state", {
  expect_equal(nrow(current_west_coast), 3)
  expect_equal(nrow(newengland), 6)
})

test_that("Error message if Congressional boundaries are requested by date", {
  expect_error(us_boundaries("1890-02-12", type = "congressional"))
})
