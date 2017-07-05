context("US Zipcodes")

test_that("Zipcodes functions returns an sf object", {
  expect_is(us_zipcodes(), "sf")
})
