context("US Cities")

test_that("Cities function can take multiple kinds of input", {
  expect_gt(nrow(us_cities()), 1)
  expect_gt(nrow(us_cities("1806-12-30")), 1)
  expect_gt(nrow(us_cities(as.Date("1806-12-30"))), 1)
  expect_gt(nrow(us_cities(1806)), 1)
  expect_error(us_cities(2020))
  expect_error(us_cities(1789))
  expect_message(us_cities())
})

test_that("Cities function returns an sf data.frame", {
  expect_is(us_cities(1876), "data.frame")
  expect_is(us_cities(1976), "sf")
})

test_that("Cities function can be filtered by state", {
  nc <- us_cities(2010, states = "NC")
  sc <- us_cities(1876, states = "South Carolina")
  expect_identical(unique(nc$state_name), "North Carolina")
  expect_identical(unique(sc$state_abbr), "SC")
})
