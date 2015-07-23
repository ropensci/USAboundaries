context("US Zipcodes")

test_that("Returns current zipcode tabulation areas", {
  expect_identical(us_zipcodes(), USAboundariesData::cb_2014_us_zcta510_500k)
})

test_that("States can be filtered", {
  expect_equal(length(us_zipcodes(states = c("Ohio"))), 1196)
})
