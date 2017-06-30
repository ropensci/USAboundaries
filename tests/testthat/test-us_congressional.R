context("US Congressional Districts")

test_that("Returns current congressional districts", {
  expect_identical(us_congressional(), USAboundariesData::congress_contemporary_lores)
})

test_that("States can be filtered", {
  expect_equal(nrow(us_congressional(states = c("FL"))), 27)
})

test_that("Correct resolution shapefiles are returned", {
  skip_if_not_installed("USAboundariesData")
  expect_identical(us_congressional(resolution = "low"),
                   USAboundariesData::congress_contemporary_lores)
  expect_identical(us_congressional(resolution = "high"),
                   USAboundariesData::congress_contemporary_hires)
})
