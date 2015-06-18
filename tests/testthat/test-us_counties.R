context("US Counties")
library(USAboundariesData)

test_that("No date returns current counties", {
  expect_identical(us_counties(), cb_2014_us_county_20m)
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
  expect_identical(us_counties(resolution = "20m"),
                   USAboundaries::cb_2014_us_county_20m)
  expect_identical(us_counties(resolution = "5m"),
                   USAboundariesData::cb_2014_us_county_5m)
  expect_identical(us_counties(resolution = "500k"),
                   USAboundariesData::cb_2014_us_county_500k)
})
