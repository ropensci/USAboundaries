test_that("Zipcodes functions returns an sf object", {
  expect_s3_class(us_zipcodes(), "sf")
})
