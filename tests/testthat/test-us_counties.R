context("US Counties")

test_that("No date returns current counties", {
  expect_identical(us_counties(), USAboundaries::cb_2014_us_county_20m)
})

test_that("Dates outside the valid range have an error message", {
  expect_error(us_counties("1600-02-03"))
  expect_error(us_counties("2015-06-17"))
})

test_that("Current states can be filtered", {
  expect_equal(length(us_counties(states = c("Virginia"))), 133)
})

test_that("Historical states can be filtered", {
  expect_equal(length(us_counties("1855-01-02", states = c("Ohio"))), 88)
})

test_that("Correct resolution shapefiles are returned", {
  skip_if_not_installed("USAboundariesData")
  expect_identical(us_counties(resolution = "low"),
                   USAboundaries::cb_2014_us_county_20m)
  expect_identical(us_counties(resolution = "high"),
                   USAboundariesData::cb_2014_us_county_500k)
})
