context("US Congressional Districts")

test_that("Returns current congressional districts", {
  expect_identical(us_congressional(), USAboundaries::cb_2014_us_cd114_20m)
})

test_that("States can be filtered", {
  expect_equal(length(us_congressional(states = c("Florida"))), 27)
})

test_that("Correct resolution shapefiles are returned", {
  skip_if_not_installed("USAboundariesData")
  expect_identical(us_congressional(resolution = "low"),
                   USAboundaries::cb_2014_us_cd114_20m)
  expect_identical(us_congressional(resolution = "high"),
                   USAboundariesData::cb_2014_us_cd114_500k)
})
