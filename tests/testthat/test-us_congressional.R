context("US Congressional Districts")

test_that("Returns current congressional districts", {
  expect_identical(us_congressional(), cb_2014_us_cd114_20m)
})

test_that("States can be filtered", {
  expect_equal(length(us_congressional(states = c("Florida"))), 27)
})

