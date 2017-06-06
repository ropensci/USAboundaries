context("State Plane Projection")

test_that("Incorrect state value throws an error message", {
  expect_error(state_plane())
  expect_error(state_plane("Mass"))
  expect_error(state_plane("ma"))
  expect_error(state_plane("JB"))
})

test_that("State plane regions can be filtered",{
  expect_equal(state_plane("MA", plane_id = "island", type = "epsg"), 26987L)
  expect_equal(state_plane("MA", plane_id = "ISLAND", type = "epsg"), 26987L)
  expect_identical(state_plane("FL", plane_id = "north", type = "proj4"), "+proj=lcc +lat_1=30.75 +lat_2=29.58333333333333 +lat_0=29 +lon_0=-84.5 +x_0=600000 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs")
})

test_that("Statewide projections can be filtered",{
  expect_equal(state_plane(state = "AK", type = "epsg"), 26935L)
  expect_identical(state_plane(state = "AK", type = "proj4"), "+proj=tmerc +lat_0=54 +lon_0=-154 +k=0.9999 +x_0=500000 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs")
})
