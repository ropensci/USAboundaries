context("US States")

test_that("No date returns current states", {
  expect_identical(us_states(), USAboundaries::cb_2014_us_state_20m)
})

test_that("Dates outside the valid range have an error message", {
  expect_error(us_states("1780-02-03"))
  expect_error(us_states("2015-06-17"))
})

test_that("Current states can be filtered", {
  expect_equal(length(us_states(states = c("Virginia", "Maryland"))), 2)
})

test_that("Error message if no matches are found", {
  expect_error(us_states(states = "No place"), "No matches found")
})

test_that("Historical states can be filtered", {
  expect_equal(length(us_states("1875-01-02",
                                states = c("Virginia", "Maryland"))),
               2)
})

test_that("Correct resolution shapefiles are returned", {
  skip_if_not_installed("USAboundariesData")
  expect_identical(us_states(resolution = "low"),
                   USAboundaries::cb_2014_us_state_20m)
  expect_identical(us_states(resolution = "high"),
                   USAboundariesData::cb_2014_us_state_500k)
})
