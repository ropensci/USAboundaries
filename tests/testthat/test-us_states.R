context("US States")

test_that("No date returns current states", {
  expect_identical(us_states(), cb_2014_us_state_20m)
})

test_that("Dates outside the valid range have an error message", {
  expect_error(us_states("1780-02-03"))
  expect_error(us_states("2015-06-17"))
})

test_that("Current states can be filtered", {
  expect_equal(length(us_states(states = c("Virginia", "Maryland"))), 2)
})

test_that("Historical states can be filtered", {
  expect_equal(length(us_states("1875-01-02",
                                states = c("Virginia", "Maryland"))),
               2)
})
