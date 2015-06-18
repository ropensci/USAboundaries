context("US Congressional Districts")
library(USAboundariesData)

test_that("Returns current congressional districts", {
  expect_identical(us_congressional(), cb_2014_us_cd114_20m)
})

test_that("States can be filtered", {
  expect_equal(length(us_congressional(states = c("Florida"))), 27)
})

test_that("Correct resolution shapefiles are returned", {
  expect_identical(us_congressional(resolution = "20m"),
                   USAboundaries::cb_2014_us_cd114_20m)
  expect_identical(us_congressional(resolution = "5m"),
                   USAboundariesData::cb_2014_us_cd114_5m)
  expect_identical(us_congressional(resolution = "500k"),
                   USAboundariesData::cb_2014_us_cd114_500k)
})
