test_that("Zipcodes functions returns an sf object", {
  skip_if_not_installed("USAboundariesData")
  expect_s3_class(us_zipcodes(), "sf")
})
