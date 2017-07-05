context("US States (standalone)")

test_that("No date returns current states", {
  expect_identical(us_states(), USAboundaries::states_contemporary_lores)
})

test_that("Dates outside the valid range have an error message", {
  expect_error(us_states("1780-02-03"))
  expect_error(us_states("2015-06-17"))
})

test_that("Current states can be filtered", {
  expect_equal(nrow(us_states(states = c("Virginia", "Maryland"))), 2)
})

test_that("Error message if no matches are found", {
  expect_error(us_states(states = "No place"), "No matches found")
})

